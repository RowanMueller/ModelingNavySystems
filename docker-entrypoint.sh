#!/bin/bash

# Wait for database to be ready
echo "Waiting for postgres..."
while ! nc -z db 5432; do
  sleep 0.1
done
echo "PostgreSQL started"

# Make migrations
python manage.py makemigrations

# Apply migrations
python manage.py migrate

# Start server
python manage.py runserver 0.0.0.0:8000 