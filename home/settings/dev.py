'''Use this for development'''

from .base import *


ALLOWED_HOSTS += ['3.15.204.55','3.23.24.90','localhost','3.133.142.214']
DEBUG = True

WSGI_APPLICATION = 'home.wsgi.application'

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



