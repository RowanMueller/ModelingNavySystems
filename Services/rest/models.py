from django.db import models

# Create your models here.

class Device(models.Model):
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

    def __str__(self):
        return f'{self.AssetId} - {self.AssetName}'