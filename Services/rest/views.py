from rest_framework import generics
from .models import Device, System 
from .serializers import DeviceSerializer, ConnectionSerializer, SystemSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Connection, Device, System
from rest_framework.permissions import IsAuthenticated
from functools import wraps
from django.http import JsonResponse

import re
import pandas as pd
from django.contrib.auth.models import User

# Create your views here.

class DeviceListCreate(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Device.objects.all()
    serializer_class = DeviceSerializer

class GetDevicesView(APIView):
    permission_classes = [IsAuthenticated]
    
    def get(self, request, systemId, *args, **kwargs):
        user_id = request.user.id

        if not systemId:  # Validate systemId
            return Response(
                {"error": "System ID is required"},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            system = System.objects.get(id=systemId, User_id=user_id)
            devices = Device.objects.filter(System=system)
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
    permission_classes = [IsAuthenticated]
    def get(self, request, systemId, *args, **kwargs):
        user_id = request.user.id
        try:
            # Verify the System exists for the given userId
            system = System.objects.get(id=systemId, User_id=user_id)
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
    permission_classes = [IsAuthenticated]
    def delete(self, request, systemId, *args, **kwargs):
        user_id = request.user.id

        try:
            # Fetch the System for the given userId and systemId
            system = System.objects.get(id=systemId, User_id=user_id)
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
            print("_--------------------------------")
            print(e);
            print("_--------------------------------")
            return Response(
                {"error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


# Fetches devices and converts to JSON
class GetAllDevices(APIView):
    permission_classes = [IsAuthenticated]
    
    # Custom API view to fetch all devices
    def get(self, request, *args, **kwargs):
        devices = Device.objects.all()
        serializer = DeviceSerializer(devices, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

# connects to urls.py
class FileUploadView(APIView):
    permission_classes = [IsAuthenticated]
    def post(self, request, *args, **kwargs):
        if 'files' not in request.FILES:
            return Response({"error": "No files provided"}, status=status.HTTP_400_BAD_REQUEST)

        name = request.data.get('name')
        if name is None:
            return Response({"error": "System name is required"}, status=status.HTTP_400_BAD_REQUEST)
        system = System(User=request.user, Name=name)
        system.save()

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
            
            y = 0 
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
                    AdditionalAsJson=row.get('Additional JSON'),
                    Xposition=0,
                    Yposition=y, 
                    SystemVersion=1,
                    System=system
                )
                device.save()
                y += 50

        return Response({
            "message": "Files uploaded successfully",
            "files": uploaded_files,
            "system": SystemSerializer(system).data
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

class GetAllSystems(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        user = request.user
        systems = System.objects.filter(User__id=user.id)
        serializer = SystemSerializer(systems, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

class CreateSystemView(APIView):
    permission_classes = [IsAuthenticated]
    def post(self, request, *args, **kwargs):
        user = request.user
        version = request.data.get('version') # version could be 0
        name = request.data.get('name')
        if version is None:
            version = 1
        system = System(User=user, Version=version, Name=name)
        system.save()
        return Response(status=status.HTTP_201_CREATED, data=SystemSerializer(system).data)

class UploadNewSystemVersion(APIView):
    permission_classes = [IsAuthenticated]
    def post(self, request, system_id, devices,  *args, **kwargs):
        user = request.user
        version = request.data.get('version') # version could be 0
        name = request.data.get('name')
        if version is None:
            version = 1
        system = System(User=user, Version=version, Name=name)
        system.save()
        return Response(status=status.HTTP_201_CREATED, data=SystemSerializer(system).data)
    
class SaveSystem(APIView): 
    permission_classes = [IsAuthenticated]
    def post(self, request, systemID, *args, **kwargs):
        user = request.user
        system_id = systemID + 1 
        version = request.data.get('version') + 1
        devices = request.data.get('devices')
        connections = request.data.get('connections')

        if not system_id or not version:
            return Response({"error": "system_id and version are required."},
                            status=status.HTTP_400_BAD_REQUEST)
        
        try:
            system = System.objects.get(id=system_id, User=user)
            system.Version = version
            system.NodeCount = len(devices)
            system.EdgeCount = len(connections)
            system.save()

            # Save new devices (increment version, auto-increment id)
            for device_data in devices:
                # Copy device data so we don't modify the original request
                new_device_data = device_data.copy()

                # Remove 'id' if it's included in the incoming data
                new_device_data.pop('id', None)

                # Increment version by 1 (default to 0 if not provided)
                original_version = device_data.get('version', 0)
                new_device_data['version'] = original_version + 1

                # Create new device linked to this system
                Device.objects.create(System=system, **new_device_data)
                
            # Save new connections (increment version, auto-increment id)
            for connection_data in connections:
                # Copy connection data so we don't modify the original request
                new_connection_data = connection_data.copy()

                # Remove 'id' if it's included in the incoming data
                new_connection_data.pop('id', None)

                # Increment version by 1 (default to 0 if not provided)
                original_version = connection_data.get('version', 0)
                new_connection_data['version'] = original_version + 1

                # Create new connection linked to this system
                Connection.objects.create(System=system, **new_connection_data)

            
            return Response({"message": "System saved successfully."},
                            status=status.HTTP_200_OK)
        except System.DoesNotExist:
            return Response({"error": "System not found."}, status=status.HTTP_404_NOT_FOUND)

class SystemDetailView(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        user = request.user
        user_id = user.id
        system_id = request.query_params.get('system_id')

        if not system_id:
            return Response({"error": "user_id and system_id are required."},
                            status=status.HTTP_400_BAD_REQUEST)
        try:
            user = User.objects.get(id=user_id)
            system = System.objects.get(id=system_id)
        except User.DoesNotExist:
            return Response({"error": "User not found."}, status=status.HTTP_404_NOT_FOUND)
        except System.DoesNotExist:
            return Response({"error": "System not found."}, status=status.HTTP_404_NOT_FOUND)

        # Check if the user has access to this system
        if user not in system.Users.all():
            return Response({"error": "User does not have access to this system."},
                            status=status.HTTP_403_FORBIDDEN)

        serializer = SystemSerializer(system)
        return Response(serializer.data, status=status.HTTP_200_OK)

# 1. Do save graph if I'm given system_id, increment version and system_id, system_version, devices, and connections. treat devices and connections
# like new version track x and y values. 
# 2. upload new system version if i'm given a file 