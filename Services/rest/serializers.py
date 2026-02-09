from rest_framework import serializers
from .models import (
    Device,
    System,
    Connection,
    Port,
    TrafficProfile,
    FirewallRule,
    ConfigFile,
    TelemetrySession,
    TelemetrySample,
)

class DeviceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Device
        fields = '__all__'

class SystemSerializer(serializers.ModelSerializer):
    class Meta:
        model = System
        fields = '__all__'

class ConnectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Connection
        fields = '__all__'


class PortSerializer(serializers.ModelSerializer):
    class Meta:
        model = Port
        fields = '__all__'


class TrafficProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = TrafficProfile
        fields = '__all__'


class FirewallRuleSerializer(serializers.ModelSerializer):
    class Meta:
        model = FirewallRule
        fields = '__all__'


class ConfigFileSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConfigFile
        fields = '__all__'


class TelemetrySessionSerializer(serializers.ModelSerializer):
    class Meta:
        model = TelemetrySession
        fields = '__all__'


class TelemetrySampleSerializer(serializers.ModelSerializer):
    class Meta:
        model = TelemetrySample
        fields = '__all__'