from django.db import models

# Create your models here.

class Vacation(models.Model):
    object = models.CharField(max_length = 150, null=True, blank=True)
    number = models.CharField(max_length = 10, null=True, blank=True)
    theme = models.CharField(max_length = 150, null=True, blank=True)
    period = models.CharField(max_length = 150, null=True, blank=True)
    startDate = models.DateField(auto_now=False, auto_now_add=False, null=True, blank=True)
    endDate = models.DateField(auto_now=False, auto_now_add=False, null=True, blank=True)
    
    class Meta:
        db_table = "vacation_reglist"
    

    
    
    
