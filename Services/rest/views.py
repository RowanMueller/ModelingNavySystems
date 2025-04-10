from django.shortcuts import render
from rest_framework import generics
from .models import Device
from .serializers import DeviceSerializer, ConnectionSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Connection, Device, System

import re
import pandas as pd
import os

# Create your views here.

class DeviceListCreate(generics.ListCreateAPIView):
    # 
    queryset = Device.objects.all()
    serializer_class = DeviceSerializer

class GetDevicesView(APIView):
    def get(self, request, systemId, *args, **kwargs):
        current_user = request.user
        if not current_user.is_authenticated:
            return Response(
                {"error": "User not authenticated"},
                status=status.HTTP_401_UNAUTHORIZED
            )
        user_id = current_user.id
        if user_id is None:  # Rare, but adds safety
            return Response(
                {"error": "Invalid user ID"},
                status=status.HTTP_400_BAD_REQUEST
            )
        if not systemId:  # Validate systemId
            return Response(
                {"error": "System ID is required"},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            system = System.objects.get(id=systemId, User_id=user_id)
            devices = Device.objects.filter(system=system)
            serializer = DeviceSerializer(devices, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except System.DoesNotExist:
            return Response(
                {"error": "System not found or does not belong to the user"},
                status=status.HTTP_404_NOT_FOUND
            )
        except Exception as e:
            return Response(
                {"error": f"An unexpected error occurred: {str(e)}"},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

class GetConnectionsView(APIView):
    def get(self, request, userId, systemId, *args, **kwargs):
        current_user = request.user
        if current_user == None:
            return Response(
                {"error": "User not authenticated"},
                status=status.HTTP_401_UNAUTHORIZED
            )
        user_id = current_user.id
        try:
            # Verify the System exists for the given userId
            system = System.objects.get(id=systemId, User_id=userId)
            # Fetch all Connections for the System
            connections = Connection.objects.filter(System=system)
            serializer = ConnectionSerializer(connections, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except System.DoesNotExist:
            return Response(
                {"error": "System not found or does not belong to the user"},
                status=status.HTTP_404_NOT_FOUND
            )
        except Exception as e:
            return Response(
                {"error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

class DeleteSystemView(APIView):
    def delete(self, request, systemId, *args, **kwargs):
        current_user = request.user
        if current_user == None:
            return Response(
                {"error": "User not authenticated"},
                status=status.HTTP_401_UNAUTHORIZED
            )
        user_id = current_user.id

        try:
            # Fetch the System for the given userId and systemId
            system = System.objects.get(id=systemId, User_id=userId)
            system.delete()  # Cascades to Devices and Connections
            return Response(
                {"message": "System and associated devices/connections deleted successfully"},
                status=status.HTTP_204_NO_CONTENT
            )
        except System.DoesNotExist:
            return Response(
                {"error": "System not found or does not belong to the user"},
                status=status.HTTP_404_NOT_FOUND
            )
        except Exception as e:
            return Response(
                {"error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


# Fetches devices and converts to JSON
class GetAllDevices(APIView):
    # Custom API view to fetch all devices
    def get(self, request, *args, **kwargs):
        devices = Device.objects.all()
        serializer = DeviceSerializer(devices, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


# connects to urls.py
class FileUploadView(APIView):
    def post(self, request, *args, **kwargs):
        if 'files' not in request.FILES:
            return Response({"error": "No files provided"}, status=status.HTTP_400_BAD_REQUEST)

        uploaded_files = []
        for file in request.FILES.getlist('files'):  # Handle multiple files
            # Saves each file under 'uploads/' directory
            file_path = default_storage.save(f"uploads/{file.name}", ContentFile(file.read()))
            uploaded_files.append({
                "file_name": file.name,
                "file_size": file.size,
                "file_path": file_path
            })
            
        for file in request.FILES.getlist('files'):
            #extract data and save to the Device model
            file.seek(0)
            if file.name.endswith('.csv'):
                # Reads CSV file into a pandas dataframe
                df = pd.read_csv(file, encoding="utf-8")
            elif file.name.endswith('.xls') or file.name.endswith('.xlsx'):
                print(f"Reading Excel file: {file.name}")
                df = pd.read_excel(file)
            elif file.name.endswith('.sysml'):
                print(f"Reading SysML file: {file.name}")
                df = self.read_sysml(file)
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
                    LocationID=row.get('Location ID'), 
                    BuildingNumber=row.get('Building Number'), 
                    BuildingName=row.get('Building Name'), 
                    Floor=row.get('Floor'),
                    RoomNumber=row.get('Room Number'), 
                    AdditionalAsJson=row.get('Additional JSON')
                )
                device.save()

        return Response({
            "message": "Files uploaded successfully",
            "files": uploaded_files
        }, status=status.HTTP_201_CREATED)
    
    def read_sysml(self, file): #TODO have it so it parses data when it's on the next line 
        # Read and decode the SysML file
        # Column mapping to convert SysML names to proper Django names: YOU HAVE TO CHANGE THIS EVERY TIME YOU CHANGE THE MODEL
        COLUMN_MAPPING = {
            "assetIdentifier": "Asset Identifier",
            "manufacturer": "Manufacturer",
            "modelNumber": "Model Number",
            "serialNumber": "Serial Number",
            "comments": "Comments",
            "assetCost": "Asset Cost Amount",
            "netBookValueAmount": "Net Book Value Amount",
            "ownership": "Ownership",
            "inventoryDate": "Inventory Date",
            "datePlacedInService": "Date Placed In Service",
            "usefulLife": "Useful Life Periods",
            "assetType": "Asset Type", 
            "assetName": "Asset Name",
            "locationID": "Location ID",
            "buildingNumber": "Building Number",
            "buildingName": "Building Name",
            "floor": "Floor",
            "roomNumber": "Room Number",
        }

        sysml_content = file.read().decode('utf-8')

        # Extract part instances using regex
        part_instance_pattern = r"part instance ([\w\-]+)\s*{([^}]+)}"
        matches = re.findall(part_instance_pattern, sysml_content)

        part_instances = []

        for part_name, attributes in matches:
            part_data = {"PartName": part_name}
            additional_data = {}

            for line in attributes.splitlines():
                if '=' in line:
                    field_name, field_value = line.split('=', 1)
                    field_name = field_name.strip()
                    field_value = field_value.strip().strip('"')

                    # Store using the correct column name if available
                    if field_name in COLUMN_MAPPING:
                        mapped_name = COLUMN_MAPPING[field_name]
                        part_data[mapped_name] = field_value
                    else:
                        # Store unmapped fields in additional_data
                        additional_data[field_name] = field_value

            # Add additional data as JSON string
            part_data["Additional JSON"] = additional_data

            part_instances.append(part_data)

        # Create a pandas DataFrame with renamed columns
        df = pd.DataFrame(part_instances)

        # Fill missing values with an empty string
        df = df.fillna('')

        return df