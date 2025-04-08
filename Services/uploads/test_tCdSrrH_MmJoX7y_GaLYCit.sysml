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
    // Example of Device instances with attributes filled in
    part instance 2f0b0068-b300-47d9-8849-2e8a0aab90b1{
        name = "Oven";
        assetId = "E843415";
        manufacturer = "TOBII";
        modelNumber = "LEGEND XTR";
        assetName = "Eye Tracking System";
        assetCostAmount = 18065;
        netBookValueAmount = 13731.46; 
        ownership = "11 UVA Owned";
        inventoryDate = "06/14/2022";
        datePlacedInService = "3/25/2022";
        usefulLifePeriods = 36;
        assetType = "566 Printer/Plotter";
        locationID = "Olsson Hall";
        test: "55"
    }

    part instance 985cbc27-0259-4027-91e5-0529896675ed {
        name = "Monitor X";
        assetId = "B5678";
        manufacturer = "Samsung";
        modelNumber = "U28E590D";
        assetType = "Monitor";
        serialNumber = "SN987654321";
    }
}

