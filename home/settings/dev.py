'''Use this for development'''

from .base import *


ALLOWED_HOSTS += ['localhost','natoosa.com']
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



