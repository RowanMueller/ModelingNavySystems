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

    part instance TABLE W/VIBRATION ISOLATION SYSTEM: Device {
        assetIdentifier = "77020";
        manufacturer = "TECHNICAL MFG CO.";
        modelNumber = "77A-440-02";
        assetName = "TABLE W/VIBRATION ISOLATION SYSTEM";
        serialNumber = "2001238";
        comments = "S. RAY TAYLOR";
        assetCostAmount = 5460.37;
        netBookValueAmount = 0;
        ownership = "11 UVA Owned";
        inventoryDate = "2022-05-19";
        datePlacedInService = "9/24/1997";
        usefulLifePeriods = 120;
        assetType = "562 Other Lab Equipment";
        oldTagNumber = "77020";
        locationID = "FM_0270_03_362";
        buildingName = "304 Research Lab";
        buildingNumber = "BL0270";
        floor = "03";
        roomNumber = "362";
    }

    part instance CAMERA, DIGITAL W/SCSI COMPUTER BOARD & POWER SUPPLY: Device {
        assetIdentifier = "77368";
        manufacturer = "POLAROID";
        modelNumber = "DMC1";
        assetName = "CAMERA, DIGITAL W/SCSI COMPUTER BOARD & POWER SUPPLY";
        serialNumber = "07731018AJ";
        assetCostAmount = 5575.35;
        netBookValueAmount = 0;
        ownership = "11 UVA Owned";
        inventoryDate = "2021-05-27";
        datePlacedInService = "12/5/1997";
        usefulLifePeriods = 120;
        assetType = "546 Lab Photographic Equipment";
        oldTagNumber = "77368";
        locationID = "FM_0204";
        buildingName = "B228 Eichenthal Room";
        buildingNumber = "BL0204";
    }

    part instance COMPUTER WORKSTATION, OCTANE/MX DUAL (CPU ONLY) W/ACCESSORIES: Device{
        assetIdentifier = "78390";
        manufacturer = "SILICON GRAPHICS";
        modelNumber = "R1000";
        assetName = "COMPUTER WORKSTATION, OCTANE/MX DUAL (CPU ONLY) W/ACCESSORIES";
        serialNumber = "0800690A3020";
        assetCostAmount = 67172.4;
        netBookValueAmount = 0;
        ownership = "11 UVA Owned";
        inventoryDate = "2021-05-27";
        datePlacedInService = "5/4/1998";
        usefulLifePeriods = 60;
        assetType = "525 Computers-Mini/Mainframe";
        oldTagNumber = "78390";
        locationID = "FM_0270_02_221";
        buildingName = "304 Research Lab";
        buildingNumber = "BL0270";
        floor = "02";
        roomNumber = "221";
    }
}

package DeviceConnections {

    part def DeviceConnection {
        property connectionType: String;
        property connectionDetails: Json?;
        property source: Devices::Device;
        property target: Devices::Device;
    }

    part instance TestConnection: DeviceConnection {
        connectionType = "USB";
        connectionDetails = {
            "cable": "Cat6",
            "bandwidth": "1Gbps"
        };
        source = Devices::CAMERA_DIGITAL_W_SCSI_COMPUTER_BOARD;
        target = Devices::COMPUTER WORKSTATION, OCTANE/MX DUAL (CPU ONLY) W/ACCESSORIES;
    }
}
 
