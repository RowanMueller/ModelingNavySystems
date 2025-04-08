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

    part instance 2f0b0068-b300-47d9-8849-2e8a0aab90b1{
        assetIdentifier = "77020";
        manufacturer = "TECHNICAL MFG CO.";
        modelNumber = "77A-440-02";
        serialNumber = "2001238";
        comments = "S. RAY TAYLOR";
        assetCostAmount = 5460.37;
        netBookValueAmount = 0; 
        ownership = "11 UVA Owned";
        inventoryDate = "#########";
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
}

