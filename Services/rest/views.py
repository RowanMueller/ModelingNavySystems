from django.shortcuts import render
from rest_framework import generics
from .models import Device
from .serializers import DeviceSerializer

# Create your views here.

class DeviceListCreate(generics.ListCreateAPIView):
    queryset = Device.objects.all()
    serializer_class = DeviceSerializer