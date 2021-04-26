'''Use this for production'''

from .base import *

DEBUG = False

ALLOWED_HOSTS += ['3.15.204.55','http://3.23.24.90',"localhost",'3.133.142.214']
WSGI_APPLICATION = 'home.wsgi.application'

DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': 'natoosa_db',
    'USER': 'user_natoosa',
    'PASSWORD': 'db_password*',
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

STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'


# CORS_ORIGIN_WHITELIST = (
#     'http://3.23.24.90',
#     'http://localhost:3000',
#     'http://*'
# )

STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
