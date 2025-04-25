#!/bin/bash

# Wait for database
echo "Waiting for postgres..."
while ! nc -z db 5432; do
  sleep 0.1
done
echo "PostgreSQL started"

# Apply database migrations
cd /app
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Start Gunicorn in the background
gunicorn Services.server.wsgi:application --bind 127.0.0.1:8000 --workers 3 --daemon

# Start Nginx
echo "Starting Nginx..."
nginx -g 'daemon off;' 