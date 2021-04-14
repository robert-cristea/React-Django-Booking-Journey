'''Use this for development'''

from .base import *

ALLOWED_HOSTS += ['3.23.24.90','localhost']
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
    'http://*'
    'http://3.23.24.90',
    'http://localhost:3000',
    
)
# CSRF_COOKIE_SECURE = True
