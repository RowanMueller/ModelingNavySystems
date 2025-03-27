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
                df = pd.read_excel(file, encoding="utf-8")
            elif file.name.endswith('.sysml'):
                df = self.read_sysml(file, encoding="utf-8")
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
    
    def read_sysml(self, file, encoding="utf-8"): # writes sysml file to pandas dataframe 
        """Parses a .sysml file-like object and returns a pandas DataFrame."""
        try:
            data = file.read().decode('utf-8') # Important: Read the file content
            # Extract all device data blocks using regular expressions
            device_blocks = re.findall(r"part instance (\w+) {\s*(.*?)\s*}", data, re.DOTALL)

            if not device_blocks:
                print("Error: No 'part instance' blocks found in the file.")
                return pd.DataFrame()

            dataframes = []  # Store DataFrames for each device
            for device_name, attributes_block in device_blocks:
                attributes = {}
                for line in attributes_block.strip().split(";\n"):
                    line = line.strip()
                    if not line or line.startswith("//"):  # Skip empty lines and comments
                        continue

                    # Handle connections specially
                    if "connections = [" in line:
                        match_connection = re.search(r"connections = \[(.*?)\]", line)
                        if match_connection:
                            attributes["connections"] = match_connection.group(1).strip()
                        continue

                    # Regular attribute-value pairs
                    parts = line.split("=", 1)
                    if len(parts) == 2:
                        attribute = parts[0].strip()
                        value = parts[1].strip().replace('"', '')  # remove quotes
                        attributes[attribute] = value
                    else:
                        print(f"Warning: Could not parse line: {line}")

                # Create a DataFrame for the current device
                df = pd.DataFrame([attributes])
                df['device_name'] = device_name  # Add device_name as column
                dataframes.append(df)

            # Concatenate all DataFrames into a single DataFrame
            if dataframes:
                final_df = pd.concat(dataframes, ignore_index=True)
                return final_df
            else:
                return pd.DataFrame()

        except Exception as e:
            print(f"An error occurred during parsing: {e}")
            raise e  # Re-raise the exception to be caught in the API view