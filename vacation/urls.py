from django.urls import path

from . import views

app_name = 'vacation'
urlpatterns = [
    path('storeData', views.storeData, name='storeData'),
    path('updateData', views.updateData, name='updateData'),
    path('getCityInfo', views.getCityInfo, name='getCityInfo'),
    path('add-rating-matching', views.addRatingMatching, name='addRatingMatching'),
]