#!/bin/bash

# Wait for database to be ready
echo "Waiting for postgres..."
while ! nc -z db 5432; do
  sleep 0.1
done
echo "PostgreSQL started"

# Ensure upload directory exists (default storage writes to MEDIA_ROOT/uploads).
mkdir -p "${MEDIA_ROOT:-/data}/uploads"

# Make migrations
python manage.py makemigrations

# Apply migrations
python manage.py migrate

# Create a default user if configured (safe for local Docker only).
if [ -n "${DEFAULT_USERNAME}" ] && [ -n "${DEFAULT_PASSWORD}" ]; then
python manage.py shell <<'PY'
import os
from django.contrib.auth import get_user_model

User = get_user_model()
username = os.environ.get("DEFAULT_USERNAME")
password = os.environ.get("DEFAULT_PASSWORD")
email = os.environ.get("DEFAULT_EMAIL") or ""

if username and password:
    user, created = User.objects.get_or_create(
        username=username,
        defaults={"email": email},
    )
    if created:
        user.set_password(password)
        user.save()
        print(f"Created default user: {username}")
    else:
        print(f"Default user already exists: {username}")
PY
fi

# Start server
python manage.py runserver 0.0.0.0:8000 