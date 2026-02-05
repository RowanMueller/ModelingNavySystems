# ModelingNavySystems — Project Overview

High-level summary of technologies, structure, and domain for onboarding and future development.

---

## 1. What This Project Does

**ModelingNavySystems** is a full-stack web app for modeling navy systems: users can create systems, upload SysML/CSV data, visualize systems as node/edge graphs, and export to SysML. It includes auth, multi-version systems, and device/connection modeling.

---

## 2. Languages & Runtimes

| Layer      | Language  | Runtime / notes        |
|-----------|-----------|-------------------------|
| Backend   | **Python**| 3.11 (see Dockerfile)   |
| Frontend  | **JavaScript** (JSX) | Node for build; ES modules |
| Database  | **SQL** (via Django ORM) | PostgreSQL 14 |
| Config / scripts | Shell, YAML, JSON | Docker, npm, Django |

---

## 3. Main Technologies & Tools

### Backend
- **Django 5.1** — web framework
- **Django REST Framework** — REST API
- **django-rest-framework-simplejwt** — JWT auth (access + refresh)
- **django-cors-headers** — CORS for frontend
- **PostgreSQL** — `psycopg2-binary`
- **pandas** — CSV processing
- **openpyxl** — Excel (if used)
- **python-dotenv** — env loading

### Frontend
- **React 19** — UI
- **Vite 6** — dev server & build
- **React Router 7** — routing
- **@xyflow/react** — node/edge graph (React Flow)
- **Tailwind CSS** — styling
- **Framer Motion** — animations
- **Axios** — HTTP
- **react-hot-toast** — toasts
- **react-dropzone** — file upload
- **Lucide React / react-icons** — icons

### DevOps & runtime
- **Docker & Docker Compose** — app + DB + frontend
- **nginx** — serves built frontend (see `nginx/react.conf`)
- **Firebase** — optional hosting (Views has `.firebaserc`, `firebase.json`)

---

## 4. Repository Layout (High Level)

```
ModelingNavySystems/
├── manage.py              # Django CLI (run from repo root)
├── requirements.txt       # Python deps
├── docker-compose.yml     # web (Django), frontend (nginx), db (Postgres)
├── Dockerfile             # Backend image
├── init-db.sh             # DB init for Docker
├── docker-entrypoint.sh   # Container entry
├── nginx/
│   └── react.conf         # nginx config for SPA
├── Services/              # Django project
│   ├── server/            # Django project config
│   │   ├── settings.py
│   │   ├── urls.py        # Root URLconf → api/v1/ → rest
│   │   ├── wsgi.py, asgi.py
│   ├── rest/              # Main Django app (API + models)
│   │   ├── models.py      # User, System, Device, Connection
│   │   ├── views.py       # All API views (~760 lines)
│   │   ├── urls.py        # API routes
│   │   ├── serializers.py
│   │   ├── auth.py        # Register / Login
│   │   ├── sysml_writer.py
│   │   └── migrations/
│   └── uploads/           # Uploaded SysML files
├── Views/                 # React frontend
│   ├── package.json       # Vite, React, Tailwind, etc.
│   ├── vite.config.js
│   ├── src/
│   │   ├── App.jsx        # Routes + AuthProvider
│   │   ├── authContext.jsx, ProtectedRoute.jsx
│   │   ├── Dashboard.jsx, UploadPage.jsx, Download.jsx
│   │   ├── SignIn.jsx, SignUp.jsx
│   │   └── graph_page/    # Graph UI (React Flow)
│   └── Dockerfile         # Build + nginx serve
├── Tests/                 # Test assets (e.g. .sysml)
└── docs/                  # Project docs (this file, etc.)
```

**Note:** Django is run from the **repo root** with `DJANGO_SETTINGS_MODULE=Services.server.settings` and `PYTHONPATH` including the root, so imports use `Services.rest`, `Services.server`.

---

## 5. Data Model (Core)

- **User** — Django auth user; owns systems.
- **System** — Name, User, Version, NodeCount, EdgeCount.
- **Device** — Belongs to a System (and SystemVersion); many asset/location fields; Xposition, Yposition for graph.
- **Connection** — Source/Target devices, System, SystemVersion, ConnectionType, ConnectionDetails (JSON).

API is under `/api/v1/` (see `Services/server/urls.py` and `Services/rest/urls.py`).

---

## 6. Frontend Routes

| Path                 | Page        | Protected |
|----------------------|------------|-----------|
| `/`                  | Redirect to `/dashboard` | — |
| `/dashboard`         | Dashboard  | Yes       |
| `/system/:id/:version` | Graph view | Yes    |
| `/upload`            | Upload     | Yes       |
| `/download`          | Download   | Yes       |
| `/sign-in`, `/sign-up` | Auth      | No        |

---

## 7. Quick Run (Local)

- **Backend:** From repo root, `cd Services && python manage.py runserver` (requires venv, `pip install -r requirements.txt`, and Postgres or Docker).
- **Frontend:** `cd Views && npm i && npm run dev` (Vite default: http://localhost:5173).
- **Full stack:** `docker-compose up` (backend on 8000, frontend on 3000, Postgres with healthcheck).

See root `README.md` for detailed run instructions.

---

## 8. Where to Go Next

- **Refactoring and documentation plan:** `docs/REFACTORING_AND_DOCS.md`
- **Adding features:** follow the structure in that doc (API in `Services/rest/`, UI in `Views/src/`, routes in `App.jsx` and `Services/rest/urls.py`).
