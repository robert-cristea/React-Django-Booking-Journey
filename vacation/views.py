import json
from datetime import datetime

from django.http import HttpResponse
from django.shortcuts import render

from .models import User

# from django.views.decorators.csrf import csrf_exempt

# Create your views here.
def storeData(request):
    if request.method == "POST":
        print('POST method is existed!')

        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')

        if x_forwarded_for:
            ipaddress = x_forwarded_for.split(',')[-1].strip()
        else:
            ipaddress = request.META.get('REMOTE_ADDR')
        
        user = User()
        user.user_ip = ipaddress
      
        json_data = json.loads(request.body)
        who = json_data['who']
        for i in range (0,len(who)):
            if(who[i].lower() == "solo"):
                user.solo= 1
            if(who[i].lower() == "family"):
                user.family= 1
            if(who[i].lower() == "friends"):
                user.friends= 1
            if(who[i].lower() == "couple"):
                user.couple= 1
        
        number = json_data['number']
        if len(number) != 0:
            number = number[0]
        if(number == 1):
            user.one_passengers= 1
        if(number == 2):
            user.two_passengers= 1
        if(number == 3):
            user.three_passengers= 1
        if(number == 4):
            user.four_passengers= 1
        if(number == 5):
            user.five_passengers= 1
        if(number == 6):
            user.six_passengers= 1
      
        theme = json_data['theme']
        for i in range (0,len(theme)):
            if(theme[i].lower() == "beach"):
                user.beach= 1
            if(theme[i].lower() == "city life"):
                user.city_life= 1
            if(theme[i].lower() == "nature"):
                user.nature= 1
            if(theme[i].lower() == "surprise me"):
                user.surprise= 1
            if(theme[i].lower() == "country side"):
                user.countryside= 1
            if(theme[i].lower() == "other"):
                user.other= 1

        howlong = json_data['howlong']
        for i in range (0,len(howlong)):
            if(howlong[i].lower() == "weekend"):
                user.weekend= 1
            if(howlong[i].lower() == "weekish"):
                user.weekish= 1
            if(howlong[i].lower() == "long weekend"):
                user.long_weekend= 1
            if(howlong[i].lower() == "midweek"):
                user.midweek= 1
            if(howlong[i].lower() == "2 weeks"):
                user.two_weeks= 1
            if(howlong[i].lower() == "3 weeks"):
                user.three_weeks= 1
            if(howlong[i].lower() == "4 weeks"):
                user.four_weeks= 1
            if(howlong[i].lower() == "5 weeks"):
                user.five_weeks= 1

        user.save()
       
        return HttpResponse("Post method is received!")
