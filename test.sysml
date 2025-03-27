package Devices {
    
    part def Device {
        attribute AssetId: String?;
        attribute Manufacturer: String?;
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
        part connections: DeviceConnection[*];  // A device can have multiple connections
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
    part instance Device1 {
        name = "Laptop A";
        assetId = "A1234";
        manufacturer = "Dell";
        modelNumber = "XPS 15";
        assetType = "Laptop";
        serialNumber = "SN123456789";
        
        // Connection to another device (e.g., connected to a monitor via HDMI)
        connections = [ 
            instance DeviceConnection1;
        ];
    }

    part instance Device2 {
        name = "Monitor X";
        assetId = "B5678";
        manufacturer = "Samsung";
        modelNumber = "U28E590D";
        assetType = "Monitor";
        serialNumber = "SN987654321";
        
        // Connection to the laptop
        connections = [ 
            instance DeviceConnection1;
        ];
    }

    // Connection instance between Device1 and Device2 (Laptop and Monitor)
    part instance DeviceConnection1 {
        connectionType = "HDMI";
        description = "Connection between Laptop A and Monitor X via HDMI";
        device1 = Device1;
        device2 = Device2;
    }
}

