from django.contrib.auth.models import User
from django.db import models

# Create your models here.

# class Profile(models.Model):
#     user = models.OneToOneField(User, on_delete=models.CASCADE)
#     system = models.ForeignKey(System, on_delete=models.CASCADE, related_name="devices", null=True) # change


class System(models.Model):
    Name = models.CharField(max_length=100)
    Users = models.ManyToManyField(User, related_name="systems")
    EdgeCount = models.IntegerField(default=0)
    NodeCount = models.IntegerField(default=0)
    Version = models.JSONField(null=True, blank=True)  # {"1": timestamp}

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
    Device1 = models.ForeignKey(
        "Device", on_delete=models.CASCADE, related_name="connections1"
    )
    Device2 = models.ForeignKey(
        "Device", on_delete=models.CASCADE, related_name="connections2"
    )
    ConnectionType = models.CharField(max_length=100)
    ConnectionDetails = models.JSONField(null=True, blank=True)

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
    system = models.ForeignKey(
        System, on_delete=models.CASCADE, related_name="devices"
    )

    def __str__(self):
        return f"{self.AssetId} - {self.AssetName}"
