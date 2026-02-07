# Clean Docker Setup (Mac Studio)

This project is now configured to run purely in Docker without writing to your host machine outside the repo and Docker volumes.

## What changed

- **Frontend Dockerfile restored** so `docker compose` can build and serve the React app.
- **Backend no longer bind-mounts the repo** to avoid accidental host writes.
- **Uploads stored in a Docker volume** (`uploads`) instead of the repo.
- **Django settings now use env defaults** for `SECRET_KEY`, `DEBUG`, `ALLOWED_HOSTS`, and database config.
- **CORS allows the Docker frontend** on `http://localhost:3001`.
- **SysML export writes into the media volume** while still returning a relative path.
- **Backend entrypoint runs migrations** after waiting for Postgres.
- **Frontend build uses `VITE_BASE_URL`** so it points to your local Docker backend.
- **Default login is created in Docker** (configurable via env vars).
- **Health endpoint added** at `/health/` to verify backend reachability.
- **Frontend port is configurable** (defaults to `3001` to avoid conflicts).
- **DB init script fixed** to avoid heredoc parsing errors in Postgres init.

## How to run

From the repo root:

```bash
docker compose up --build
```

Services:

- **Backend**: http://localhost:8000
- **Health check**: http://localhost:8000/health/
- **Frontend**: http://localhost:3001 (or `${FRONTEND_PORT}` if set)

Default login (created at startup):

- Username: `example`
- Password: `123456`

## Cleanup (no host mess)

To remove containers and all Docker-managed data (including Postgres + uploads):

```bash
docker compose down -v
```

## Optional: override settings safely

Create a local `.env` file in the repo root if you want custom values. Example:

```
DEBUG=1
SECRET_KEY=your-local-dev-secret
ALLOWED_HOSTS=localhost,127.0.0.1
POSTGRES_DB=navydb
POSTGRES_USER=navyuser
POSTGRES_PASSWORD=changeThisPassword
VITE_BASE_URL=http://localhost:8000
DEFAULT_USERNAME=example
DEFAULT_PASSWORD=123456
DEFAULT_EMAIL=example@example.com
```

Docker Compose will automatically load `.env` if present.
