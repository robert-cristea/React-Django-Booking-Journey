from django.urls import path

from . import views

app_name = 'vacation'
urlpatterns = [
    path('storeData', views.storeData, name='storeData'),
]