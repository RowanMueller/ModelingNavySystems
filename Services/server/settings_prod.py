from .settings import *

DEBUG = False
ALLOWED_HOSTS = ['*']  # Replace with your domain in production

# Security settings
SECURE_SSL_REDIRECT = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SECURE_BROWSER_XSS_FILTER = True
SECURE_CONTENT_TYPE_NOSNIFF = True
X_FRAME_OPTIONS = 'DENY'

# Static files
STATIC_ROOT = '/usr/share/nginx/html/static'
MEDIA_ROOT = '/usr/share/nginx/html/media'

# CORS settings
CORS_ALLOWED_ORIGINS = [
    "https://your-domain.com",  # Replace with your domain
]
CORS_ALLOW_CREDENTIALS = True 