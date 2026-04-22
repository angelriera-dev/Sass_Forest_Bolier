# SECURITY SETTINGS

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "*"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

# OWASP & Hardening Settings (Phase 1)
# These will be tuned for production in config/settings/production.py
SECURE_HSTS_SECONDS = 0
SECURE_CONTENT_TYPE_NOSNIFF = True
SECURE_BROWSER_XSS_FILTER = True
SESSION_COOKIE_HTTPONLY = True
CSRF_COOKIE_HTTPONLY = True
SECURE_SSL_REDIRECT = False
X_FRAME_OPTIONS = 'DENY'
