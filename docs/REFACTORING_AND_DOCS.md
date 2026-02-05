# Refactoring & Documentation Plan

Actionable plan to improve code structure and documentation so new features are easier to implement. Use alongside `docs/PROJECT_OVERVIEW.md`.

---

## Goals

1. **Clearer structure** — Consistent layout, naming, and separation of concerns.
2. **Easier navigation** — New devs (or you in 10 months) can find where to add/changes things.
3. **Documentation** — READMEs, API notes, and a simple “how to add a feature” guide.

---

## Phase 1: Documentation (Low Risk, High Value)

Do this first; no code behavior changes.

### 1.1 Root README

- [ ] **Update root `README.md`**  
  - One-paragraph project summary.  
  - “Tech stack” section pointing to `docs/PROJECT_OVERVIEW.md`.  
  - “Quick start” for local run (backend + frontend + Docker).  
  - Link to `docs/PROJECT_OVERVIEW.md` and `docs/REFACTORING_AND_DOCS.md`.

### 1.2 API documentation

- [ ] **Add `docs/API.md`** (or keep a short section in `PROJECT_OVERVIEW.md`):  
  - Base URL: `/api/v1/`.  
  - List endpoints by area (auth, systems, devices, connections, upload, download).  
  - For each: method, path, brief purpose, auth (JWT).  
  - Optionally document request/response shapes for the main endpoints (e.g. save-graph, get-devices, get-connections).

### 1.3 “How to add a feature” guide

- [ ] **Add `docs/ADDING_FEATURES.md`** with short steps, e.g.:  
  - **New API endpoint:** add view in `Services/rest/`, register in `Services/rest/urls.py`, add serializer if needed.  
  - **New page:** add route in `Views/src/App.jsx`, create page under `Views/src/` (or `pages/` if you introduce that).  
  - **New model:** add in `Services/rest/models.py`, run `makemigrations` / `migrate`, then serializers and views.

---

## Phase 2: Backend Refactoring (Formatting & Structure)

### 2.1 Split `Services/rest/views.py` (High impact)

`views.py` is large (~760 lines) and mixes many concerns. Split by domain:

- [ ] **Create `Services/rest/views/` package:**  
  - `__init__.py` — re-export all view classes so `from Services.rest.views import ...` still works, or update `urls.py` to import from submodules.  
  - `devices.py` — `DeviceListCreate`, `GetDevicesView`, `GetAllDevices`.  
  - `connections.py` — `GetConnectionsView`.  
  - `systems.py` — `GetAllSystems`, `CreateSystemView`, `UploadNewSystemVersion`, `SaveSystem`, `DeleteSystemView`, `RenameSystemView`, `SystemDetailView`.  
  - `upload.py` — `FileUploadView` (and any SysML/CSV parsing helpers you move out).  
  - `download.py` — `DownloadSysMLView` (and SysML writing helpers).

- [ ] **Update `Services/rest/urls.py`** to import from the new modules (e.g. `from .views.systems import ...`).

- [ ] **Optional:** Move SysML generation (e.g. `write_sysml_text`, `write_devices`, `write_connections`) from the download view into `sysml_writer.py` or a dedicated `sysml/` module so views stay thin.

### 2.2 Naming and style consistency (Backend)

- [ ] **Models:** Prefer `snake_case` for field names (Django convention), e.g. `name`, `user`, `edge_count`, `node_count`, `x_position`, `y_position`.  
  - This requires migrations and updating serializers/views/frontend; do in a dedicated PR and run tests.

- [ ] **Remove duplicate imports** in `views.py` (e.g. `APIView`, `Response`, `status` imported twice) when you split files.

### 2.3 Settings and env

- [ ] **`Services/server/settings.py`:**  
  - Use `SECRET_KEY = os.getenv('SECRET_KEY', '...')` (and document in README or `.env.example` that production must set it).  
  - Avoid hardcoding `DEBUG = True`; use `DEBUG = os.getenv('DEBUG', '0') == '1'` and document.

- [ ] **Add `.env.example`** at repo root with placeholders: `DATABASE_URL`, `SECRET_KEY`, `DEBUG`, `POSTGRES_*`, etc., so new clones know what to set.

---

## Phase 3: Frontend Refactoring (Structure & Clarity)

### 3.1 Folder structure

- [ ] **Introduce clear folders** under `Views/src/`:  
  - `pages/` — `Dashboard.jsx`, `UploadPage.jsx`, `Download.jsx`, `SignIn.jsx`, `SignUp.jsx`, `GraphPage.jsx` (move from `graph_page/` or keep and add `pages/` for the rest).  
  - `components/` — shared UI (e.g. `ProtectedRoute`, `loading`, any reused buttons/cards).  
  - `context/` — `authContext.jsx`, `graphContext.js` / `GraphProvider.jsx`.  
  - `hooks/` — `useGraph.js`.  
  - Keep `graph_page/` as a feature folder if you prefer, and document the convention in `docs/PROJECT_OVERVIEW.md` or `ADDING_FEATURES.md`.

### 3.2 API layer

- [ ] **Centralize API calls:**  
  - Add a small `api/` or `services/` module (e.g. `api/client.js` or `api/systems.js`, `api/auth.js`) that uses Axios with base URL and JWT attachment.  
  - Have pages/components call these functions instead of raw `axios.get/post` scattered in components.  
  - Makes it easier to add error handling, logging, and to document “all backend calls go through here.”

### 3.3 Naming and formatting

- [ ] **Consistent file names:** e.g. React components in `PascalCase.jsx`, hooks in `camelCase.js`, context in `camelCase.jsx` or `PascalCase.jsx` — pick one and document in `ADDING_FEATURES.md`.

---

## Phase 4: Testing & Quality (Ongoing)

- [ ] **Backend:** Add a few integration tests for critical API routes (e.g. create system, save graph, get devices) using Django’s test client and a test DB.  
- [ ] **Frontend:** Optionally add a test script (e.g. Vitest) and one or two smoke tests for the main routes.  
- [ ] **Pre-commit or CI:** Run lint/format (e.g. Black, Ruff for Python; ESLint/Prettier for JS) so formatting stays consistent.

---

## Phase 5: Optional Improvements

- **Django app name:** The app is under `Services/rest/` but often referred to as “rest”. Consider renaming to something like `core` or `api` for clarity (requires updating `INSTALLED_APPS`, imports, and `include()` in root `urls.py`).  
- **SystemDetailView:** Uses `system.Users`; the current `System` model has a single `User` FK. Confirm intended behavior and fix or remove the view.  
- **Duplicate uploads:** There is an `uploads/` at repo root and `Services/uploads/`; document which is used in Docker vs local and whether both are needed.

---

## Suggested Order of Work

1. **Week 1:** Phase 1 (all docs) + `.env.example` and README update.  
2. **Week 2:** Phase 2.1 (split views) + 2.3 (env/settings).  
3. **Week 3:** Phase 3.1 (frontend folders) + 3.2 (API layer).  
4. **Ongoing:** Phase 2.2 (model renames in a single PR), Phase 4 (tests, lint).

This order gives you immediate clarity from docs and then incremental, low-risk refactors that make “where do I add X?” obvious for future features.
