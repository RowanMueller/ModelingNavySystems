from rest_framework import serializers
from .models import Device, System 

class DeviceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Device
        fields = '__all__'
        
class SystemSerializer(serializers.ModelSerializer):
    class Meta:
        model = System
        fields = '__all__'