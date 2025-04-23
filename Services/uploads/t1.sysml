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

    part instance 822: Device {
        assetIdentifier = "RAD001";
        manufacturer = "Raytheon";
        modelNumber = "SPY-6";
        assetName = "Primary Radar System";
        serialNumber = "RAY-SPY6-2023-001";
        comments = "Main radar system for surface and air detection";
        assetCostAmount = 2500000.0;
        netBookValueAmount = "2100000.0";
        ownership = "US Navy";
        inventoryDate = "2023-01-15";
        datePlacedInService = "2023-03-01";
        usefulLifePeriods = "15 years";
        assetType = "Sensor";
        locationID = "DECK-01-FWD";
        buildingNumber = "1";
        buildingName = "Forward Mast";
        xPosition = -330.5443825807637;
        yPosition = -298.93316228806367;
        label = "SPY-6 Radar";
        backupSystem = "RAD002";
        detectionRange = "1000nm";
        softwareVersion = "SPY6.3.2";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 75.5;
        trackingCapacity = 1000;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        weatherResistance = "Extreme";
        lastMaintenanceDate = "2023-09-15";
        maintenanceInterval = "6 months";
    }
    part instance 823: Device {
        assetIdentifier = "CMS001";
        manufacturer = "Lockheed Martin";
        modelNumber = "Aegis BMD 5.1";
        assetName = "Combat Management System";
        serialNumber = "LM-AEGIS-2023-001";
        comments = "Central combat management system";
        assetCostAmount = 5000000.0;
        netBookValueAmount = "4750000.0";
        ownership = "US Navy";
        inventoryDate = "2023-01-10";
        datePlacedInService = "2023-03-01";
        usefulLifePeriods = "10 years";
        assetType = "Command and Control";
        locationID = "CIC-MAIN";
        buildingNumber = "2";
        buildingName = "Combat Information Center";
        xPosition = 31.707245844724255;
        yPosition = -157.09499077613378;
        label = "Aegis CMS";
        backupSystem = "CMS002";
        aiCapabilities = "Advanced";
        processingCores = 64;
        redundancyLevel = "Triple";
        softwareVersion = "AEGIS-5.1.2";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 45;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-10-01";
        maintenanceInterval = "3 months";
    }
    part instance 824: Device {
        assetIdentifier = "WPN001";
        manufacturer = "BAE Systems";
        modelNumber = "Mk 41";
        assetName = "Vertical Launch System";
        serialNumber = "BAE-MK41-2023-001";
        comments = "Missile launch system";
        assetCostAmount = 3500000.0;
        netBookValueAmount = "3200000.0";
        ownership = "US Navy";
        inventoryDate = "2023-01-20";
        datePlacedInService = "2023-03-01";
        usefulLifePeriods = "20 years";
        assetType = "Weapon System";
        locationID = "DECK-02-FWD";
        xPosition = 478.90022507997986;
        yPosition = -182.15854144825022;
        label = "Mk 41 VLS";
        launchCells = "8x12";
        coolingSystems = "Liquid";
        missileCapacity = 96;
        networkInterface = "MIL-STD-1397";
        powerConsumption = 100;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-08-15";
        maintenanceInterval = "12 months";
    }
    part instance 825: Device {
        assetIdentifier = "COM001";
        manufacturer = "L3Harris";
        modelNumber = "WSC-9";
        assetName = "Satellite Communication System";
        serialNumber = "L3H-WSC9-2023-001";
        comments = "Primary satellite communication system";
        assetCostAmount = 1500000.0;
        netBookValueAmount = "1400000.0";
        ownership = "US Navy";
        inventoryDate = "2023-01-25";
        datePlacedInService = "2023-03-01";
        assetType = "Communication";
        locationID = "DECK-03-AFT";
        xPosition = 204.63292026593183;
        yPosition = 190.95682752989546;
        label = "SATCOM";
        dataRate = "100Gbps";
        backupSystem = "COM002";
        frequencyBands = "X,Ka,UHF";
        encryptionLevel = "AES-256";
        softwareVersion = "WSC9.2.1";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 30;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-09-30";
        maintenanceInterval = "4 months";
    }
    part instance 826: Device {
        assetIdentifier = "NAV001";
        manufacturer = "Northrop Grumman";
        modelNumber = "IN-2000";
        assetName = "Navigation System";
        serialNumber = "NG-IN2K-2023-001";
        comments = "Integrated navigation system";
        assetCostAmount = 800000.0;
        netBookValueAmount = "750000.0";
        ownership = "US Navy";
        inventoryDate = "2023-01-30";
        datePlacedInService = "2023-03-01";
        assetType = "Navigation";
        locationID = "BRIDGE-01";
        xPosition = -107.52268260753182;
        yPosition = 298.09730866500456;
        label = "Nav System";
        updateRate = "100Hz";
        gpsChannels = 72;
        backupSystem = "NAV002";
        inertiaSensors = "Fiber Optic";
        softwareVersion = "NAV2.1.5";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 15;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-07-15";
        maintenanceInterval = "6 months";
    }
    part instance 827: Device {
        assetIdentifier = "SON001";
        manufacturer = "Thales";
        modelNumber = "CAPTAS-4";
        assetName = "Sonar System";
        serialNumber = "TH-CAP4-2023-001";
        comments = "Advanced sonar system for underwater detection";
        assetCostAmount = 2000000.0;
        netBookValueAmount = "1900000.0";
        ownership = "US Navy";
        inventoryDate = "2023-02-01";
        datePlacedInService = "2023-03-01";
        assetType = "Sensor";
        locationID = "HULL-AFT-01";
        xPosition = -350.4536521506364;
        yPosition = 200.4536521506364;
        label = "CAPTAS-4 Sonar";
        beamCount = 256;
        depthRating = "500m";
        backupSystem = "SON002";
        frequencyRange = "1-150kHz";
        softwareVersion = "CAPTAS4.2.3";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 85;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-10-15";
        maintenanceInterval = "4 months";
    }
    part instance 828: Device {
        assetIdentifier = "EW001";
        manufacturer = "Raytheon";
        modelNumber = "AN/SLQ-32(V)6";
        assetName = "Electronic Warfare System";
        serialNumber = "RAY-SLQ32-2023-001";
        comments = "Advanced electronic warfare suite";
        assetCostAmount = 1800000.0;
        netBookValueAmount = "1700000.0";
        ownership = "US Navy";
        inventoryDate = "2023-02-05";
        datePlacedInService = "2023-03-01";
        assetType = "Electronic Warfare";
        locationID = "MAST-02";
        xPosition = 254.21251388115886;
        yPosition = -487.249796712067;
        label = "SLQ-32 EW";
        jammerPower = "2000W";
        responseTime = "50ns";
        softwareVersion = "SLQ32.6.1";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 60;
        frequencyCoverage = "0.5-40GHz";
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-09-01";
        maintenanceInterval = "3 months";
    }
}

package Connections {

    part def DeviceConnection {
        property connectionType: String;
        property connectionDetails: Json?;
        property source: Float?;
        property target: Float?;
    }

    part instance 822 -> 823::DeviceConnection {
        connectionType = "data";
        source = Devices::822;
        target = Devices::823;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "High-speed sensor data feed";
    }
    part instance 823 -> 824::DeviceConnection {
        connectionType = "command";
        source = Devices::823;
        target = Devices::824;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Triple redundant";
        responseTime = "<5ms";
        authentication = "PKI-based";
        connectionDetails = "Weapon control interface";
    }
    part instance 825 -> 823::DeviceConnection {
        connectionType = "data";
        source = Devices::825;
        target = Devices::823;
        bandwidth = "100 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.999%";
        errorCorrection = "Forward EC";
        connectionDetails = "External communication link";
    }
    part instance 826 -> 823::DeviceConnection {
        connectionType = "data";
        source = Devices::826;
        target = Devices::823;
        format = "NMEA 2000";
        protocol = "MIL-STD-1397";
        precision = "High";
        updateRate = "100Hz";
        validation = "Checksum";
        reliability = "99.999%";
        connectionDetails = "Navigation data feed";
    }
    part instance 827 -> 823::DeviceConnection {
        connectionType = "data";
        source = Devices::827;
        target = Devices::823;
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        bufferSize = "1TB";
        dataFormat = "Raw + Processed";
        compression = "Lossy";
        connectionDetails = "Underwater sensor data";
    }
    part instance 822 -> 827::DeviceConnection {
        connectionType = "sync";
        source = Devices::822;
        target = Devices::827;
        jitter = "<1μs";
        accuracy = "±100ns";
        protocol = "MIL-STD-1397";
        syncRate = "1kHz";
        timeSource = "GPS";
        fallbackMode = "Internal";
        connectionDetails = "Sensor synchronization";
    }
    part instance 828 -> 823::DeviceConnection {
        connectionType = "data";
        source = Devices::828;
        target = Devices::823;
        latency = "<1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Electronic warfare data feed";
    }
    part instance 828 -> 822::DeviceConnection {
        connectionType = "sync";
        source = Devices::828;
        target = Devices::822;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "1kHz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "Radar-EW coordination";
    }
}