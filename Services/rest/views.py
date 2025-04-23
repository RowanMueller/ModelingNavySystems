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
# import time

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
            connections = Connection.objects.filter(System=system, SystemVersion=version)
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
        # start_time = time.time()
        try:
            if 'files' not in request.FILES:
                return Response({"error": "No files provided"}, status=status.HTTP_400_BAD_REQUEST)

            name = request.data.get('name')
            version = request.data.get('version')
            if name is None:
                return Response({"error": "System name is required"}, status=status.HTTP_400_BAD_REQUEST)

            try:
                system = System(User=request.user, Name=name, Version=version)
                system.save()
            except Exception as e:
                return Response({"error": f"Error creating system: {str(e)}"}, status=status.HTTP_400_BAD_REQUEST)

            uploaded_files = []
            processing_results = []
            total_nodes = 0
            total_edges = 0

            for file in request.FILES.getlist('files'):
                try:
                    # Save file
                    file_path = default_storage.save(f"uploads/{file.name}", ContentFile(file.read()))
                    uploaded_files.append({
                        "file_name": file.name,
                        "file_size": file.size,
                        "file_path": file_path
                    })
                    
                    # Reset file pointer for processing
                    file.seek(0)
                    
                    # Process file based on type
                    if file.name.endswith('.sysml'):
                        try:
                            result = self.parse_sysml_file(file, system, version or 1)
                            if result.get('devices_created'):
                                total_nodes += result.get('devices_created', 0)
                            if result.get('connections_created'):
                                total_edges += result.get('connections_created', 0)
                            processing_results.append({
                                'file_name': file.name,
                                'type': 'sysml',
                                'status': 'success',
                                **result
                            })
                        except ValueError as e:
                            processing_results.append({
                                'file_name': file.name,
                                'type': 'sysml',
                                'status': 'error',
                                'error': str(e)
                            })
                    elif file.name.endswith('.csv'):
                        try:
                            df = pd.read_csv(file, encoding="utf-8")
                            # Process CSV data...
                            processing_results.append({
                                'file_name': file.name,
                                'type': 'csv',
                                'status': 'success',
                                'rows_processed': len(df)
                            })
                        except Exception as e:
                            processing_results.append({
                                'file_name': file.name,
                                'type': 'csv',
                                'status': 'error',
                                'error': f"Error processing CSV file: {str(e)}"
                            })
                    elif file.name.endswith('.xls') or file.name.endswith('.xlsx'):
                        try:
                            df = pd.read_excel(file)
                            # Process Excel data...
                            processing_results.append({
                                'file_name': file.name,
                                'type': 'excel',
                                'status': 'success',
                                'rows_processed': len(df)
                            })
                        except Exception as e:
                            processing_results.append({
                                'file_name': file.name,
                                'type': 'excel',
                                'status': 'error',
                                'error': f"Error processing Excel file: {str(e)}"
                            })
                    else:
                        processing_results.append({
                            'file_name': file.name,
                            'type': 'unknown',
                            'status': 'error',
                            'error': "Invalid file format. Please upload a CSV, Excel, or SysML file."
                        })
                except Exception as e:
                    processing_results.append({
                        'file_name': file.name,
                        'type': 'unknown',
                        'status': 'error',
                        'error': f"Error processing file: {str(e)}"
                    })

            # Check if any files were processed successfully
            if not any(result['status'] == 'success' for result in processing_results):
                # If all files failed, delete the system and return error
                system.delete()
                return Response({
                    "error": "No files were processed successfully",
                    "processing_results": processing_results
                }, status=status.HTTP_400_BAD_REQUEST)

            # Update system counts
            system.NodeCount = total_nodes
            system.EdgeCount = total_edges
            print(f"System {system.id} has {system.NodeCount} nodes and {system.EdgeCount} edges")
            system.save()

            # end_time = time.time()
            # print(f"Time taken for file upload: {end_time - start_time} seconds")

            return Response({
                "message": "Files processed",
                "files": uploaded_files,
                "processing_results": processing_results,
                "system": SystemSerializer(system).data
            }, status=status.HTTP_201_CREATED)

        except Exception as e:
            # If system was created, try to delete it in case of error
            try:
                if 'system' in locals():
                    system.delete()
            except:
                pass
            return Response({
                "error": f"Error processing upload: {str(e)}"
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def parse_sysml_file(self, file, system, version):
        try:
            # Read the file content
            try:
                sysml_content = file.read().decode('utf-8')
            except UnicodeDecodeError:
                raise ValueError("Invalid file encoding. The SysML file must be UTF-8 encoded.")
            except Exception as e:
                raise ValueError(f"Error reading SysML file: {str(e)}")
            
            # Standard fields that map directly to Device model
            STANDARD_FIELDS = {
                "assetIdentifier": "AssetId",
                "manufacturer": "Manufacturer",
                "modelNumber": "ModelNumber",
                "assetName": "AssetName",
                "serialNumber": "SerialNumber",
                "comments": "Comments",
                "assetCostAmount": "AssetCostAmount",
                "netBookValueAmount": "NetBookValueAmount",
                "ownership": "Ownership",
                "inventoryDate": "InventoryDate",
                "datePlacedInService": "DatePlacedInService",
                "usefulLifePeriods": "UsefulLifePeriods",
                "assetType": "AssetType",
                "locationID": "LocationID",
                "buildingNumber": "BuildingNumber",
                "buildingName": "BuildingName",
                "floor": "Floor",
                "roomNumber": "RoomNumber",
                "xPosition": "Xposition",
                "yPosition": "Yposition",
            }

            # Parse device instances
            device_pattern = r"part instance (\d+): Device\s*{([^}]*)}"
            device_matches = re.findall(device_pattern, sysml_content)
            
            if not device_matches:
                raise ValueError("No valid device definitions found in the SysML file.")
            
            # Store mapping of SysML ID to Django Device object
            sysml_id_to_device = {}
            created_devices = []
            created_connections = []
            
            # Process each device
            for sysml_id, attributes in device_matches:
                try:
                    device_data = {
                        'System': system,
                        'SystemVersion': version
                    }
                    additional_data = {}
                    
                    # Process each attribute line
                    for line in attributes.strip().splitlines():
                        line = line.strip()
                        if '=' in line:
                            try:
                                field_name, field_value = line.split('=', 1)
                                field_name = field_name.strip()
                                field_value = field_value.strip().strip('";')
                                
                                # Convert numeric strings to proper types
                                if field_value.replace('.', '', 1).replace('-', '', 1).isdigit():
                                    try:
                                        if '.' in field_value:
                                            field_value = float(field_value)
                                        else:
                                            field_value = int(field_value)
                                    except ValueError:
                                        print(f"Warning: Could not convert value '{field_value}' to number for field '{field_name}'")
                                        
                                # Map to standard field if exists
                                if field_name in STANDARD_FIELDS:
                                    device_data[STANDARD_FIELDS[field_name]] = field_value
                                else:
                                    # Store non-standard fields in additional_data
                                    additional_data[field_name] = field_value
                            except Exception as e:
                                print(f"Warning: Error processing line '{line}': {str(e)}")
                                continue
                    
                    # Store additional data as JSON
                    if additional_data:
                        device_data['AdditionalAsJson'] = additional_data
                        
                    # Create and save the device
                    try:
                        device = Device.objects.create(**device_data)
                        sysml_id_to_device[sysml_id] = device
                        created_devices.append(device)
                    except Exception as e:
                        raise ValueError(f"Error creating device with ID {sysml_id}: {str(e)}")
                        
                except Exception as e:
                    print(f"Error processing device {sysml_id}: {str(e)}")
                    # Clean up any devices created so far if we encounter an error
                    for device in created_devices:
                        try:
                            device.delete()
                        except:
                            pass
                    raise
            
            # Parse connections
            try:
                connection_pattern = r"part instance (\d+) -> (\d+)::DeviceConnection\s*{([^}]*)}"
                connection_matches = re.findall(connection_pattern, sysml_content)
                
                # Process each connection
                for source_id, target_id, attributes in connection_matches:
                    try:
                        if source_id not in sysml_id_to_device or target_id not in sysml_id_to_device:
                            raise ValueError(f"Invalid connection: Device with ID {source_id if source_id not in sysml_id_to_device else target_id} not found")
                            
                        connection_data = {
                            'System': system,
                            'SystemVersion': version,
                            'Source': sysml_id_to_device[source_id],
                            'Target': sysml_id_to_device[target_id]
                        }
                        
                        # Extract connection type
                        connection_type_match = re.search(r'connectionType = "([^"]*)"', attributes)
                        if connection_type_match:
                            connection_data['ConnectionType'] = connection_type_match.group(1)
                        else:
                            connection_data['ConnectionType'] = 'default'  # Provide a default type if none specified
                            
                        # Extract connection details
                        connection_details = {}
                        for line in attributes.strip().splitlines():
                            line = line.strip()
                            if '=' in line:
                                field_name, field_value = line.split('=', 1)
                                field_name = field_name.strip()
                                field_value = field_value.strip().strip('";')
                                
                                # Skip standard fields
                                if field_name in ['connectionType', 'source', 'target']:
                                    continue
                                    
                                # Add to connection details
                                connection_details[field_name] = field_value
                                
                        if connection_details:
                            connection_data['ConnectionDetails'] = connection_details

                        # Create the connection
                        connection = Connection.objects.create(**connection_data)
                        created_connections.append(connection)
                    except Exception as e:
                        print(f"Error creating connection {source_id}->{target_id}: {str(e)}")
                        # If connection creation fails, continue with other connections
                        continue
                        
            except Exception as e:
                # If connection parsing fails entirely, clean up devices and re-raise
                for device in created_devices:
                    try:
                        device.delete()
                    except:
                        pass
                raise ValueError(f"Error parsing connections: {str(e)}")

            return {
                'devices_created': len(created_devices),
                'connections_created': len(created_connections),
                'message': 'Successfully parsed SysML file'
            }

        except Exception as e:
            # Clean up any created objects in case of error
            try:
                for device in created_devices:
                    device.delete()
            except:
                pass
            
            try:
                for connection in created_connections:
                    connection.delete()
            except:
                pass
                
            raise ValueError(f"Error processing SysML file: {str(e)}")

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
            created_devices = []
            created_connections = []

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
                
                device = Device.objects.create(**cleaned_data, System=system)
                id_to_device[device_data.get("id")] = device
                created_devices.append(device)

            for connection_data in connections:
                source = connection_data.get("source")
                target = connection_data.get("target")
                data = connection_data.get("data", {})
                
                # Extract connection type from label
                connection_type = data.get('label', 'default')
                
                # Create connection details dictionary excluding label
                connection_details = {}
                for key, value in data.items():
                    if key != 'label' and value is not None:
                        connection_details[key] = value

                connection = Connection.objects.create(
                    System=system, 
                    Source=id_to_device[source], 
                    Target=id_to_device[target], 
                    ConnectionType=connection_type,
                    ConnectionDetails=connection_details,
                    SystemVersion=version
                )
                created_connections.append(connection)

            # Update system counts
            system.NodeCount = len(created_devices)
            system.EdgeCount = len(created_connections)
            print(f"System {system.id} has {system.NodeCount} nodes and {system.EdgeCount} edges")
            system.save()

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
        # start_time = time.time()
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
            # end_time = time.time()
            # print(f"Time taken for sysml file download: {end_time - start_time} seconds")
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

            output += f'    part instance {device.get("id")}: Device {{\n'

            for original_key, formatted_key in COLUMN_MAPPING.items():
                value = device.get(original_key)
                if value is None:
                    continue
                
                if isinstance(value, str):
                    value_str = f'"{value}"'
                else:
                    value_str = value
                output += f'        {formatted_key} = {value_str};\n'

            # Add each AdditionalAsJson key as a property assignment (String)
            additional = device.get("AdditionalAsJson", {})
            for k, v in additional.items():
                if isinstance(v, (dict, list)):
                    continue  # Skip nested structures
                v_str = f'"{v}"' if not isinstance(v, (int, float)) else v
                key_name = k.replace(" ", "_")  # sanitize key name
                output += f'        {key_name} = {v_str};\n'
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
            connection_details = connection.get("ConnectionDetails", {})
            
            output += f'    part instance {source_id} -> {target_id}::DeviceConnection {{\n'
            output += f'        connectionType = "{connection_type}";\n'
            output += f'        source = Devices::{source_id};\n'  
            output += f'        target = Devices::{target_id};\n'
            
            # Write additional fields from connection details
            if isinstance(connection_details, dict):
                for key, value in connection_details.items():
                    output += f'        {key} = "{value}";\n'
            
            output += '    }\n'
        output += "}"
        return output