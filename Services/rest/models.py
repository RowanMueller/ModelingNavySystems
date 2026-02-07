from django.contrib.auth.models import User
from django.db import models

# Create your models here.

# class Profile(models.Model):
#     user = models.OneToOneField(User, on_delete=models.CASCADE)
#     system = models.ForeignKey(System, on_delete=models.CASCADE, related_name="devices", null=True) # change


class System(models.Model):
    Name = models.CharField(max_length=100)
    User = models.ForeignKey(User, on_delete=models.CASCADE, related_name="systems", default="1")
    EdgeCount = models.IntegerField(default=0)
    NodeCount = models.IntegerField(default=0)
    Version = models.IntegerField(null=True, blank=True, default=0)

    def __str__(self):
        return f"{self.AssetId} - {self.AssetName}"


# description: model below is too difficult and fail to handle cascading delete
# class Update (models.Model):
#     UpdateType = models.CharField(max_length=100)
#     Date = models.DateTimeField(auto_now_add=True)
#     oldValue = models.JSONField(max_length=100) # {"columnName": "oldValue"}
#     newValue = models.JSONField(max_length=100) # {"columnName": "newValue"}
#     User = models.ForeignKey(User, on_delete=models.CASCADE, related_name="updates")
#     Device1 = models.ForeignKey('Device', on_delete=models.CASCADE, related_name="updates", null=True)
#     Device2 = models.ForeignKey('Device', on_delete=models.CASCADE, related_name="updates2", null=True)
#     System = models.ForeignKey(System, on_delete=models.CASCADE, related_name="updates", null=True)
#     Connection = models.ForeignKey('Connection', on_delete=models.CASCADE, related_name="updates", null=True)

#     def __str__(self):
#         return f'{self.AssetId} - {self.AssetName}'


class Connection(models.Model):
    SystemVersion = models.IntegerField(default=1)
    System = models.ForeignKey(
        System, on_delete=models.CASCADE, related_name="connections"
    )
    Source = models.ForeignKey(
        "Device", on_delete=models.CASCADE, related_name="connections1"
    )
    Target = models.ForeignKey(
        "Device", on_delete=models.CASCADE, related_name="connections2"
    )
    ConnectionType = models.CharField(max_length=100)
    ConnectionDetails = models.JSONField(null=True, blank=True)
    BandwidthMbps = models.FloatField(null=True, blank=True)
    LatencyMs = models.FloatField(null=True, blank=True)
    IsTrunk = models.BooleanField(default=False)
    AllowedVlans = models.JSONField(null=True, blank=True)
    ErrorRate = models.FloatField(null=True, blank=True)

    def __str__(self):
        return f"{self.device1} - {self.device2}"


class Device(models.Model):
    SystemVersion = models.IntegerField(default=1)
    AssetId = models.CharField(max_length=100)
    Manufacturer = models.CharField(max_length=100, null=True, blank=True)
    ModelNumber = models.CharField(max_length=100, null=True, blank=True)
    AssetName = models.CharField(max_length=100, null=True, blank=True)
    SerialNumber = models.CharField(max_length=100, null=True, blank=True)
    Comments = models.CharField(max_length=100, null=True, blank=True)
    AssetCostAmount = models.FloatField(null=True, blank=True)
    NetBookValueAmount = models.CharField(max_length=100, null=True, blank=True)
    Ownership = models.CharField(max_length=100, null=True, blank=True)
    InventoryDate = models.CharField(max_length=100, null=True, blank=True)
    DatePlacedInService = models.CharField(max_length=100, null=True, blank=True)
    UsefulLifePeriods = models.CharField(max_length=100, null=True, blank=True)
    AssetType = models.CharField(max_length=100, null=True, blank=True)
    LocationID = models.CharField(max_length=100, null=True, blank=True)
    BuildingNumber = models.CharField(max_length=100, null=True, blank=True)
    BuildingName = models.CharField(max_length=100, null=True, blank=True)
    Floor = models.CharField(max_length=100, null=True, blank=True)
    RoomNumber = models.CharField(max_length=100, null=True, blank=True)
    AdditionalAsJson = models.JSONField(null=True, blank=True)
    System = models.ForeignKey(System, on_delete=models.CASCADE, related_name="devices", default="1")
    Xposition = models.FloatField(null=True, blank=True, default=0)
    Yposition = models.FloatField(null=True, blank=True, default=0)
    DeviceType = models.CharField(max_length=50, default="generic")
    IpAddress = models.CharField(max_length=50, null=True, blank=True)
    IsOnline = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.AssetId} - {self.AssetName}"


class Port(models.Model):
    SystemVersion = models.IntegerField(default=1)
    System = models.ForeignKey(System, on_delete=models.CASCADE, related_name="ports")
    Device = models.ForeignKey(Device, on_delete=models.CASCADE, related_name="ports")
    Name = models.CharField(max_length=100)
    Index = models.IntegerField(default=0)
    SpeedMbps = models.IntegerField(default=1000)
    Duplex = models.CharField(max_length=10, default="full")
    IsTrunk = models.BooleanField(default=False)
    AllowedVlans = models.JSONField(null=True, blank=True)
    AccessVlan = models.IntegerField(null=True, blank=True)
    AdminUp = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.Device.AssetId}:{self.Name}"


class TrafficProfile(models.Model):
    SystemVersion = models.IntegerField(default=1)
    System = models.ForeignKey(System, on_delete=models.CASCADE, related_name="traffic_profiles")
    Device = models.ForeignKey(Device, on_delete=models.CASCADE, related_name="traffic_profiles")
    Name = models.CharField(max_length=100)
    Profile = models.JSONField()

    def __str__(self):
        return f"{self.Device.AssetId}:{self.Name}"


class FirewallRule(models.Model):
    SystemVersion = models.IntegerField(default=1)
    System = models.ForeignKey(System, on_delete=models.CASCADE, related_name="firewall_rules")
    Device = models.ForeignKey(Device, on_delete=models.CASCADE, related_name="firewall_rules")
    Action = models.CharField(max_length=10, default="allow")
    Protocol = models.CharField(max_length=10, null=True, blank=True)
    Src = models.CharField(max_length=100, null=True, blank=True)
    Dst = models.CharField(max_length=100, null=True, blank=True)
    SrcPort = models.IntegerField(null=True, blank=True)
    DstPort = models.IntegerField(null=True, blank=True)
    Vlan = models.IntegerField(null=True, blank=True)

    def __str__(self):
        return f"{self.Device.AssetId}:{self.Action}"


class DeviceSpec(models.Model):
    Device = models.OneToOneField(Device, on_delete=models.CASCADE, related_name="device_spec")
    ModelName = models.CharField(max_length=100, null=True, blank=True)
    PortCount = models.IntegerField(null=True, blank=True)
    SupportedSpeeds = models.JSONField(null=True, blank=True)
    SupportsVlans = models.BooleanField(default=False)
    SupportsPoE = models.BooleanField(default=False)
    AdditionalSpecs = models.JSONField(null=True, blank=True)

    def __str__(self):
        return f"{self.Device.AssetId}:{self.ModelName}"


class ConfigFile(models.Model):
    System = models.ForeignKey(System, on_delete=models.CASCADE, related_name="config_files")
    Name = models.CharField(max_length=200)
    Format = models.CharField(max_length=20, default="yaml")
    RawText = models.TextField()
    ParsedData = models.JSONField(null=True, blank=True)
    UploadedAt = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.System.Name}:{self.Name}"