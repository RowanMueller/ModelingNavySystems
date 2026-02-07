import os
from datetime import datetime
from django.conf import settings
from .models import Device

def write_sysml_from_devices(devices, filename=None) -> str:
    """
    Converts a list of Device objects to a basic SysML file format.
    """
    lines = []

    for device in devices:
        lines.append(f'part instance {device.AssetId or "Unnamed"} {{')

        if device.Manufacturer:
            lines.append(f'  manufacturer = "{device.Manufacturer}"')
        if device.ModelNumber:
            lines.append(f'  modelNumber = "{device.ModelNumber}"')
        if device.AssetName:
            lines.append(f'  name = "{device.AssetName}"')
        if device.SerialNumber:
            lines.append(f'  serialNumber = "{device.SerialNumber}"')
        if device.Comments:
            lines.append(f'  comments = "{device.Comments}"')
        if device.AssetCostAmount:
            lines.append(f'  assetCost = "{device.AssetCostAmount}"')
        if device.NetBookValueAmount:
            lines.append(f'  netBookValue = "{device.NetBookValueAmount}"')
        if device.Ownership:
            lines.append(f'  ownership = "{device.Ownership}"')
        if device.InventoryDate:
            lines.append(f'  inventoryDate = "{device.InventoryDate}"')
        if device.DatePlacedInService:
            lines.append(f'  datePlacedInService = "{device.DatePlacedInService}"')
        if device.UsefulLifePeriods:
            lines.append(f'  usefulLife = "{device.UsefulLifePeriods}"')
        if device.AssetType:
            lines.append(f'  assetType = "{device.AssetType}"')

        lines.append("}")

    filename = filename or f"devices_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sysml"
    relative_path = os.path.join("uploads", filename)
    absolute_path = os.path.join(settings.MEDIA_ROOT, relative_path)
    os.makedirs(os.path.dirname(absolute_path), exist_ok=True)

    with open(absolute_path, "w") as f:
        f.write("\n".join(lines))

    return relative_path
