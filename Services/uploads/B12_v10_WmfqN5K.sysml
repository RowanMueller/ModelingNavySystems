
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


    part instance NEW DEVICE (COPY) (COPY): Device {
         assetIdentifier = "";
    }

    part instance NEW DEVICE (COPY): Device {
         assetIdentifier = "30";
    }

    part instance NEW DEVICE: Device {
         assetIdentifier = "25";
    }

    part instance NEW DEVICE 4: Device {
         assetIdentifier = "15";
    }

}


package Connections {

    part def DeviceConnection {
        property ConnectionType: String;
        property ConnectionDetails: Json?;
        part Source: Devices::Device;
        part Target: Devices::Device;
    }


    part instance 40 -> 37::DeviceConnection {
        connectionType = "c12";
        connectionDetails = "None";
        source = "40";
        target = "37";
    }

    part instance 39 -> 38::DeviceConnection {
        connectionType = "port";
        connectionDetails = "None";
        source = "39";
        target = "38";
    }

}