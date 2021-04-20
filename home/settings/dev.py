'''Use this for development'''

from .base import *


ALLOWED_HOSTS += ['3.23.24.90','localhost','3.133.142.214']
DEBUG = True

WSGI_APPLICATION = 'home.wsgi.dev.application'

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

# CORS_ORIGIN_WHITELIST = (
#     'http://*',
#     'http://3.23.24.90',
#     'http://localhost:3000',
# )


