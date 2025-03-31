from django.shortcuts import render
from rest_framework import generics
from .models import Device
from .serializers import DeviceSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
import re
import pandas as pd
import os

# Create your views here.

class DeviceListCreate(generics.ListCreateAPIView):
    queryset = Device.objects.all()
    serializer_class = DeviceSerializer

class GetAllDevices(APIView):
    def get(self, request, *args, **kwargs):
        devices = Device.objects.all()
        serializer = DeviceSerializer(devices, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class FileUploadView(APIView):
    def post(self, request, *args, **kwargs):
        if 'files' not in request.FILES:
            return Response({"error": "No files provided"}, status=status.HTTP_400_BAD_REQUEST)

        uploaded_files = []
        for file in request.FILES.getlist('files'):  # Handle multiple files
            file_path = default_storage.save(f"uploads/{file.name}", ContentFile(file.read()))
            uploaded_files.append({
                "file_name": file.name,
                "file_size": file.size,
                "file_path": file_path
            })
            
        for file in request.FILES.getlist('files'):
            file.seek(0)
            if file.name.endswith('.csv'):
                df = pd.read_csv(file, encoding="utf-8")
            elif file.name.endswith('.xls') or file.name.endswith('.xlsx'):
                print(f"Reading Excel file: {file.name}")
                df = pd.read_excel(file)
                pd.set_option('display.max_rows', None)
                pd.set_option('display.max_columns', None)
                print(df)
            elif file.name.endswith('.sysml'):
                print(f"Reading SysML file: {file.name}")
                df = self.read_sysml(file)
                pd.set_option('display.max_rows', None)
                pd.set_option('display.max_columns', None)
                print(df)
            else:
                return Response({
                    "error": "Invalid file format. Please upload a CSV or Excel file."
                }, status=status.HTTP_400_BAD_REQUEST)

            for _, row in df.iterrows():
                device = Device(
                    AssetId=row.get('Asset Identifier'),
                    Manufacturer=row.get('Manufacturer'),
                    ModelNumber=row.get('Model Number'),
                    AssetName=row.get('Asset Name'),
                    SerialNumber=row.get('Serial Number'),
                    Comments=row.get('Comments'),
                    AssetCostAmount=row.get('Asset Cost Amount'),
                    NetBookValueAmount=row.get('Net Book Value Amount'),
                    Ownership=row.get('Ownership'),
                    InventoryDate=row.get('Inventory Date'),
                    DatePlacedInService=row.get('Date Placed In Service'),
                    UsefulLifePeriods=row.get('Useful Life Periods'),
                    AssetType=row.get('Asset Type'),
                )
                device.save()

        return Response({
            "message": "Files uploaded successfully",
            "files": uploaded_files
        }, status=status.HTTP_201_CREATED)
    
    def read_sysml(self, file):
        # Read and decode the SysML file
        # Column mapping to convet sysml names to proper Django names: 
        COLUMN_MAPPING = {
            "assetId": "Asset Identifier",
            "manufacturer": "Manufacturer",
            "modelNumber": "Model Number",
            "name": "Asset Name",
            "serialNumber": "Serial Number",
            "comments": "Comments",
            "assetCost": "Asset Cost Amount",
            "netBookValue": "Net Book Value Amount",
            "ownership": "Ownership",
            "inventoryDate": "Inventory Date",
            "datePlacedInService": "Date Placed In Service",
            "usefulLife": "Useful Life Periods",
            "assetType": "Asset Type"
        }

        sysml_content = file.read().decode('utf-8')

        # Extract part instances using regex
        part_instance_pattern = r"part instance ([\w\-]+)\s*{([^}]+)}"
        matches = re.findall(part_instance_pattern, sysml_content)

        part_instances = []

        for part_name, attributes in matches:
            part_data = {"PartName": part_name}

            for line in attributes.splitlines():
                if '=' in line:
                    field_name, field_value = line.split('=', 1)
                    field_name = field_name.strip()
                    field_value = field_value.strip().strip('"')

                    # Store using the correct column name if available
                    mapped_name = COLUMN_MAPPING.get(field_name, field_name)
                    part_data[mapped_name] = field_value

            part_instances.append(part_data)

        # Create a pandas DataFrame with renamed columns
        df = pd.DataFrame(part_instances)

        # Fill missing values with an empty string
        df = df.fillna('')

        return df
