'''Use this for development'''

from .base import *

ALLOWED_HOSTS += ['127.0.0.1','localhost']
DEBUG = True

WSGI_APPLICATION = 'home.wsgi.dev.application'

DATABASES = {
    # 'default': {
    #     'ENGINE': 'django.db.backends.sqlite3',
    #     'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    # }
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'natoosa',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

CORS_ORIGIN_WHITELIST = (
    'http://localhost:8000',
    'http://localhost:3000',
    'http://*'
    
)
# CSRF_COOKIE_SECURE = True
