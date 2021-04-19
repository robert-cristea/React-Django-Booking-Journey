'''Use this for production'''

from .base import *

DEBUG = False
ALLOWED_HOSTS += ['http://3.23.24.90']
WSGI_APPLICATION = 'home.wsgi.prod.application'

DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': 'natoosa',
    'USER': 'root',
    'PASSWORD': '',
    'HOST': 'localhost',
    'PORT': '3306',
    }
}

AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

STATICFILES_STORAGE = 'whitenoise.django.GzipManifestStaticFilesStorage'

CORS_ORIGIN_WHITELIST = (
    'http://3.23.24.90',
    'http://localhost:3000',
    'http://*'
)


STATIC_ROOT = os.path.join(BASE_DIR, "static")
print(BASE_DIR)
STATIC_URL = '/static/'
