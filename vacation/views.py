import json
import random
from datetime import datetime

from django.core import serializers
from django.http import HttpResponse, JsonResponse
from vacation.models import CityFeature, UserCity, UserFeature

# from django.views.decorators.csrf import csrf_exempt

# Create your views here.
def storeData(request):
    if request.method == "POST":
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ipaddress = x_forwarded_for.split(',')[-1].strip()
        else:
            ipaddress = request.META.get('REMOTE_ADDR')

        user = UserFeature()
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

        user.save()
        # obj = User.objects.filter(id=1)[0].solo
        # print("============================================")
        # print(obj)
        print("useriD================="+str(user.id))
       
        return HttpResponse(str(user.id))

def updateData(request):
    if request.method == "POST":
        json_data = json.loads(request.body)
        userId = json_data['userId']
        budget = json_data['budget']
        months = json_data['months']
        who = json_data['who']
        howlong = json_data['howlong']
        theme = json_data['themes']
        number = json_data['number']
        traveler = json_data['traveler']

        user = UserFeature.objects.get(id=userId)
        user.delete()

        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')

        if x_forwarded_for:
            ipaddress = x_forwarded_for.split(',')[-1].strip()
        else:
            ipaddress = request.META.get('REMOTE_ADDR')

        user = UserFeature()
        user.id = userId
        user.user_ip = ipaddress

        for i in range (0,len(who)):
            if(who[i].lower() == "solo"):
                user.solo= 1
            if(who[i].lower() == "family"):
                user.family= 1
            if(who[i].lower() == "friends"):
                user.friends= 1
            if(who[i].lower() == "couple"):
                user.couple= 1
        
        for i in range (0,len(number)):
            if(number[i] == 1):
                user.one_passengers= 1
            if(number[i] == 2):
                user.two_passengers= 1
            if(number[i] == 3):
                user.three_passengers= 1
            if(number[i] == 4):
                user.four_passengers= 1
            if(number[i] == 5):
                user.five_passengers= 1
            if(number[i] == 6):
                user.six_passengers= 1
      
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
        
        for i in range (0,len(budget)):
            if(budget[i].lower() == "low"):
                user.budget_low= 1
            if(budget[i].lower() == "normal"):
                user.budget_normal= 1
            if(budget[i].lower() == "high"):
                user.budget_high= 1
        
        for i in range (0,len(traveler)):
            if(traveler[i].lower() == "boys"):
                user.comp_allboys= 1
            if(traveler[i].lower() == "girls"):
                user.comp_allgirls= 1
            if(traveler[i].lower() == "elderly"):
                user.comp_elderly= 1
            if(traveler[i].lower() == "kids"):
                user.comp_kids_babies= 1
        
        for i in range (0,len(theme)):
            if(theme[i].lower() == "adventures"):
                user.adventures= 1
            if(theme[i].lower() == "shopping"):
                user.shopping= 1
            if(theme[i].lower() == "romantic"):
                user.romantic= 1
            if(theme[i].lower() == "ski"):
                user.ski= 1
            if(theme[i].lower() == "remote"):
                user.remote= 1
            if(theme[i].lower() == "wildlife"):
                user.wildlife= 1
            if(theme[i].lower() == "hiking"):
                user.hiking= 1
            if(theme[i].lower() == "road trip"):
                user.road_trip= 1
            if(theme[i].lower() == "festivals"):
                user.festivals= 1
            if(theme[i].lower() == "nightlife"):
                user.nightlife= 1
            if(theme[i].lower() == "holidays"):
                user.holidays= 1
            if(theme[i].lower() == "vivid"):
                user.vivid= 1
            if(theme[i].lower() == "cultural experience"):
                user.cultural_experience= 1
            if(theme[i].lower() == "camping"):
                user.camping= 1
            if(theme[i].lower() == "surfing"):
                user.surfing= 1
            if(theme[i].lower() == "honeymoon"):
                user.honeymoon= 1
            if(theme[i].lower() == "scuba diving"):
                user.scuba_diving= 1
            if(theme[i].lower() == "beach"):
                user.beach= 1
            if(theme[i].lower() == "city life"):
                user.city_life= 1
            if(theme[i].lower() == "nature"):
                user.nature= 1
            if(theme[i].lower() == "surprise"):
                user.surprise= 1
            if(theme[i].lower() == "countryside"):
                user.countryside= 1
            if(theme[i].lower() == "other"):
                user.other= 1
        
# setting months

        user.january = months[0]
        user.february = months[1]
        user.march = months[2]
        user.april = months[3]
        user.may = months[4]
        user.june = months[5]
        user.july = months[6]
        user.august = months[7]
        user.september = months[8]
        user.october = months[9]
        user.november = months[10]
        user.december = months[11]

        user.save()
        return HttpResponse("Successfully Updated")

def getCityInfo(request):

    json_data = json.loads(request.body)

    cities = CityFeature.objects.all().order_by('?').values()

    # print(cities[0]['city_name'])
    # print('=========================')
    # print(json_data['userId'])
    # print(UserCity.objects.get(user_id=37,city_name = 'Kerry').users_rating)

    # for i in range (0,len(cities)):
    #     cities[i]['rating'] = UserCity.objects.get(user_id = json_data['userId'],city_name = cities[i]['city_name']).users_rating

    cities_list = list(cities)

    return JsonResponse(cities_list,safe=False)

def addRatingMatching(request):

    json_data = json.loads(request.body)

    try:
        userCity = UserCity.objects.get(user_id=json_data['userId'],city_name=json_data['city_name'])
    except:
        userCity = UserCity()
    userCity.city_name = json_data['city_name']
    userCity.user_id = json_data['userId']
    userCity.users_rating = json_data['users_rating']
    userCity.matching_score = random.randint(0,100)
    
    userCity.save()
    
    return HttpResponse("Success save into user_matching_table")
