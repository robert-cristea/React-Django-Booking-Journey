from django.contrib import admin
from vacation.models import CityFeature, UserFeature, UserCity

# Register your models here.
admin.site.register(UserFeature)
admin.site.register(CityFeature)
admin.site.register(UserCity)
