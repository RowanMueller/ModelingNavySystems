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

    part instance 1: Device {
        assetIdentifier = "RAD001";
        assetName = "Primary Radar System";
        manufacturer = "Raytheon";
        modelNumber = "SPY-6";
        assetType = "Sensor";
        assetCostAmount = 2500000.00;
        xPosition = -150.0;
        yPosition = -100.0;
        comments = "Main radar system for surface and air detection";
    }

    part instance 2: Device {
        assetIdentifier = "CMS001";
        assetName = "Combat Management System";
        manufacturer = "Lockheed Martin";
        modelNumber = "Aegis BMD 5.1";
        assetType = "Command and Control";
        assetCostAmount = 5000000.00;
        xPosition = 0.0;
        yPosition = 0.0;
        comments = "Central combat management system";
    }

    part instance 3: Device {
        assetIdentifier = "WPN001";
        assetName = "Vertical Launch System";
        manufacturer = "BAE Systems";
        modelNumber = "Mk 41";
        assetType = "Weapon System";
        assetCostAmount = 3500000.00;
        xPosition = 150.0;
        yPosition = -50.0;
        comments = "Missile launch system";
    }

    part instance 4: Device {
        assetIdentifier = "COM001";
        assetName = "Satellite Communication System";
        manufacturer = "L3Harris";
        modelNumber = "WSC-9";
        assetType = "Communication";
        assetCostAmount = 1500000.00;
        xPosition = 50.0;
        yPosition = 150.0;
        comments = "Primary satellite communication system";
    }

    part instance 5: Device {
        assetIdentifier = "NAV001";
        assetName = "Navigation System";
        manufacturer = "Northrop Grumman";
        modelNumber = "IN-2000";
        assetType = "Navigation";
        assetCostAmount = 800000.00;
        xPosition = -100.0;
        yPosition = 100.0;
        comments = "Integrated navigation system";
    }

    part instance 6: Device {
        assetIdentifier = "SON001";
        assetName = "Sonar System";
        manufacturer = "Thales";
        modelNumber = "CAPTAS-4";
        assetType = "Sensor";
        assetCostAmount = 2000000.00;
        xPosition = -200.0;
        yPosition = 50.0;
        comments = "Advanced sonar system for underwater detection";
    }
}

package Connections {

    part def DeviceConnection {
        property connectionType: String;
        property connectionDetails: Json?;
        property source: Float?;
        property target: Float?;
    }

    part instance 1 -> 2::DeviceConnection {
        connectionType = "data";
        connectionDetails = "High-speed sensor data feed";
        source = Devices::1;
        target = Devices::2;
    }

    part instance 2 -> 3::DeviceConnection {
        connectionType = "command";
        connectionDetails = "Weapon control interface";
        source = Devices::2;
        target = Devices::3;
    }

    part instance 4 -> 2::DeviceConnection {
        connectionType = "data";
        connectionDetails = "External communication link";
        source = Devices::4;
        target = Devices::2;
    }

    part instance 5 -> 2::DeviceConnection {
        connectionType = "data";
        connectionDetails = "Navigation data feed";
        source = Devices::5;
        target = Devices::2;
    }

    part instance 6 -> 2::DeviceConnection {
        connectionType = "data";
        connectionDetails = "Underwater sensor data";
        source = Devices::6;
        target = Devices::2;
    }

    part instance 1 -> 6::DeviceConnection {
        connectionType = "sync";
        connectionDetails = "Sensor synchronization";
        source = Devices::1;
        target = Devices::6;
    }
} 