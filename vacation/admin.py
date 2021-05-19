from django.contrib import admin

from .models import City, User, UserCity

# Register your models here.
admin.site.register(User)
admin.site.register(City)
admin.site.register(UserCity)
