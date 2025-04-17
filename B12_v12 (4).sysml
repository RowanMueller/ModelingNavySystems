
package Devices {

    part def Device {
        property AssetId: String;
        property Manufacturer: String?;
        property ModelNumber: String?;
        property AssetName: String?;
        property SerialNumber: String?;
        property Comments: String?;
        property AssetCostAmount: Float?;
        property NetBookValueAmount: String?;
        property Ownership: String?;
        property InventoryDate: String?;
        property DatePlacedInService: String?;
        property UsefulLifePeriods: String?;
        property AssetType: String?;
        property LocationID: String?;
        property BuildingNumber: String?;
        property BuildingName: String?;
        property Floor: String?;
        property RoomNumber: String?;
        property AdditionalAsJson: Json?;
        property Xposition: Float?;
        property Yposition: Float?;
    }


    part instance NEW_DEVICE_(COPY): Device {
         assetIdentifier = "30";
         xPosition = -105.0;
         yPosition = -22.0;
         label = "New Device (copy)";
    }

    part instance NEW_DEVICE: Device {
         assetIdentifier = "25";
         xPosition = -59.896355574431425;
         yPosition = -205.56737905652489;
         label = "New Device";
    }

    part instance NEW_DEVICE_4: Device {
         assetIdentifier = "15";
         xPosition = 243.79354248907467;
         yPosition = -90.0533765559308;
         label = "New Device 4";
    }

    part instance NEW_DEVICE_(COPY)_(COPY): Device {
         assetIdentifier = "";
         xPosition = 313.473908637616;
         yPosition = 126.0;
         label = "New Device (copy) (copy)";
         Random = "25";
    }

}


package Connections {

    part def DeviceConnection {
        property connectionType: String;
        property connectionDetails: Json?;
        property source: Float?;
        property target: Float?;
    }


    part instance 47 -> 48::DeviceConnection {
        connectionType = "c12";
        connectionDetails = "None";
        source = "47";
        target = "48";
    }

    part instance 46 -> 45::DeviceConnection {
        connectionType = "port";
        connectionDetails = "None";
        source = "46";
        target = "45";
    }

}