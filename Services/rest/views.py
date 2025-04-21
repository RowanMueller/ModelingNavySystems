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
from django.http import HttpResponse
import json 
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
    
    def get(self, request, systemId, version, *args, **kwargs):
        user_id = request.user.id

        if not systemId:  # Validate systemId
            return Response(
                {"error": "System ID is required"},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            system = System.objects.get(id=systemId, User_id=user_id)
            devices = Device.objects.filter(System=system, SystemVersion=version)
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
    def get(self, request, systemId, version, *args, **kwargs):
        user_id = request.user.id
        try:
            # Verify the System exists for the given userId
            system = System.objects.get(id=systemId, User_id=user_id)
            # Fetch all Connections for the 
            print(systemId, version)
            connections = Connection.objects.filter(System=system, SystemVersion=version)
            serializer = ConnectionSerializer(connections, many=True)
            print(serializer.data)
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
            print(e);
            return Response(
                {"error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

class RenameSystemView(APIView):
    permission_classes = [IsAuthenticated]
    def patch(self, request, systemId, *args, **kwargs):
        user = request.user
        system = System.objects.get(id=systemId, User=user)
        system.Name = request.data.get('name')
        system.save()
        return Response(status=status.HTTP_200_OK)

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
        version = request.data.get('version')
        if name is None:
            return Response({"error": "System name is required"}, status=status.HTTP_400_BAD_REQUEST)
        system = System(User=request.user, Name=name, Version=version)
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
                self.process_connections(file, system)
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
                    Xposition=row.get('Xposition', 0),
                    Yposition=row.get('Yposition', y),
                    SystemVersion=1,
                    System=system
                )
                device.save()
                if row.get('Yposition') is None: 
                    y += 50 
        return Response({
            "message": "Files uploaded successfully",
            "files": uploaded_files,
            "system": SystemSerializer(system).data
        }, status=status.HTTP_201_CREATED)
    
    def process_connections(self, file, system):
        content = file.read().decode("utf-8")

        # Match connections in the form: part instance A -> B::DeviceConnection { ... }
        pattern = r"part instance (.+?) -> (.+?)::DeviceConnection\s*\{(.*?)\}"
        matches = re.findall(pattern, content, re.DOTALL)

        for source_name_raw, target_name_raw, block in matches:
            source_name = source_name_raw.strip()
            target_name = target_name_raw.strip()

            # Extract connectionType
            type_match = re.search(r"connectionType\s*=\s*\"(.*?)\"", block)
            connection_type = type_match.group(1) if type_match else "unknown"

            # Extract connectionDetails
            details_match = re.search(r"connectionDetails\s*=\s*(\".*?\"|\{.*?\})", block, re.DOTALL)
            if details_match:
                details_raw = details_match.group(1).strip()
                if details_raw.startswith("{"):
                    try:
                        connection_details = json.loads(details_raw)
                    except json.JSONDecodeError:
                        connection_details = {"raw": details_raw}
                else:
                    connection_details = {"details": details_raw.strip('"')}
            else:
                connection_details = {}

            try:
                source_device = Device.objects.get(AssetName=source_name, System=system)
                target_device = Device.objects.get(AssetName=target_name, System=system)
            except Device.DoesNotExist:
                print(f"Skipping connection; device not found: {source_name} or {target_name}")
                continue

            # Create the connection
            Connection.objects.create(
                System=system,
                SystemVersion=system.Version or 1,
                Source=source_device,
                Target=target_device,
                ConnectionType=connection_type,
                ConnectionDetails=connection_details
            )
            print(f"Created connection from {source_name} to {target_name} of type {connection_type}")

    def read_sysml(self, file):
        # Column mapping from SysML attributes to Django model field names
        COLUMN_MAPPING = {
            "assetIdentifier": "Asset Identifier",
            "manufacturer": "Manufacturer",
            "modelNumber": "Model Number",
            "serialNumber": "Serial Number",
            "comments": "Comments",
            "assetCostAmount": "Asset Cost Amount",
            "netBookValueAmount": "Net Book Value Amount",
            "ownership": "Ownership",
            "inventoryDate": "Inventory Date",
            "datePlacedInService": "Date Placed In Service",
            "usefulLifePeriods": "Useful Life Periods",
            "assetType": "Asset Type",
            "assetName": "Asset Name",
            "locationID": "Location ID",
            "buildingNumber": "Building Number",
            "buildingName": "Building Name",
            "floor": "Floor",
            "roomNumber": "Room Number",
            "xPosition": "Xposition",
            "yPosition": "Yposition",
        }

        sysml_content = file.read().decode('utf-8')

        # Improved regex pattern to better match part instances
        part_pattern = r"part instance ([^:]+): Device\s*{([^}]*)}"
        matches = re.findall(part_pattern, sysml_content)

        part_instances = []

        for part_name, attributes in matches:
            part_data = {
                "PartName": part_name.strip()
            }
            additional_data = {}

            # Process each line inside the part instance block
            for line in attributes.strip().splitlines():
                line = line.strip()
                if '=' in line:
                    field_name, field_value = line.split('=', 1)
                    field_name = field_name.strip()
                    
                    # Clean the value by removing quotes, semicolons, and extra whitespace
                    field_value = field_value.strip()
                    if field_value.startswith('"') and field_value.endswith('"'):
                        field_value = field_value[1:-1]
                    elif field_value.startswith("'") and field_value.endswith("'"):
                        field_value = field_value[1:-1]
                    
                    # Remove any trailing semicolons
                    if field_value.endswith(';'):
                        field_value = field_value[:-1].strip()

                    if field_name in COLUMN_MAPPING:
                        mapped_name = COLUMN_MAPPING[field_name]
                        part_data[mapped_name] = field_value
                    else:
                        additional_data[field_name] = field_value

            # Store any additional fields as JSON
            part_data["Additional_JSON"] = additional_data
            
            # THIS LINE WAS MISSING - Add the processed part to our list
            part_instances.append(part_data)

        # Create DataFrame from processed part instances
        if not part_instances:
            return pd.DataFrame()
        
        df = pd.DataFrame(part_instances)

        # Fill missing fields with empty string or empty dict
        df = df.fillna({'Additional_JSON': {}, **{col: '' for col in df.columns if col != 'Additional_JSON'}})

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
    def post(self, request, systemId, *args, **kwargs):
        user = request.user
        system_id = systemId
        version = request.data.get('version') + 1
        devices = request.data.get('devices')
        connections = request.data.get('connections')

        if not system_id or not version:
            return Response({"error": "system_id and version are required."},
                            status=status.HTTP_400_BAD_REQUEST)
                    # Get the existing system by ID and user
        try:            
            NORMAL_FIELDS = ["AssetId", "Manufacturer", "ModelNumber", "SerialNumber", "Comments", "AssetCostAmount", "NetBookValueAmount", "Ownership", "InventoryDate", "DatePlacedInService", "UsefulLifePeriods", "AssetType", "AssetName", "LocationID", "BuildingNumber", "BuildingName", "Floor", "RoomNumber"]
            EXCLUDED_FIELDS = ["Xposition", "Yposition", "SystemVersion", "System", "id"]

            system = System.objects.get(id=systemId, User=user)

            # Increment version
            system.Version += 1
            system.save()
            
            id_to_device = {}

            for device_data in devices:
                data = device_data.get("data", {})
                position = device_data.get("position", {})

                cleaned_data = {}
                additional_data = {}

                for key, value in data.items():
                    if isinstance(value, str):
                        value = value.strip().strip('";')
                    if key in NORMAL_FIELDS:
                        cleaned_data[key] = value
                    elif key not in EXCLUDED_FIELDS and value is not None:
                        additional_data[key] = value

                cleaned_data["SystemVersion"] = version

                cleaned_data["Xposition"] = position.get("x", 0)
                cleaned_data["Yposition"] = position.get("y", 0)

                if additional_data:
                    cleaned_data["AdditionalAsJson"] = additional_data
                
                id_to_device[device_data.get("id")] = Device.objects.create(**cleaned_data, System=system)

            for connection_data in connections:
                source = connection_data.get("source")
                target = connection_data.get("target")
                data = connection_data.get("data", {}) # id refers to json 
                connection_type = data['label']

                Connection.objects.create(
                    System=system, 
                    Source=id_to_device[source], 
                    Target=id_to_device[target], 
                    ConnectionType=connection_type,
                    SystemVersion=version
                )

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
    
class DownloadSysMLView(APIView): 
    permission_classes = [IsAuthenticated]
    def get(self, request, systemId, version):
        user = request.user

        if not systemId or not version:
            return Response({"error": "system_id and version are required."},
                            status=status.HTTP_400_BAD_REQUEST)

        try:
            # Get the system for the authenticated user
            system = System.objects.get(id=systemId, User=user, Version=version)

            # Fetch versioned devices and connections
            devices = Device.objects.filter(System=system, SystemVersion=version)
            connections = Connection.objects.filter(System=system, SystemVersion=version)

            # Generate SysML file content
            sysml_content = self.write_sysml_text(system, devices, connections)
            # Create the response with appropriate headers
            response = HttpResponse(sysml_content, content_type='text/plain')
            response['Content-Disposition'] = f'attachment; filename="system_{systemId}_v{version}.sysml"'
            return response 
        except System.DoesNotExist:
            return Response({"error": "System not found."}, status=status.HTTP_404_NOT_FOUND)

    def write_sysml_text(self, system, devices, connections): 
        device_serializer = DeviceSerializer(devices, many=True)
        connections_serializer = ConnectionSerializer(connections, many=True)
        devices_data = device_serializer.data
        connections = connections_serializer.data
        text = self.write_devices(devices_data, connections) + "\n\n" + self.write_connections(connections)
        return text

    def write_devices(self, devices_data, connections):
        # Define package for devices
        package = """package Devices {

    part def Device {
        property id: String;
        property assetId: String;
        property manufacturer: String?;
        property modelNumber: String?;
        property assetName: String?;
        property serialNumber: String?;
        property comments: String?;
        property assetCostAmount: Float?;
        property netBookValueAmount: String?;
        property ownership: String?;
        property inventoryDate: String?;
        property datePlacedInService: String?;
        property usefulLifePeriods: String?;
        property assetType: String?;
        property locationID: String?;
        property buildingNumber: String?;
        property buildingName: String?;
        property floor: String?;
        property roomNumber: String?;
        property additionalAsJson: Json?;
        property xPosition: Float?;
        property yPosition: Float?;
    }\n
"""

        COLUMN_MAPPING = {
            "AssetId": "assetIdentifier",
            "Manufacturer": "manufacturer",
            "ModelNumber": "modelNumber",
            "AssetName": "assetName",
            "SerialNumber": "serialNumber",
            "Comments": "comments",
            "AssetCostAmount": "assetCostAmount",
            "NetBookValueAmount": "netBookValueAmount",
            "Ownership": "ownership",
            "InventoryDate": "inventoryDate",
            "DatePlacedInService": "datePlacedInService",
            "UsefulLifePeriods": "usefulLifePeriods",
            "AssetType": "assetType",
            "LocationID": "locationID",
            "BuildingNumber": "buildingNumber",
            "BuildingName": "buildingName",
            "Floor": "floor",
            "RoomNumber": "roomNumber",
            "Xposition": "xPosition",
            "Yposition": "yPosition",
        }

        output = package

        for device in devices_data:
            # Use AssetName or fallback to AdditionalAsJson.label or "Unnamed_Device"
            name = device.get("AssetName")
            if not name:
                name = device.get("AdditionalAsJson", {}).get("label", "Unnamed_Device")
            name = name.upper().replace(" ", "_")

            output += f'    part instance {name}: Device {{\n'
            output += f'         id = "{device.get("id")}";\n'

            for original_key, formatted_key in COLUMN_MAPPING.items():
                value = device.get(original_key)
                if value is None:
                    continue
                
                if isinstance(value, str):
                    value_str = f'"{value}"'
                else:
                    value_str = value
                output += f'         {formatted_key} = {value_str};\n'

            # Add each AdditionalAsJson key as a property assignment (String)
            additional = device.get("AdditionalAsJson", {})
            for k, v in additional.items():
                if isinstance(v, (dict, list)):
                    continue  # Skip nested structures
                v_str = f'"{v}"' if not isinstance(v, (int, float)) else v
                key_name = k.replace(" ", "_")  # sanitize key name
                output += f'         {key_name} = {v_str};\n'
            output += '    }\n'        
        output += "}"
        return output
    
    def write_connections(self, connections_data):
        # Define connections package in sysml 
        package = """package Connections {

    part def DeviceConnection {
        property connectionType: String;
        property connectionDetails: Json?;
        property source: Float?;
        property target: Float?;
    }\n
"""

        output = package 
        for connection in connections_data:
            connection_type = connection.get("ConnectionType")
            source_id = connection.get("Source")
            target_id = connection.get("Target")
            source_device = Device.objects.get(id=source_id)
            target_device = Device.objects.get(id=target_id)
            source = source_device.AssetName if source_device else "Unknown_Source"
            target = target_device.AssetName if target_device else "Unknown_Target"
            connection_details = connection.get("ConnectionDetails")
            output += f'    part instance {source} -> {target}::DeviceConnection {{\n'
            output += f'        connectionType = "{connection_type}";\n'
            output += f'        connectionDetails = "{connection_details}";\n'
            output += f'        source = Devices::{source_device.AssetName};\n'  
            output += f'        target = Devices::{target_device.AssetName};\n' 
            output += '    }\n'
        output += "}"
        return output