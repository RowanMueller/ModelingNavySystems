package Devices {
    
    part def Device {
        property componentName : string; 
        attribute ModelNumber: String?;
        attribute AssetName: String?;
        attribute SerialNumber: String?;
        attribute Comments: String?;
        attribute AssetCostAmount: String?;
        attribute NetBookValueAmount: String?;
        attribute Ownership: String?;
        attribute InventoryDate: String?;
        attribute DatePlacedInService: String?;
        attribute UsefulLifePeriods: String?;
        attribute AssetType: String?;
        attribute additionalAsJson: Json?;

        // Relationships
        part connections: DeviceConnection [0..*];  // A device can have multiple connections
    }

    // Define the connection between devices
    part def DeviceConnection {
        attribute connectionType: String;  // Example: "Ethernet", "USB", "Wireless"

        // Ethernet (TCP/IP)

        // USB (Data Transfer)

        // Wireless (Wi-Fi, Bluetooth, 5G)

        // Serial interfaces (UART, RS-232, I2C, SPI, CAN Bus)


        attribute description: String?;

        // Connected devices
        part device1: Device;
        part device2: Device;
    }

part instance 2f0b0068-b300-47d9-8849-2e8a0aab90b1 {
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

part instance 761c214e-529c-4be8-8b3a-c455f8cd3a3c {
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

part instance 519a1ab2-4d0b-43ff-b847-42a23dcd17a1 {
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

