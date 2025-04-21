package Devices {

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
    }

    part instance 49: Device {
        assetIdentifier = "25";
        assetName = "New Device";
        xPosition = -59.896355574431425;
        yPosition = -205.56737905652489;
        label = "New Device";
    }
    part instance 50: Device {
        assetIdentifier = "30";
        assetName = "New Device (copy)";
        xPosition = -105.0;
        yPosition = -22.0;
        label = "New Device (copy)";
    }
    part instance 51: Device {
        assetIdentifier = "15";
        assetName = "New Device 4";
        xPosition = 243.79354248907467;
        yPosition = -90.0533765559308;
        label = "New Device 4";
    }
    part instance 52: Device {
        assetIdentifier = "";
        assetName = "New Device (copy) (copy)";
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

    part instance 51 -> 52::DeviceConnection {
        connectionType = "c12";
        connectionDetails = "";
        source = Devices::51;
        target = Devices::52;
    }
    part instance 49 -> 50::DeviceConnection {
        connectionType = "port";
        connectionDetails = "";
        source = Devices::49;
        target = Devices::50;
    }
}