from django.shortcuts import render
from .models import Vacation
from django.http import HttpResponse
import json
# from django.views.decorators.csrf import csrf_exempt

# Create your views here.
def storeData(request):
    if request.method == "POST":
        print('POST method is existed!')
        json_data = json.loads(request.body)
        who = json_data['who']
        number = json_data['number']
        theme = json_data['theme']
        howlong = json_data['howlong']
        fromDate = json_data['fromDate']
        toDate = json_data['toDate']

        vacation = Vacation(object=who,number=number,theme=theme,period=howlong,startDate=fromDate,endDate=toDate)
        vacation.save()
       
        return HttpResponse("Post method is received!")