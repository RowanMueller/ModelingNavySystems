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

    part instance 1154: Device {
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
        xPosition = -308.10288011911734;
        yPosition = -333.8421661172913;
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
    part instance 1155: Device {
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
        xPosition = 199.7072458447243;
        yPosition = 1646.9050092238663;
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
    part instance 1156: Device {
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
        xPosition = 2244.068499559685;
        yPosition = 690.1527270140972;
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
    part instance 1157: Device {
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
        xPosition = 183.204417257253;
        yPosition = 189.94358860730392;
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
    part instance 1158: Device {
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
        xPosition = -517.5181704762257;
        yPosition = 276.5054104928823;
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
    part instance 1159: Device {
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
        xPosition = 206.83600868435;
        yPosition = -596.9638087467823;
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
    part instance 1160: Device {
        assetIdentifier = "RAD002";
        manufacturer = "Raytheon";
        modelNumber = "SPY-6(V)1";
        assetName = "Secondary Radar System";
        serialNumber = "RAY-SPY6V1-2023-001";
        comments = "Backup radar system for redundancy";
        assetCostAmount = 2000000.0;
        netBookValueAmount = "1800000.0";
        ownership = "US Navy";
        inventoryDate = "2023-02-10";
        datePlacedInService = "2023-03-15";
        usefulLifePeriods = "15 years";
        assetType = "Sensor";
        locationID = "DECK-01-AFT";
        buildingNumber = "1";
        buildingName = "Aft Mast";
        xPosition = -418.44126299202225;
        yPosition = 402.2335112141666;
        label = "SPY-6(V)1 Radar";
        detectionRange = "800nm";
        softwareVersion = "SPY6V1.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 70;
        trackingCapacity = 800;
        operationalStatus = "STANDBY";
        securityClearance = "TOP_SECRET";
        weatherResistance = "Extreme";
        lastMaintenanceDate = "2023-09-20";
        maintenanceInterval = "6 months";
    }
    part instance 1161: Device {
        assetIdentifier = "CMS002";
        manufacturer = "Lockheed Martin";
        modelNumber = "Aegis BMD 5.0";
        assetName = "Backup Combat Management System";
        serialNumber = "LM-AEGIS-2023-002";
        comments = "Backup combat management system";
        assetCostAmount = 4500000.0;
        netBookValueAmount = "4250000.0";
        ownership = "US Navy";
        inventoryDate = "2023-02-15";
        datePlacedInService = "2023-03-15";
        usefulLifePeriods = "10 years";
        assetType = "Command and Control";
        locationID = "CIC-BACKUP";
        buildingNumber = "2";
        buildingName = "Backup Combat Information Center";
        xPosition = 96.0;
        yPosition = 108.0;
        label = "Aegis CMS Backup";
        aiCapabilities = "Basic";
        processingCores = 32;
        redundancyLevel = "Double";
        softwareVersion = "AEGIS-5.0.1";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 40;
        operationalStatus = "STANDBY";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-10-05";
        maintenanceInterval = "3 months";
    }
    part instance 1162: Device {
        assetIdentifier = "NAV002";
        manufacturer = "Honeywell";
        modelNumber = "HG1700 IMU";
        assetName = "Backup Navigation System";
        serialNumber = "HW-HG1700-2023-001";
        comments = "Backup inertial measurement unit";
        assetCostAmount = 400000.0;
        netBookValueAmount = "350000.0";
        ownership = "US Navy";
        inventoryDate = "2023-03-01";
        datePlacedInService = "2023-04-01";
        assetType = "Navigation";
        locationID = "NAV-RM-01";
        xPosition = -156.15575396598572;
        yPosition = 560.1032472811647;
        label = "Backup Nav";
        updateRate = "50Hz";
        gpsChannels = 0;
        inertiaSensors = "Ring Laser Gyro";
        softwareVersion = "HG1700.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 10;
        operationalStatus = "STANDBY";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-08-01";
        maintenanceInterval = "6 months";
    }
    part instance 1163: Device {
        assetIdentifier = "EW002";
        manufacturer = "Northrop Grumman";
        modelNumber = "AN/ALQ-218(V)2";
        assetName = "Tactical Jamming System";
        serialNumber = "NG-ALQ218-2023-001";
        comments = "Tactical jamming system";
        assetCostAmount = 1200000.0;
        netBookValueAmount = "1100000.0";
        ownership = "US Navy";
        inventoryDate = "2023-03-10";
        datePlacedInService = "2023-04-01";
        assetType = "Electronic Warfare";
        locationID = "MAST-03";
        xPosition = 427.09051723152425;
        yPosition = -572.3115079319714;
        label = "ALQ-218 Jammer";
        jammerPower = "1500W";
        responseTime = "75ns";
        softwareVersion = "ALQ218.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 55;
        frequencyCoverage = "2-20GHz";
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-09-05";
        maintenanceInterval = "3 months";
    }
    part instance 1164: Device {
        assetIdentifier = "DCN001";
        manufacturer = "Cisco";
        modelNumber = "Catalyst 9300";
        assetName = "Network Switch";
        serialNumber = "CSCO-CAT9300-2023-001";
        comments = "Core network switch for shipboard network";
        assetCostAmount = 50000.0;
        netBookValueAmount = "45000.0";
        ownership = "US Navy";
        inventoryDate = "2023-03-15";
        datePlacedInService = "2023-04-01";
        usefulLifePeriods = "7 years";
        assetType = "Networking";
        locationID = "SERVER-RM-01";
        buildingNumber = "3";
        buildingName = "Server Room";
        xPosition = 1022.0;
        yPosition = 1666.0;
        label = "Core Switch";
        portCount = 48;
        uplinkSpeed = "100Gbps";
        softwareVersion = "IOS-XE 17.03.01";
        networkInterface = "Ethernet";
        powerConsumption = 150;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-10";
        maintenanceInterval = "6 months";
    }
    part instance 1165: Device {
        assetIdentifier = "UPS001";
        manufacturer = "APC";
        modelNumber = "Smart-UPS X 3000VA";
        assetName = "Uninterruptible Power Supply";
        serialNumber = "APC-SUX3000-2023-001";
        comments = "UPS for server room equipment";
        assetCostAmount = 10000.0;
        netBookValueAmount = "9000.0";
        ownership = "US Navy";
        inventoryDate = "2023-03-25";
        datePlacedInService = "2023-04-01";
        usefulLifePeriods = "5 years";
        assetType = "Power";
        locationID = "SERVER-RM-01";
        buildingNumber = "3";
        buildingName = "Server Room";
        xPosition = -282.0;
        yPosition = -184.0;
        label = "UPS";
        capacity = "3000VA";
        backupTime = "30 minutes";
        inputVoltage = "120V";
        outputVoltage = "120V";
        networkInterface = "Ethernet";
        powerConsumption = 50;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-20";
        maintenanceInterval = "6 months";
    }
    part instance 1166: Device {
        assetIdentifier = "FCS001";
        manufacturer = "Simplex";
        modelNumber = "4010ES";
        assetName = "Fire Control System";
        serialNumber = "SMPLX-4010ES-2023-001";
        comments = "Fire control system for the ship";
        assetCostAmount = 20000.0;
        netBookValueAmount = "18000.0";
        ownership = "US Navy";
        inventoryDate = "2023-04-01";
        datePlacedInService = "2023-04-01";
        usefulLifePeriods = "15 years";
        assetType = "Safety";
        locationID = "SEC-RM-01";
        buildingNumber = "5";
        buildingName = "Security Room";
        xPosition = -162.0;
        yPosition = -266.0;
        label = "Fire Control";
        zoneCount = 100;
        deviceCapacity = 500;
        softwareVersion = "4010ES 2.0";
        networkInterface = "Ethernet";
        powerConsumption = 40;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-30";
        maintenanceInterval = "6 months";
    }
    part instance 1167: Device {
        assetIdentifier = "CAM001";
        manufacturer = "Axis Communications";
        modelNumber = "P3245-LVE";
        assetName = "Security Camera";
        serialNumber = "AXIS-P3245-2023-001";
        comments = "Security camera for deck monitoring";
        assetCostAmount = 1000.0;
        netBookValueAmount = "900.0";
        ownership = "US Navy";
        inventoryDate = "2023-04-05";
        datePlacedInService = "2023-04-01";
        usefulLifePeriods = "5 years";
        assetType = "Security";
        locationID = "DECK-04-FWD";
        xPosition = -8.0;
        yPosition = 54.0;
        label = "Camera 01";
        ipRating = "IP66";
        frameRate = "30fps";
        resolution = "1080p";
        nightVision = "Yes";
        networkInterface = "Ethernet";
        powerConsumption = 10;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-01";
        maintenanceInterval = "12 months";
    }
    part instance 1168: Device {
        assetIdentifier = "ACS001";
        manufacturer = "HID Global";
        modelNumber = "iCLASS SE Reader";
        assetName = "Access Control Reader";
        serialNumber = "HID-ICLASS-2023-001";
        comments = "Access control reader for secured areas";
        assetCostAmount = 500.0;
        netBookValueAmount = "450.0";
        ownership = "US Navy";
        inventoryDate = "2023-04-10";
        datePlacedInService = "2023-04-01";
        usefulLifePeriods = "7 years";
        assetType = "Security";
        locationID = "SEC-AREA-01";
        xPosition = 866.0;
        yPosition = -38.0;
        label = "Reader 01";
        ipRating = "IP55";
        cardTypes = "iCLASS, SEOS";
        powerConsumption = 5;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-05";
        maintenanceInterval = "12 months";
        communicationProtocol = "Wiegand";
    }
    part instance 1169: Device {
        assetIdentifier = "PLC001";
        manufacturer = "Siemens";
        modelNumber = "S7-1500";
        assetName = "Programmable Logic Controller";
        serialNumber = "SIEMENS-S7-1500-2023-001";
        comments = "PLC for controlling machinery and systems";
        assetCostAmount = 25000.0;
        netBookValueAmount = "22500.0";
        ownership = "US Navy";
        inventoryDate = "2023-04-15";
        datePlacedInService = "2023-04-01";
        usefulLifePeriods = "10 years";
        assetType = "Automation";
        locationID = "ENG-RM-02";
        xPosition = -274.0;
        yPosition = -814.0;
        label = "PLC 01";
        memorySize = "512MB";
        networkInterface = "PROFINET";
        powerConsumption = 30;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-10";
        maintenanceInterval = "6 months";
        programmingLanguage = "STEP 7";
    }
    part instance 1170: Device {
        assetIdentifier = "ENG001";
        manufacturer = "Caterpillar";
        modelNumber = "3512C";
        assetName = "Diesel Generator";
        serialNumber = "CAT-3512C-2023-001";
        comments = "Main diesel generator for power supply";
        assetCostAmount = 1000000.0;
        netBookValueAmount = "900000.0";
        ownership = "US Navy";
        inventoryDate = "2023-04-20";
        datePlacedInService = "2023-05-01";
        usefulLifePeriods = "25 years";
        assetType = "Power Generation";
        locationID = "ENG-RM-03";
        xPosition = 374.0;
        yPosition = -742.0;
        label = "Generator 01";
        fuelType = "Diesel";
        powerOutput = "2500kW";
        operatingHours = 5000;
        networkInterface = "Modbus";
        powerConsumption = "0.0; // (It generates power)";
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-15";
        maintenanceInterval = "12 months";
    }
    part instance 1171: Device {
        assetIdentifier = "RAD003";
        manufacturer = "Raytheon";
        modelNumber = "AN/SPS-48G";
        assetName = "3D Air Search Radar";
        serialNumber = "RAY-SPS48G-2023-001";
        comments = "Long range 3D air search radar";
        assetCostAmount = 3000000.0;
        netBookValueAmount = "2700000.0";
        ownership = "US Navy";
        inventoryDate = "2023-05-05";
        datePlacedInService = "2023-05-15";
        usefulLifePeriods = "20 years";
        assetType = "Sensor";
        locationID = "MAST-04";
        buildingNumber = "1";
        buildingName = "Forward Mast";
        xPosition = -997.5580185991056;
        yPosition = 396.85676654773357;
        label = "SPS-48G Radar";
        detectionRange = "250nm";
        softwareVersion = "SPS48G.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 90;
        trackingCapacity = 1200;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        weatherResistance = "Extreme";
        lastMaintenanceDate = "2023-10-01";
        maintenanceInterval = "6 months";
    }
    part instance 1172: Device {
        assetIdentifier = "WPN003";
        manufacturer = "General Dynamics";
        modelNumber = "Phalanx CIWS";
        assetName = "Close-In Weapon System";
        serialNumber = "GD-PHALANX-2023-001";
        comments = "Last line of defense against incoming missiles";
        assetCostAmount = 1500000.0;
        netBookValueAmount = "1350000.0";
        ownership = "US Navy";
        inventoryDate = "2023-05-15";
        datePlacedInService = "2023-06-01";
        usefulLifePeriods = "25 years";
        assetType = "Weapon System";
        locationID = "DECK-05-AFT";
        xPosition = 675.7657703769611;
        yPosition = 88.02528049706277;
        label = "Phalanx CIWS";
        launchCells = "N/A";
        coolingSystems = "Liquid";
        missileCapacity = "N/A (Uses 20mm rounds)";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 120;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-09-01";
        maintenanceInterval = "12 months";
    }
    part instance 1173: Device {
        assetIdentifier = "COM003";
        manufacturer = "Rockwell Collins";
        modelNumber = "HF-9000";
        assetName = "High Frequency Radio System";
        serialNumber = "RC-HF9000-2023-001";
        comments = "Backup high frequency radio communication";
        assetCostAmount = 600000.0;
        netBookValueAmount = "540000.0";
        ownership = "US Navy";
        inventoryDate = "2023-05-20";
        datePlacedInService = "2023-06-01";
        assetType = "Communication";
        locationID = "RADIO-RM-02";
        xPosition = 925.477004755738;
        yPosition = 334.8847911516068;
        label = "HF Radio";
        dataRate = "5Mbps";
        frequencyBands = "HF";
        encryptionLevel = "AES-256";
        softwareVersion = "HF9000.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 25;
        operationalStatus = "STANDBY";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-09-15";
        maintenanceInterval = "4 months";
    }
    part instance 1174: Device {
        assetIdentifier = "NAV003";
        manufacturer = "Raymarine";
        modelNumber = "Axiom Pro 12";
        assetName = "Chartplotter";
        serialNumber = "RM-AXIOM12-2023-001";
        comments = "Navigation chartplotter for bridge use";
        assetCostAmount = 5000.0;
        netBookValueAmount = "4500.0";
        ownership = "US Navy";
        inventoryDate = "2023-05-25";
        datePlacedInService = "2023-06-01";
        assetType = "Navigation";
        locationID = "BRIDGE-02";
        xPosition = -354.3630268045933;
        yPosition = 496.93452379591446;
        label = "Chartplotter";
        updateRate = "10Hz";
        gpsChannels = 72;
        inertiaSensors = "None";
        softwareVersion = "AxiomPro.2.0";
        networkInterface = "NMEA 2000";
        powerConsumption = 10;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-08-01";
        maintenanceInterval = "6 months";
    }
    part instance 1175: Device {
        assetIdentifier = "DCN002";
        manufacturer = "Juniper Networks";
        modelNumber = "EX4300";
        assetName = "Distribution Switch";
        serialNumber = "JNP-EX4300-2023-001";
        comments = "Distribution network switch for various departments";
        assetCostAmount = 40000.0;
        netBookValueAmount = "36000.0";
        ownership = "US Navy";
        inventoryDate = "2023-06-10";
        datePlacedInService = "2023-07-01";
        usefulLifePeriods = "7 years";
        assetType = "Networking";
        locationID = "NET-RM-01";
        buildingNumber = "3";
        buildingName = "Network Room";
        xPosition = -99.0;
        yPosition = 165.0;
        label = "Dist Switch";
        portCount = 24;
        uplinkSpeed = "40Gbps";
        softwareVersion = "Junos 18.4R2";
        networkInterface = "Ethernet";
        powerConsumption = 120;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-01";
        maintenanceInterval = "6 months";
    }
    part instance 1176: Device {
        assetIdentifier = "SRV002";
        manufacturer = "HP";
        modelNumber = "ProLiant DL380 Gen10";
        assetName = "Database Server";
        serialNumber = "HP-DL380G10-2023-001";
        comments = "Database server for shipboard databases";
        assetCostAmount = 80000.0;
        netBookValueAmount = "72000.0";
        ownership = "US Navy";
        inventoryDate = "2023-06-15";
        datePlacedInService = "2023-07-01";
        usefulLifePeriods = "5 years";
        assetType = "Server";
        locationID = "SERVER-RM-02";
        buildingNumber = "3";
        buildingName = "Server Room";
        xPosition = -399.0;
        yPosition = 703.0;
        label = "DB Server";
        cpuCores = 32;
        memorySize = "256GB";
        operatingSystem = "Windows Server 2019";
        storageCapacity = "20TB";
        networkInterface = "Ethernet";
        powerConsumption = 350;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-05";
        maintenanceInterval = "3 months";
    }
    part instance 1177: Device {
        assetIdentifier = "FCS002";
        manufacturer = "Notifier";
        modelNumber = "NFS2-3030";
        assetName = "Advanced Fire Alarm System";
        serialNumber = "NOTIFIER-NFS2-2023-001";
        comments = "Advanced fire alarm control panel";
        assetCostAmount = 22000.0;
        netBookValueAmount = "19800.0";
        ownership = "US Navy";
        inventoryDate = "2023-06-30";
        datePlacedInService = "2023-07-01";
        usefulLifePeriods = "15 years";
        assetType = "Safety";
        locationID = "SEC-RM-02";
        buildingNumber = "5";
        buildingName = "Security Room";
        xPosition = 1749.0;
        yPosition = -5.0;
        label = "Fire Alarm";
        zoneCount = 150;
        deviceCapacity = 750;
        softwareVersion = "NFS2-3030 4.0";
        networkInterface = "Ethernet";
        powerConsumption = 45;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-20";
        maintenanceInterval = "6 months";
    }
    part instance 1178: Device {
        assetIdentifier = "PLC002";
        manufacturer = "Allen-Bradley";
        modelNumber = "ControlLogix 5580";
        assetName = "Redundant PLC System";
        serialNumber = "AB-CL5580-2023-001";
        comments = "Redundant PLC system for critical machinery";
        assetCostAmount = 30000.0;
        netBookValueAmount = "27000.0";
        ownership = "US Navy";
        inventoryDate = "2023-07-15";
        datePlacedInService = "2023-07-15";
        usefulLifePeriods = "10 years";
        assetType = "Automation";
        locationID = "ENG-RM-06";
        xPosition = 1541.0;
        yPosition = -281.0;
        label = "PLC 02";
        memorySize = "1GB";
        networkInterface = "Ethernet/IP";
        powerConsumption = 35;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-10";
        maintenanceInterval = "6 months";
        programmingLanguage = "Ladder Logic";
    }
    part instance 1179: Device {
        assetIdentifier = "ENG002";
        manufacturer = "Cummins";
        modelNumber = "QSK60-DM";
        assetName = "Emergency Diesel Generator";
        serialNumber = "CUM-QSK60-2023-001";
        comments = "Emergency diesel generator for backup power";
        assetCostAmount = 800000.0;
        netBookValueAmount = "720000.0";
        ownership = "US Navy";
        inventoryDate = "2023-07-20";
        datePlacedInService = "2023-08-01";
        usefulLifePeriods = "25 years";
        assetType = "Power Generation";
        locationID = "ENG-RM-07";
        xPosition = 561.0;
        yPosition = -775.0;
        label = "Generator 02";
        fuelType = "Diesel";
        powerOutput = "2000kW";
        operatingHours = 1000;
        networkInterface = "Modbus";
        powerConsumption = "0.0; // Generates power";
        operationalStatus = "STANDBY";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-15";
        maintenanceInterval = "12 months";
    }
    part instance 1180: Device {
        assetIdentifier = "WAT002";
        manufacturer = "Veolia Water Technologies";
        modelNumber = "Sea Recovery Aquamatic 1800";
        assetName = "Reverse Osmosis Desalination Unit";
        serialNumber = "VWT-SR1800-2023-001";
        comments = "Secondary fresh water generator using reverse osmosis";
        assetCostAmount = 300000.0;
        netBookValueAmount = "270000.0";
        ownership = "US Navy";
        inventoryDate = "2023-07-25";
        datePlacedInService = "2023-08-01";
        usefulLifePeriods = "20 years";
        assetType = "Utilities";
        locationID = "UTIL-RM-03";
        xPosition = 1671.0;
        yPosition = 353.0;
        label = "RO Unit";
        waterQuality = "Potable";
        operatingHours = 3500;
        networkInterface = "None";
        powerConsumption = 200;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        productionCapacity = "30 m³/day";
        lastMaintenanceDate = "2023-11-20";
        maintenanceInterval = "12 months";
    }
    part instance 1181: Device {
        assetIdentifier = "RAD004";
        manufacturer = "Terma A/S";
        modelNumber = "SCANTER 6002";
        assetName = "Navigation Radar";
        serialNumber = "TERMA-S6002-2023-001";
        comments = "Navigation radar for surface surveillance";
        assetCostAmount = 150000.0;
        netBookValueAmount = "135000.0";
        ownership = "US Navy";
        inventoryDate = "2023-08-05";
        datePlacedInService = "2023-08-15";
        usefulLifePeriods = "15 years";
        assetType = "Sensor";
        locationID = "BRIDGE-MAST";
        buildingNumber = "1";
        buildingName = "Bridge Mast";
        xPosition = -575.272240169742;
        yPosition = -401.0127599833434;
        label = "Nav Radar";
        detectionRange = "60nm";
        softwareVersion = "SCANTER 12.0";
        networkInterface = "Ethernet";
        powerConsumption = 50;
        trackingCapacity = 50;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        weatherResistance = "Severe";
        lastMaintenanceDate = "2023-10-01";
        maintenanceInterval = "6 months";
    }
    part instance 1182: Device {
        assetIdentifier = "CMS004";
        manufacturer = "Raytheon";
        modelNumber = "Integrated Bridge System";
        assetName = "Navigation Control System";
        serialNumber = "RAY-IBS-2023-001";
        comments = "Integrates radar, ECDIS, and other nav systems";
        assetCostAmount = 750000.0;
        netBookValueAmount = "675000.0";
        ownership = "US Navy";
        inventoryDate = "2023-08-10";
        datePlacedInService = "2023-09-01";
        usefulLifePeriods = "10 years";
        assetType = "Command and Control";
        locationID = "BRIDGE-MAIN";
        buildingNumber = "2";
        buildingName = "Bridge Main";
        xPosition = -64.0;
        yPosition = -812.0;
        label = "IBS System";
        aiCapabilities = "Basic";
        processingCores = 8;
        redundancyLevel = "Double";
        softwareVersion = "IBS 3.0";
        networkInterface = "NMEA 2000";
        powerConsumption = 20;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-15";
        maintenanceInterval = "3 months";
    }
    part instance 1183: Device {
        assetIdentifier = "WPN004";
        manufacturer = "MBDA";
        modelNumber = "Sea Ceptor";
        assetName = "Surface-to-Air Missile System";
        serialNumber = "MBDA-SCEP-2023-001";
        comments = "Quick reaction air defense system";
        assetCostAmount = 2000000.0;
        netBookValueAmount = "1800000.0";
        ownership = "US Navy";
        inventoryDate = "2023-08-15";
        datePlacedInService = "2023-09-01";
        usefulLifePeriods = "20 years";
        assetType = "Weapon System";
        locationID = "DECK-08-MID";
        xPosition = 851.6095374717273;
        yPosition = -145.1429939826423;
        label = "Sea Ceptor";
        launchCells = 12;
        coolingSystems = "Air";
        missileCapacity = 12;
        networkInterface = "MIL-STD-1397";
        powerConsumption = 110;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-09-01";
        maintenanceInterval = "12 months";
    }
    part instance 1184: Device {
        assetIdentifier = "COM004";
        manufacturer = "Iridium Communications";
        modelNumber = "Iridium Certus 9770";
        assetName = "Satellite Communication Terminal";
        serialNumber = "IRD-CER-9770-2023-001";
        comments = "Global satellite communication terminal";
        assetCostAmount = 400000.0;
        netBookValueAmount = "360000.0";
        ownership = "US Navy";
        inventoryDate = "2023-08-20";
        datePlacedInService = "2023-09-01";
        assetType = "Communication";
        locationID = "RADIO-RM-03";
        xPosition = 394.5450191461381;
        yPosition = 290.98676107740846;
        label = "Iridium SatCom";
        dataRate = "700kbps";
        frequencyBands = "L-band";
        encryptionLevel = "AES-256";
        softwareVersion = "Certus 1.0";
        networkInterface = "Ethernet";
        powerConsumption = 30;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-09-15";
        maintenanceInterval = "4 months";
    }
    part instance 1185: Device {
        assetIdentifier = "NAV004";
        manufacturer = "Sperry Marine";
        modelNumber = "VisionMaster FT ECDIS";
        assetName = "Electronic Chart Display and Information System";
        serialNumber = "SPM-VMEC-2023-001";
        comments = "Navigation system based on electronic charts";
        assetCostAmount = 150000.0;
        netBookValueAmount = "135000.0";
        ownership = "US Navy";
        inventoryDate = "2023-08-25";
        datePlacedInService = "2023-09-01";
        assetType = "Navigation";
        locationID = "BRIDGE-03";
        xPosition = 50.804768735863675;
        yPosition = 483.19427338564003;
        label = "ECDIS";
        updateRate = "Continuous";
        gpsChannels = 72;
        inertiaSensors = "None";
        softwareVersion = "VisionMaster 5.0";
        networkInterface = "NMEA 2000";
        powerConsumption = 15;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-08-01";
        maintenanceInterval = "6 months";
    }
    part instance 1186: Device {
        assetIdentifier = "SON004";
        manufacturer = "Teledyne Marine";
        modelNumber = "SeaBat T50-R";
        assetName = "Forward Looking Sonar";
        serialNumber = "TLD-SBT50-2023-001";
        comments = "Forward looking sonar for obstacle avoidance";
        assetCostAmount = 1800000.0;
        netBookValueAmount = "1620000.0";
        ownership = "US Navy";
        inventoryDate = "2023-08-30";
        datePlacedInService = "2023-09-01";
        assetType = "Sensor";
        locationID = "HULL-FWD-02";
        xPosition = -240.3379857771546;
        yPosition = 303.4802613509247;
        label = "Forward Sonar";
        beamCount = 512;
        depthRating = "300m";
        frequencyRange = "200-400kHz";
        softwareVersion = "SeaBat 1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 100;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-10-05";
        maintenanceInterval = "4 months";
    }
    part instance 1187: Device {
        assetIdentifier = "EW004";
        manufacturer = "Elbit Systems";
        modelNumber = "DESEAVER MK III";
        assetName = "Naval Electronic Warfare Suite";
        serialNumber = "ELB-DES3-2023-001";
        comments = "Electronic warfare suite for signal intelligence";
        assetCostAmount = 2000000.0;
        netBookValueAmount = "1800000.0";
        ownership = "US Navy";
        inventoryDate = "2023-09-05";
        datePlacedInService = "2023-09-15";
        assetType = "Electronic Warfare";
        locationID = "MAST-05";
        xPosition = 629.064039386341;
        yPosition = -450.07799671780487;
        label = "EW Suite";
        jammerPower = "2000W";
        responseTime = "55ns";
        softwareVersion = "DESEAVER 3.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 70;
        frequencyCoverage = "0.5-40GHz";
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-09-10";
        maintenanceInterval = "3 months";
    }
    part instance 1188: Device {
        assetIdentifier = "SRV003";
        manufacturer = "Oracle";
        modelNumber = "SPARC T8-1";
        assetName = "Enterprise Database Server";
        serialNumber = "ORC-SPARC-2023-001";
        comments = "High-performance database server for critical operations";
        assetCostAmount = 90000.0;
        netBookValueAmount = "81000.0";
        ownership = "US Navy";
        inventoryDate = "2023-09-15";
        datePlacedInService = "2023-10-01";
        usefulLifePeriods = "5 years";
        assetType = "Server";
        locationID = "SERVER-RM-03";
        buildingNumber = "3";
        buildingName = "Server Room";
        xPosition = 2149.0853985683084;
        yPosition = 225.47978241167658;
        label = "Ent DB Server";
        cpuCores = 64;
        memorySize = "512GB";
        operatingSystem = "Solaris 11";
        storageCapacity = "40TB";
        networkInterface = "Ethernet";
        powerConsumption = 400;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-05";
        maintenanceInterval = "3 months";
    }
    part instance 1189: Device {
        assetIdentifier = "UPS003";
        manufacturer = "Vertiv";
        modelNumber = "Liebert GXT5-10KRT230";
        assetName = "High-Capacity UPS System";
        serialNumber = "VTV-GXT5-2023-001";
        comments = "UPS system for entire server room protection";
        assetCostAmount = 15000.0;
        netBookValueAmount = "13500.0";
        ownership = "US Navy";
        inventoryDate = "2023-09-20";
        datePlacedInService = "2023-10-01";
        usefulLifePeriods = "5 years";
        assetType = "Power";
        locationID = "ENG-RM-08";
        buildingNumber = "4";
        buildingName = "Engineering Room";
        xPosition = -625.6698295833902;
        yPosition = 6.970794907144384;
        label = "UPS 03";
        capacity = "10000VA";
        backupTime = "60 minutes";
        inputVoltage = "230V";
        outputVoltage = "230V";
        networkInterface = "SNMP";
        powerConsumption = 70;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-10";
        maintenanceInterval = "6 months";
    }
    part instance 1190: Device {
        assetIdentifier = "ACL003";
        manufacturer = "Honeywell Building Technologies";
        modelNumber = "WEBs-AX JACE 8000";
        assetName = "Advanced Building Control System";
        serialNumber = "HBT-JACE8000-2023-001";
        comments = "Control system for energy management and building automation";
        assetCostAmount = 20000.0;
        netBookValueAmount = "18000.0";
        ownership = "US Navy";
        inventoryDate = "2023-09-25";
        datePlacedInService = "2023-10-01";
        usefulLifePeriods = "10 years";
        assetType = "Automation";
        locationID = "UTIL-RM-04";
        buildingNumber = "6";
        buildingName = "Utilities Room";
        xPosition = -753.2710727553247;
        yPosition = -411.63553637766233;
        label = "Bldg Control";
        controlPoints = 300;
        networkProtocol = "BACnet/IP";
        softwareVersion = "Niagara 4.7";
        networkInterface = "Ethernet";
        powerConsumption = 35;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-15";
        maintenanceInterval = "12 months";
    }
    part instance 1191: Device {
        assetIdentifier = "FCS003";
        manufacturer = "Siemens Building Technologies";
        modelNumber = "Cerberus PRO FC724";
        assetName = "Intelligent Fire Detection System";
        serialNumber = "SIBT-FC724-2023-001";
        comments = "Fire detection and alarm system with advanced sensors";
        assetCostAmount = 25000.0;
        netBookValueAmount = "22500.0";
        ownership = "US Navy";
        inventoryDate = "2023-09-30";
        datePlacedInService = "2023-10-01";
        usefulLifePeriods = "15 years";
        assetType = "Safety";
        locationID = "SEC-RM-03";
        buildingNumber = "5";
        buildingName = "Security Room";
        xPosition = -806.7514837747644;
        yPosition = -210.9347632655385;
        label = "Fire Detect";
        zoneCount = 200;
        deviceCapacity = 1000;
        softwareVersion = "Cerberus 4.0";
        networkInterface = "Ethernet";
        powerConsumption = 50;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-20";
        maintenanceInterval = "6 months";
    }
    part instance 1192: Device {
        assetIdentifier = "CAM003";
        manufacturer = "Hanwha Techwin";
        modelNumber = "XNV-9082R";
        assetName = "IR Bullet Camera";
        serialNumber = "HWA-XNV9082-2023-001";
        comments = "Outdoor bullet camera with infrared night vision";
        assetCostAmount = 1200.0;
        netBookValueAmount = "1080.0";
        ownership = "US Navy";
        inventoryDate = "2023-10-05";
        datePlacedInService = "2023-10-15";
        usefulLifePeriods = "5 years";
        assetType = "Security";
        locationID = "DECK-09-FWD";
        xPosition = 142.0;
        yPosition = -776.0;
        label = "Camera 03";
        ipRating = "IP67";
        frameRate = "30fps";
        resolution = "4K UHD";
        nightVision = "Enhanced IR";
        networkInterface = "Ethernet";
        powerConsumption = 12;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-01";
        maintenanceInterval = "12 months";
    }
    part instance 1193: Device {
        assetIdentifier = "ACS003";
        manufacturer = "ASSA ABLOY";
        modelNumber = "Aperio E100";
        assetName = "Wireless Door Handle";
        serialNumber = "ASA-APE100-2023-001";
        comments = "Wireless door handle for controlled access";
        assetCostAmount = 600.0;
        netBookValueAmount = "540.0";
        ownership = "US Navy";
        inventoryDate = "2023-10-10";
        datePlacedInService = "2023-10-15";
        usefulLifePeriods = "7 years";
        assetType = "Security";
        locationID = "SEC-AREA-03";
        xPosition = 1274.0;
        yPosition = -630.0;
        label = "Handle 01";
        ipRating = "IP40";
        cardTypes = "iCLASS, Mifare";
        powerConsumption = 2;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-05";
        maintenanceInterval = "12 months";
        communicationProtocol = "Zigbee";
    }
    part instance 1194: Device {
        assetIdentifier = "ENG003";
        manufacturer = "MTU Friedrichshafen";
        modelNumber = "20V 4000 M73L";
        assetName = "High-Speed Diesel Engine";
        serialNumber = "MTU-20V4000-2023-001";
        comments = "High-speed diesel engine for propulsion";
        assetCostAmount = 1200000.0;
        netBookValueAmount = "1080000.0";
        ownership = "US Navy";
        inventoryDate = "2023-10-20";
        datePlacedInService = "2023-11-01";
        usefulLifePeriods = "25 years";
        assetType = "Power Generation";
        locationID = "ENG-RM-10";
        xPosition = 840.0;
        yPosition = -602.0;
        label = "Engine 01";
        fuelType = "Diesel";
        powerOutput = "3600kW";
        operatingHours = 2000;
        networkInterface = "None";
        powerConsumption = "0.0; // Engine generates power";
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-15";
        maintenanceInterval = "12 months";
    }
    part instance 1195: Device {
        assetIdentifier = "WAT003";
        manufacturer = "Evoqua Water Technologies";
        modelNumber = "ORC-1500";
        assetName = "Oily Water Separator";
        serialNumber = "EVO-ORC1500-2023-001";
        comments = "System to separate oil from bilge water";
        assetCostAmount = 200000.0;
        netBookValueAmount = "180000.0";
        ownership = "US Navy";
        inventoryDate = "2023-10-25";
        datePlacedInService = "2023-11-01";
        usefulLifePeriods = "20 years";
        assetType = "Utilities";
        locationID = "UTIL-RM-05";
        xPosition = 511.55753965985735;
        yPosition = 182.88228651442046;
        label = "Oil Separator";
        waterQuality = "IMO Standard";
        operatingHours = 3000;
        networkInterface = "None";
        powerConsumption = 180;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        productionCapacity = "15 m³/h";
        lastMaintenanceDate = "2023-11-20";
        maintenanceInterval = "12 months";
    }
    part instance 1196: Device {
        assetIdentifier = "PMP003";
        manufacturer = "ITT Goulds Pumps";
        modelNumber = "3196 i-FRAME";
        assetName = "Fire Pump";
        serialNumber = "ITT-3196-2023-001";
        comments = "Centrifugal pump dedicated for fire suppression";
        assetCostAmount = 5000.0;
        netBookValueAmount = "4500.0";
        ownership = "US Navy";
        inventoryDate = "2023-10-30";
        datePlacedInService = "2023-11-01";
        usefulLifePeriods = "15 years";
        assetType = "Utilities";
        locationID = "ENG-RM-11";
        xPosition = 413.09027776190015;
        yPosition = -213.61025588059954;
        head = "60m";
        label = "Fire Pump";
        flowRate = "100 m³/h";
        networkInterface = "None";
        powerConsumption = 40;
        operationalStatus = "STANDBY";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-25";
        maintenanceInterval = "6 months";
    }
    part instance 1197: Device {
        assetIdentifier = "CMS005";
        manufacturer = "Kongsberg Maritime";
        modelNumber = "K-Bridge Integrated System";
        assetName = "Integrated Navigation and Automation System";
        serialNumber = "KM-KBRIDGE-2023-001";
        comments = "Combines bridge control, automation, and navigation";
        assetCostAmount = 800000.0;
        netBookValueAmount = "720000.0";
        ownership = "US Navy";
        inventoryDate = "2023-11-10";
        datePlacedInService = "2023-12-01";
        usefulLifePeriods = "10 years";
        assetType = "Command and Control";
        locationID = "BRIDGE-UPPER";
        buildingNumber = "2";
        buildingName = "Upper Bridge";
        xPosition = 240.77876982992868;
        yPosition = -362.02551996668683;
        label = "K-Bridge System";
        aiCapabilities = "Advanced Automation";
        processingCores = 16;
        redundancyLevel = "Triple";
        softwareVersion = "K-Bridge 4.0";
        networkInterface = "NMEA 2000";
        powerConsumption = 25;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-15";
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

    part instance 1189 -> 1188::DeviceConnection {
        connectionType = "power";
        source = Devices::1189;
        target = Devices::1188;
        current = "20A";
        voltage = "230V";
        priority = "Critical";
        protocol = "AC Power";
        redundancy = "None";
        connectionDetails = "Power supply to database server";
    }
    part instance 1164 -> 1190::DeviceConnection {
        connectionType = "network";
        source = Devices::1164;
        target = Devices::1190;
        latency = "<5ms";
        priority = "Normal";
        protocol = "BACnet/IP";
        bandwidth = "1 Gbps";
        redundancy = "Single-path";
        connectionDetails = "Building automation network";
    }
    part instance 1191 -> 1164::DeviceConnection {
        connectionType = "network";
        source = Devices::1191;
        target = Devices::1164;
        latency = "<2ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "1 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Fire alarm system network connection";
    }
    part instance 1164 -> 1192::DeviceConnection {
        connectionType = "network";
        source = Devices::1164;
        target = Devices::1192;
        latency = "<10ms";
        priority = "Normal";
        protocol = "RTSP";
        bandwidth = "15 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Security camera video feed";
    }
    part instance 1164 -> 1193::DeviceConnection {
        connectionType = "network";
        source = Devices::1164;
        target = Devices::1193;
        latency = "<1ms";
        priority = "High";
        protocol = "Zigbee";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Access control system data";
    }
    part instance 1195 -> 1190::DeviceConnection {
        connectionType = "data";
        source = Devices::1195;
        target = Devices::1190;
        latency = "N/A";
        priority = "Low";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Water level monitoring (manual)";
    }
    part instance 1196 -> 1194::DeviceConnection {
        connectionType = "data";
        source = Devices::1196;
        target = Devices::1194;
        latency = "N/A";
        priority = "Normal";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Engine cooling data (manual)";
    }
    part instance 1197 -> 1156::DeviceConnection {
        connectionType = "command";
        source = Devices::1197;
        target = Devices::1156;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Quadruple redundant";
        responseTime = "<5ms";
        authentication = "PKI-based";
        connectionDetails = "Upgraded weapon control interface";
    }
    part instance 1154 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1154;
        target = Devices::1155;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "High-speed sensor data feed";
    }
    part instance 1157 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1157;
        target = Devices::1155;
        bandwidth = "100 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.999%";
        errorCorrection = "Forward EC";
        connectionDetails = "External communication link";
    }
    part instance 1158 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1158;
        target = Devices::1155;
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        bufferSize = "1TB";
        dataFormat = "Raw + Processed";
        compression = "Lossy";
        connectionDetails = "Underwater sensor data";
    }
    part instance 1154 -> 1158::DeviceConnection {
        connectionType = "sync";
        source = Devices::1154;
        target = Devices::1158;
        jitter = "<1μs";
        accuracy = "±100ns";
        protocol = "MIL-STD-1397";
        syncRate = "1kHz";
        timeSource = "GPS";
        fallbackMode = "Internal";
        connectionDetails = "Sensor synchronization";
    }
    part instance 1159 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1159;
        target = Devices::1155;
        latency = "<1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Electronic warfare data feed";
    }
    part instance 1159 -> 1154::DeviceConnection {
        connectionType = "sync";
        source = Devices::1159;
        target = Devices::1154;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "1kHz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "Radar-EW coordination";
    }
    part instance 1160 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1160;
        target = Devices::1155;
        qos = "Normal";
        latency = "<50ms";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        redundancy = "Single-path";
        connectionDetails = "Backup sensor data feed";
    }
    part instance 1161 -> 1156::DeviceConnection {
        connectionType = "command";
        source = Devices::1161;
        target = Devices::1156;
        priority = "High";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Double redundant";
        responseTime = "<10ms";
        authentication = "PKI-based";
        connectionDetails = "Backup weapon control interface";
    }
    part instance 1166 -> 1164::DeviceConnection {
        connectionType = "network";
        source = Devices::1166;
        target = Devices::1164;
        latency = "<2ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "1 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Fire alarm system network connection";
    }
    part instance 1164 -> 1167::DeviceConnection {
        connectionType = "network";
        source = Devices::1164;
        target = Devices::1167;
        latency = "<10ms";
        priority = "Normal";
        protocol = "RTSP";
        bandwidth = "10 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Security camera video feed";
    }
    part instance 1164 -> 1168::DeviceConnection {
        connectionType = "network";
        source = Devices::1164;
        target = Devices::1168;
        latency = "<1ms";
        priority = "High";
        protocol = "Wiegand";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Access control system data";
    }
    part instance 1164 -> 1169::DeviceConnection {
        connectionType = "network";
        source = Devices::1164;
        target = Devices::1169;
        latency = "<2ms";
        priority = "High";
        protocol = "PROFINET";
        bandwidth = "100 Mbps";
        redundancy = "Dual-path";
        connectionDetails = "PLC control network";
    }
    part instance 1170 -> 1169::DeviceConnection {
        connectionType = "data";
        source = Devices::1170;
        target = Devices::1169;
        latency = "<5ms";
        priority = "Normal";
        protocol = "Modbus";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Generator control data";
    }
    part instance 1171 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1171;
        target = Devices::1155;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "3D Radar data feed";
    }
    part instance 1173 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1173;
        target = Devices::1155;
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.99%";
        errorCorrection = "Forward EC";
        connectionDetails = "HF external communication link";
    }
    part instance 1174 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1174;
        target = Devices::1155;
        format = "NMEA 2000";
        protocol = "MIL-STD-1397";
        precision = "High";
        updateRate = "10Hz";
        validation = "Checksum";
        reliability = "99.99%";
        connectionDetails = "Navigation data feed";
    }
    part instance 1164 -> 1175::DeviceConnection {
        connectionType = "network";
        source = Devices::1164;
        target = Devices::1175;
        latency = "<1ms";
        priority = "Normal";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Distribution switch connection";
    }
    part instance 1175 -> 1176::DeviceConnection {
        connectionType = "network";
        source = Devices::1175;
        target = Devices::1176;
        latency = "<1ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Database server network connection";
    }
    part instance 1177 -> 1164::DeviceConnection {
        connectionType = "network";
        source = Devices::1177;
        target = Devices::1164;
        latency = "<2ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "1 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Fire alarm system network connection";
    }
    part instance 1164 -> 1178::DeviceConnection {
        connectionType = "network";
        source = Devices::1164;
        target = Devices::1178;
        latency = "<2ms";
        priority = "High";
        protocol = "Ethernet/IP";
        bandwidth = "100 Mbps";
        redundancy = "Dual-path";
        connectionDetails = "PLC control network";
    }
    part instance 1179 -> 1178::DeviceConnection {
        connectionType = "data";
        source = Devices::1179;
        target = Devices::1178;
        latency = "<5ms";
        priority = "Normal";
        protocol = "Modbus";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Generator control data";
    }
    part instance 1181 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1181;
        target = Devices::1155;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "3D Radar data feed";
    }
    part instance 1182 -> 1156::DeviceConnection {
        connectionType = "command";
        source = Devices::1182;
        target = Devices::1156;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Quadruple redundant";
        responseTime = "<5ms";
        authentication = "PKI-based";
        connectionDetails = "Upgraded weapon control interface";
    }
    part instance 1184 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1184;
        target = Devices::1155;
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.99%";
        errorCorrection = "Forward EC";
        connectionDetails = "HF external communication link";
    }
    part instance 1185 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1185;
        target = Devices::1155;
        format = "NMEA 2000";
        protocol = "MIL-STD-1397";
        precision = "High";
        updateRate = "10Hz";
        validation = "Checksum";
        reliability = "99.99%";
        connectionDetails = "Navigation data feed";
    }
    part instance 1186 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1186;
        target = Devices::1155;
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        bufferSize = "1TB";
        dataFormat = "Raw + Processed";
        compression = "Lossy";
        connectionDetails = "Underwater sensor data";
    }
    part instance 1181 -> 1186::DeviceConnection {
        connectionType = "sync";
        source = Devices::1181;
        target = Devices::1186;
        jitter = "<1μs";
        accuracy = "±100ns";
        protocol = "MIL-STD-1397";
        syncRate = "1kHz";
        timeSource = "GPS";
        fallbackMode = "Internal";
        connectionDetails = "Sensor synchronization";
    }
    part instance 1187 -> 1155::DeviceConnection {
        connectionType = "data";
        source = Devices::1187;
        target = Devices::1155;
        latency = "<1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Electronic warfare data feed";
    }
    part instance 1187 -> 1181::DeviceConnection {
        connectionType = "sync";
        source = Devices::1187;
        target = Devices::1181;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "1kHz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "Radar-EW coordination";
    }
    part instance 1155 -> 1156::DeviceConnection {
        connectionType = "command";
        source = Devices::1155;
        target = Devices::1156;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Triple redundant";
        responseTime = "<5ms";
        authentication = "PKI-based";
        connectionDetails = "Weapon control interface";
    }
}