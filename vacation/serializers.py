from rest_framework import serializers
from .models import City

class CitySerializer(serializers.ModelSerializer):

    class Meta:
        model = City 
        fields = ('pk', 'city_name', 'country', 'short_description', 'sites', 'picture')