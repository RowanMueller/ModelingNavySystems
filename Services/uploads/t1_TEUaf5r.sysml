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
        serialNumber = "RAY-SPY6-2023-001";
        assetType = "Sensor";
        assetCostAmount = 2500000.00;
        netBookValueAmount = "2100000.00";
        ownership = "US Navy";
        inventoryDate = "2023-01-15";
        datePlacedInService = "2023-03-01";
        usefulLifePeriods = "15 years";
        locationID = "DECK-01-FWD";
        buildingNumber = "1";
        buildingName = "Forward Mast";
        xPosition = -150.0;
        yPosition = -100.0;
        comments = "Main radar system for surface and air detection";
        powerConsumption = 75.5;
        maintenanceInterval = "6 months";
        lastMaintenanceDate = "2023-09-15";
        backupSystem = "RAD002";
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        networkInterface = "MIL-STD-1397";
        softwareVersion = "SPY6.3.2";
        weatherResistance = "Extreme";
        detectionRange = "1000nm";
        trackingCapacity = "1000";
    }

    part instance 2: Device {
        assetIdentifier = "CMS001";
        assetName = "Combat Management System";
        manufacturer = "Lockheed Martin";
        modelNumber = "Aegis BMD 5.1";
        serialNumber = "LM-AEGIS-2023-001";
        assetType = "Command and Control";
        assetCostAmount = 5000000.00;
        netBookValueAmount = "4750000.00";
        ownership = "US Navy";
        inventoryDate = "2023-01-10";
        datePlacedInService = "2023-03-01";
        usefulLifePeriods = "10 years";
        locationID = "CIC-MAIN";
        buildingNumber = "2";
        buildingName = "Combat Information Center";
        xPosition = 0.0;
        yPosition = 0.0;
        comments = "Central combat management system";
        powerConsumption = 45.0;
        maintenanceInterval = "3 months";
        lastMaintenanceDate = "2023-10-01";
        backupSystem = "CMS002";
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        networkInterface = "MIL-STD-1397";
        softwareVersion = "AEGIS-5.1.2";
        redundancyLevel = "Triple";
        processingCores = "64";
        aiCapabilities = "Advanced";
    }

    part instance 3: Device {
        assetIdentifier = "WPN001";
        assetName = "Vertical Launch System";
        manufacturer = "BAE Systems";
        modelNumber = "Mk 41";
        serialNumber = "BAE-MK41-2023-001";
        assetType = "Weapon System";
        assetCostAmount = 3500000.00;
        netBookValueAmount = "3200000.00";
        ownership = "US Navy";
        inventoryDate = "2023-01-20";
        datePlacedInService = "2023-03-01";
        usefulLifePeriods = "20 years";
        locationID = "DECK-02-FWD";
        xPosition = 150.0;
        yPosition = -50.0;
        comments = "Missile launch system";
        powerConsumption = 100.0;
        maintenanceInterval = "12 months";
        lastMaintenanceDate = "2023-08-15";
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        networkInterface = "MIL-STD-1397";
        missileCapacity = "96";
        launchCells = "8x12";
        coolingSystems = "Liquid";
    }

    part instance 4: Device {
        assetIdentifier = "COM001";
        assetName = "Satellite Communication System";
        manufacturer = "L3Harris";
        modelNumber = "WSC-9";
        serialNumber = "L3H-WSC9-2023-001";
        assetType = "Communication";
        assetCostAmount = 1500000.00;
        netBookValueAmount = "1400000.00";
        ownership = "US Navy";
        inventoryDate = "2023-01-25";
        datePlacedInService = "2023-03-01";
        locationID = "DECK-03-AFT";
        xPosition = 50.0;
        yPosition = 150.0;
        comments = "Primary satellite communication system";
        powerConsumption = 30.0;
        maintenanceInterval = "4 months";
        lastMaintenanceDate = "2023-09-30";
        backupSystem = "COM002";
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        networkInterface = "MIL-STD-1397";
        softwareVersion = "WSC9.2.1";
        frequencyBands = "X,Ka,UHF";
        encryptionLevel = "AES-256";
        dataRate = "100Gbps";
    }

    part instance 5: Device {
        assetIdentifier = "NAV001";
        assetName = "Navigation System";
        manufacturer = "Northrop Grumman";
        modelNumber = "IN-2000";
        serialNumber = "NG-IN2K-2023-001";
        assetType = "Navigation";
        assetCostAmount = 800000.00;
        netBookValueAmount = "750000.00";
        ownership = "US Navy";
        inventoryDate = "2023-01-30";
        datePlacedInService = "2023-03-01";
        locationID = "BRIDGE-01";
        xPosition = -100.0;
        yPosition = 100.0;
        comments = "Integrated navigation system";
        powerConsumption = 15.0;
        maintenanceInterval = "6 months";
        lastMaintenanceDate = "2023-07-15";
        backupSystem = "NAV002";
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        networkInterface = "MIL-STD-1397";
        softwareVersion = "NAV2.1.5";
        gpsChannels = "72";
        inertiaSensors = "Fiber Optic";
        updateRate = "100Hz";
    }

    part instance 6: Device {
        assetIdentifier = "SON001";
        assetName = "Sonar System";
        manufacturer = "Thales";
        modelNumber = "CAPTAS-4";
        serialNumber = "TH-CAP4-2023-001";
        assetType = "Sensor";
        assetCostAmount = 2000000.00;
        netBookValueAmount = "1900000.00";
        ownership = "US Navy";
        inventoryDate = "2023-02-01";
        datePlacedInService = "2023-03-01";
        locationID = "HULL-AFT-01";
        xPosition = -200.0;
        yPosition = 50.0;
        comments = "Advanced sonar system for underwater detection";
        powerConsumption = 85.0;
        maintenanceInterval = "4 months";
        lastMaintenanceDate = "2023-10-15";
        backupSystem = "SON002";
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        networkInterface = "MIL-STD-1397";
        softwareVersion = "CAPTAS4.2.3";
        depthRating = "500m";
        frequencyRange = "1-150kHz";
        beamCount = "256";
    }

    part instance 7: Device {
        assetIdentifier = "EW001";
        assetName = "Electronic Warfare System";
        manufacturer = "Raytheon";
        modelNumber = "AN/SLQ-32(V)6";
        serialNumber = "RAY-SLQ32-2023-001";
        assetType = "Electronic Warfare";
        assetCostAmount = 1800000.00;
        netBookValueAmount = "1700000.00";
        ownership = "US Navy";
        inventoryDate = "2023-02-05";
        datePlacedInService = "2023-03-01";
        locationID = "MAST-02";
        xPosition = 100.0;
        yPosition = -150.0;
        comments = "Advanced electronic warfare suite";
        powerConsumption = 60.0;
        maintenanceInterval = "3 months";
        lastMaintenanceDate = "2023-09-01";
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        networkInterface = "MIL-STD-1397";
        softwareVersion = "SLQ32.6.1";
        frequencyCoverage = "0.5-40GHz";
        jammerPower = "2000W";
        responseTime = "50ns";
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

    part instance 7 -> 2::DeviceConnection {
        connectionType = "data";
        connectionDetails = "Electronic warfare data feed";
        source = Devices::7;
        target = Devices::2;
    }

    part instance 7 -> 1::DeviceConnection {
        connectionType = "sync";
        connectionDetails = "Radar-EW coordination";
        source = Devices::7;
        target = Devices::1;
    }
} 