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

    part instance 2188: Device {
        assetIdentifier = "PMP001";
        manufacturer = "Grundfos";
        modelNumber = "CR 90-5-2";
        assetName = "Cooling Water Pump";
        serialNumber = "GF-CR90-2023-001";
        comments = "Cooling water pump for machinery cooling";
        assetCostAmount = 5000.0;
        netBookValueAmount = "4500.0";
        ownership = "US Navy";
        inventoryDate = "2023-04-30";
        datePlacedInService = "2023-05-01";
        usefulLifePeriods = "15 years";
        assetType = "Utilities";
        locationID = "ENG-RM-04";
        xPosition = 2618.104431391834;
        yPosition = 1731.700432918631;
        head = "50m";
        label = "Cooling Pump";
        flowRate = "90 m³/h";
        networkInterface = "None";
        powerConsumption = 45;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-25";
        maintenanceInterval = "6 months";
    }
    part instance 2125: Device {
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
    part instance 2126: Device {
        assetIdentifier = "SON003";
        manufacturer = "Kongsberg Maritime";
        modelNumber = "EM 710";
        assetName = "Multibeam Echosounder";
        serialNumber = "KM-EM710-2023-001";
        comments = "High resolution multibeam echosounder";
        assetCostAmount = 2500000.0;
        netBookValueAmount = "2250000.0";
        ownership = "US Navy";
        inventoryDate = "2023-05-30";
        datePlacedInService = "2023-06-01";
        assetType = "Sensor";
        locationID = "HULL-AFT-02";
        xPosition = -620.3392596600567;
        yPosition = 1394.4101052842448;
        label = "EM 710 Sonar";
        beamCount = 512;
        depthRating = "1000m";
        frequencyRange = "70-100kHz";
        softwareVersion = "EM710.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 95;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-10-05";
        maintenanceInterval = "4 months";
    }
    part instance 2127: Device {
        assetIdentifier = "EW003";
        manufacturer = "BAE Systems";
        modelNumber = "AN/ALE-55";
        assetName = "Towed Decoy System";
        serialNumber = "BAE-ALE55-2023-001";
        comments = "Towed decoy system for electronic warfare";
        assetCostAmount = 1500000.0;
        netBookValueAmount = "1350000.0";
        ownership = "US Navy";
        inventoryDate = "2023-06-05";
        datePlacedInService = "2023-06-15";
        assetType = "Electronic Warfare";
        locationID = "DECK-06-AFT";
        xPosition = -694.0238297326379;
        yPosition = 106.13472762526294;
        label = "ALE-55 Decoy";
        jammerPower = "1800W";
        responseTime = "60ns";
        softwareVersion = "ALE55.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 65;
        frequencyCoverage = "0.5-25GHz";
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-09-10";
        maintenanceInterval = "3 months";
    }
    part instance 2128: Device {
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
        xPosition = 928.6864160210638;
        yPosition = 1037.494488142954;
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
    part instance 2129: Device {
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
        xPosition = 904.5779694325613;
        yPosition = 755.5218423122207;
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
    part instance 2130: Device {
        assetIdentifier = "UPS002";
        manufacturer = "Eaton";
        modelNumber = "9PX 5000i RT3U";
        assetName = "Backup Power Supply";
        serialNumber = "EATON-9PX5000-2023-001";
        comments = "UPS for critical systems";
        assetCostAmount = 12000.0;
        netBookValueAmount = "10800.0";
        ownership = "US Navy";
        inventoryDate = "2023-06-20";
        datePlacedInService = "2023-07-01";
        usefulLifePeriods = "5 years";
        assetType = "Power";
        locationID = "ENG-RM-05";
        buildingNumber = "4";
        buildingName = "Engineering Room";
        xPosition = 1080.565815364965;
        yPosition = 659.3054599883656;
        label = "UPS 02";
        capacity = "5000VA";
        backupTime = "45 minutes";
        inputVoltage = "230V";
        outputVoltage = "230V";
        networkInterface = "Ethernet";
        powerConsumption = 60;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-10";
        maintenanceInterval = "6 months";
    }
    part instance 2131: Device {
        assetIdentifier = "ACL002";
        manufacturer = "Schneider Electric";
        modelNumber = "EcoStruxure AS-P";
        assetName = "Building Automation System";
        serialNumber = "SNE-ECO-ASP-2023-001";
        comments = "Automation system for building management";
        assetCostAmount = 18000.0;
        netBookValueAmount = "16200.0";
        ownership = "US Navy";
        inventoryDate = "2023-06-25";
        datePlacedInService = "2023-07-01";
        usefulLifePeriods = "10 years";
        assetType = "Automation";
        locationID = "UTIL-RM-02";
        buildingNumber = "6";
        buildingName = "Utilities Room";
        xPosition = 1074.270320465796;
        yPosition = 1116.6055896152864;
        label = "Bldg Automation";
        controlPoints = 250;
        networkProtocol = "Modbus TCP";
        softwareVersion = "EcoStruxure 3.0";
        networkInterface = "Ethernet";
        powerConsumption = 30;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-15";
        maintenanceInterval = "12 months";
    }
    part instance 2132: Device {
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
        xPosition = 1673.7946082015876;
        yPosition = 1515.469133589541;
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
    part instance 2133: Device {
        assetIdentifier = "QNT001";
        manufacturer = "ID Quantique";
        modelNumber = "Cerberus QKD";
        assetName = "Quantum Key Distribution System";
        serialNumber = "IDQ-CQKD-2023-001";
        comments = "Quantum cryptography system for secure communications";
        assetCostAmount = 1500000.0;
        netBookValueAmount = "1425000.0";
        ownership = "US Navy";
        inventoryDate = "2023-12-05";
        datePlacedInService = "2023-12-20";
        usefulLifePeriods = "10 years";
        assetType = "Cryptography";
        locationID = "CRYPTO-RM-01";
        buildingNumber = "3";
        buildingName = "Secure Communications Room";
        xPosition = 694.6448816505895;
        yPosition = -1227.2603738329694;
        label = "QKD System";
        keyRate = "100 kbps";
        quantumBitRate = "1 Mbps";
        softwareVersion = "Cerberus 1.5";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 150;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-12-05";
        maintenanceInterval = "6 months";
    }
    part instance 2134: Device {
        assetIdentifier = "CAM002";
        manufacturer = "Bosch Security Systems";
        modelNumber = "MIC IP starlight 7000i";
        assetName = "PTZ Security Camera";
        serialNumber = "BOSCH-MIC7000-2023-001";
        comments = "Pan-Tilt-Zoom security camera for perimeter security";
        assetCostAmount = 3000.0;
        netBookValueAmount = "2700.0";
        ownership = "US Navy";
        inventoryDate = "2023-07-05";
        datePlacedInService = "2023-07-15";
        usefulLifePeriods = "5 years";
        assetType = "Security";
        locationID = "DECK-07-AFT";
        xPosition = 1335.205049350974;
        yPosition = 2179.280427000752;
        label = "Camera 02";
        ipRating = "IP68";
        frameRate = "60fps";
        resolution = "4K UHD";
        nightVision = "Enhanced";
        networkInterface = "Ethernet";
        powerConsumption = 15;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-01";
        maintenanceInterval = "12 months";
    }
    part instance 2135: Device {
        assetIdentifier = "ACS002";
        manufacturer = "Allegion";
        modelNumber = "Schlage AD-400";
        assetName = "Wireless Access Control Lock";
        serialNumber = "ALG-AD400-2023-001";
        comments = "Wireless access control lock for sensitive rooms";
        assetCostAmount = 750.0;
        netBookValueAmount = "675.0";
        ownership = "US Navy";
        inventoryDate = "2023-07-10";
        datePlacedInService = "2023-07-15";
        usefulLifePeriods = "7 years";
        assetType = "Security";
        locationID = "SEC-AREA-02";
        xPosition = 2037.7856496156514;
        yPosition = 2239.6700941710214;
        label = "Lock 01";
        ipRating = "IP54";
        cardTypes = "MiFare, DESFire";
        powerConsumption = 3;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-05";
        maintenanceInterval = "12 months";
        communicationProtocol = "Zigbee";
    }
    part instance 2136: Device {
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
        xPosition = 2177.292507560034;
        yPosition = 1972.9639511031987;
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
    part instance 2137: Device {
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
        xPosition = 1963.8034573328566;
        yPosition = 1714.4386003968866;
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
    part instance 2138: Device {
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
        xPosition = 1072.1939721743076;
        yPosition = 1037.4317139924274;
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
    part instance 2139: Device {
        assetIdentifier = "PMP002";
        manufacturer = "Xylem";
        modelNumber = "Lowara e-MP";
        assetName = "Bilge Pump";
        serialNumber = "XYLEM-LMP-2023-001";
        comments = "Bilge pump for removing water from the hull";
        assetCostAmount = 4000.0;
        netBookValueAmount = "3600.0";
        ownership = "US Navy";
        inventoryDate = "2023-07-30";
        datePlacedInService = "2023-08-01";
        usefulLifePeriods = "15 years";
        assetType = "Utilities";
        locationID = "HULL-RM-01";
        xPosition = 1960.1763100878231;
        yPosition = 1623.565826820349;
        head = "30m";
        label = "Bilge Pump";
        flowRate = "50 m³/h";
        networkInterface = "None";
        powerConsumption = 30;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-25";
        maintenanceInterval = "6 months";
    }
    part instance 2140: Device {
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
        xPosition = -627.8654784812065;
        yPosition = -66.32851618311399;
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
    part instance 2141: Device {
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
        xPosition = 2646.342808375215;
        yPosition = 552.552017577831;
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
    part instance 2142: Device {
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
        xPosition = -1325.060117304913;
        yPosition = -213.9457704267315;
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
    part instance 2143: Device {
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
        xPosition = 63.04073264279921;
        yPosition = 693.3787566443543;
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
    part instance 2144: Device {
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
        xPosition = 475.3977737454858;
        yPosition = 1229.640462238565;
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
    part instance 2145: Device {
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
        xPosition = -327.81942867711336;
        yPosition = 415.9295411870448;
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
    part instance 2146: Device {
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
        xPosition = -558.5788305068315;
        yPosition = 511.7190500251017;
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
    part instance 2147: Device {
        assetIdentifier = "DCN003";
        manufacturer = "Arista Networks";
        modelNumber = "7050SX3-48YC8";
        assetName = "High-Performance Data Switch";
        serialNumber = "ARS-7050-2023-001";
        comments = "High-performance switch for data center operations";
        assetCostAmount = 60000.0;
        netBookValueAmount = "54000.0";
        ownership = "US Navy";
        inventoryDate = "2023-09-10";
        datePlacedInService = "2023-10-01";
        usefulLifePeriods = "7 years";
        assetType = "Networking";
        locationID = "NET-RM-02";
        buildingNumber = "3";
        buildingName = "Network Room";
        xPosition = 1592.6576973685865;
        yPosition = 455.94611155521187;
        label = "Data Switch";
        portCount = 48;
        uplinkSpeed = "100Gbps";
        softwareVersion = "EOS 4.22";
        networkInterface = "Ethernet";
        powerConsumption = 130;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-01";
        maintenanceInterval = "6 months";
    }
    part instance 2148: Device {
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
    part instance 2149: Device {
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
        xPosition = 2261.2852093680076;
        yPosition = 99.4484463303586;
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
    part instance 2150: Device {
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
        xPosition = 1016.9998728376279;
        yPosition = 2197.2238328668072;
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
    part instance 2151: Device {
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
        xPosition = 1408.4538401138404;
        yPosition = 1434.3672458406934;
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
    part instance 2152: Device {
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
        xPosition = 1334.8516632643823;
        yPosition = 2241.101119579773;
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
    part instance 2153: Device {
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
        xPosition = 1759.8421367860656;
        yPosition = 2253.301782252819;
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
    part instance 2154: Device {
        assetIdentifier = "PLC003";
        manufacturer = "Beckhoff Automation";
        modelNumber = "CX5140";
        assetName = "Embedded PC Controller";
        serialNumber = "BCK-CX5140-2023-001";
        comments = "Embedded PC controller for automated systems";
        assetCostAmount = 28000.0;
        netBookValueAmount = "25200.0";
        ownership = "US Navy";
        inventoryDate = "2023-10-15";
        datePlacedInService = "2023-10-15";
        usefulLifePeriods = "10 years";
        assetType = "Automation";
        locationID = "ENG-RM-09";
        xPosition = 2973.052179960987;
        yPosition = 2019.2023353712002;
        label = "PLC 03";
        memorySize = "2GB";
        networkInterface = "EtherCAT";
        powerConsumption = 32;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-10";
        maintenanceInterval = "6 months";
        programmingLanguage = "IEC 61131-3";
    }
    part instance 2155: Device {
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
        xPosition = 2941.265333231954;
        yPosition = 1901.37089479795;
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
    part instance 2156: Device {
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
        xPosition = 975.2393773229313;
        yPosition = 2015.4819067327778;
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
    part instance 2157: Device {
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
        xPosition = 3028.278066574313;
        yPosition = 1733.7722890123753;
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
    part instance 2158: Device {
        assetIdentifier = "RAD005";
        manufacturer = "Furuno Electric Co.";
        modelNumber = "FAR-3000 Series";
        assetName = "X-Band Radar System";
        serialNumber = "FUR-FAR3000-2023-001";
        comments = "High-resolution X-band radar for navigation";
        assetCostAmount = 200000.0;
        netBookValueAmount = "180000.0";
        ownership = "US Navy";
        inventoryDate = "2023-11-05";
        datePlacedInService = "2023-11-15";
        usefulLifePeriods = "15 years";
        assetType = "Sensor";
        locationID = "BRIDGE-WING";
        buildingNumber = "1";
        buildingName = "Bridge Wing";
        xPosition = 474.89650405210017;
        yPosition = 1177.755232857865;
        label = "X-Band Radar";
        detectionRange = "80nm";
        softwareVersion = "FAR3000 2.0";
        networkInterface = "Ethernet";
        powerConsumption = 55;
        trackingCapacity = 60;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        weatherResistance = "Severe";
        lastMaintenanceDate = "2023-10-01";
        maintenanceInterval = "6 months";
    }
    part instance 2159: Device {
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
        xPosition = 2050.5826927437074;
        yPosition = 465.2136887711445;
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
    part instance 2160: Device {
        assetIdentifier = "WPN005";
        manufacturer = "Raytheon Missile Systems";
        modelNumber = "Standard Missile-6 (SM-6)";
        assetName = "Extended Range Air Defense Missile";
        serialNumber = "RAY-SM6-2023-001";
        comments = "Air defense missile for extended range intercepts";
        assetCostAmount = 2500000.0;
        netBookValueAmount = "2250000.0";
        ownership = "US Navy";
        inventoryDate = "2023-11-15";
        datePlacedInService = "2023-12-01";
        usefulLifePeriods = "20 years";
        assetType = "Weapon System";
        locationID = "VLS-AFT";
        xPosition = -1325.3483644114656;
        yPosition = -474.1783549683734;
        label = "SM-6 Missile";
        launchCells = 1;
        coolingSystems = "Air Cooled";
        missileCapacity = 1;
        networkInterface = "MIL-STD-1397";
        powerConsumption = 120;
        operationalStatus = "READY";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-09-01";
        maintenanceInterval = "12 months";
    }
    part instance 2161: Device {
        assetIdentifier = "COM005";
        manufacturer = "ViaSat";
        modelNumber = "Global Xpress Terminal";
        assetName = "Global Satellite Internet Terminal";
        serialNumber = "VSA-GXTERM-2023-001";
        comments = "Provides high-speed global internet connectivity";
        assetCostAmount = 500000.0;
        netBookValueAmount = "450000.0";
        ownership = "US Navy";
        inventoryDate = "2023-11-20";
        datePlacedInService = "2023-12-01";
        assetType = "Communication";
        locationID = "RADIO-RM-04";
        xPosition = 453.0060511261464;
        yPosition = 284.2612542823265;
        label = "Global Internet";
        dataRate = "50Mbps";
        frequencyBands = "Ka-band";
        encryptionLevel = "AES-256";
        softwareVersion = "GXT 1.0";
        networkInterface = "Ethernet";
        powerConsumption = 35;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-09-15";
        maintenanceInterval = "4 months";
    }
    part instance 2162: Device {
        assetIdentifier = "ENV001";
        manufacturer = "Vaisala";
        modelNumber = "WXT536";
        assetName = "Weather Station";
        serialNumber = "VAI-WXT536-2023-001";
        comments = "Multi-parameter weather station for maritime environment";
        assetCostAmount = 8000.0;
        netBookValueAmount = "7200.0";
        ownership = "US Navy";
        inventoryDate = "2023-11-25";
        datePlacedInService = "2023-12-01";
        usefulLifePeriods = "8 years";
        assetType = "Sensor";
        locationID = "MAST-TOP";
        buildingNumber = "1";
        buildingName = "Main Mast";
        xPosition = 145.97244070668896;
        yPosition = 54.7560498020397;
        label = "Weather Station";
        parameters = "Wind,Temp,Humidity,Pressure,Rain,Hail";
        updateRate = "1Hz";
        softwareVersion = "WXT536 2.1";
        networkInterface = "Ethernet";
        powerConsumption = 5;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-11-01";
        maintenanceInterval = "12 months";
    }
    part instance 2163: Device {
        assetIdentifier = "DRN001";
        manufacturer = "Northrop Grumman";
        modelNumber = "MQ-8C Fire Scout";
        assetName = "Autonomous Helicopter Drone";
        serialNumber = "NG-MQ8C-2023-001";
        comments = "Unmanned aerial vehicle for reconnaissance and targeting";
        assetCostAmount = 15000000.0;
        netBookValueAmount = "14250000.0";
        ownership = "US Navy";
        inventoryDate = "2023-11-30";
        datePlacedInService = "2023-12-15";
        usefulLifePeriods = "15 years";
        assetType = "UAV";
        locationID = "HELI-DECK-01";
        xPosition = -1326.3377717097978;
        yPosition = -318.0365216162451;
        label = "Fire Scout UAV";
        maxAltitude = "20000 ft";
        flightEndurance = "12 hours";
        softwareVersion = "MQ8C 3.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 0;
        operationalStatus = "STANDBY";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-12-01";
        maintenanceInterval = "3 months";
    }
    part instance 2164: Device {
        assetIdentifier = "CYB001";
        manufacturer = "Palantir";
        modelNumber = "Gotham Maritime";
        assetName = "Cybersecurity Defense System";
        serialNumber = "PAL-GOTHM-2023-001";
        comments = "AI-powered cybersecurity system for maritime defense";
        assetCostAmount = 2000000.0;
        netBookValueAmount = "1900000.0";
        ownership = "US Navy";
        inventoryDate = "2023-12-01";
        datePlacedInService = "2023-12-15";
        usefulLifePeriods = "5 years";
        assetType = "Cybersecurity";
        locationID = "SERVER-RM-04";
        buildingNumber = "3";
        buildingName = "Secure Server Room";
        xPosition = 318.4114716569087;
        yPosition = -1284.3470579283035;
        label = "Cyber Defense";
        aiCapabilities = "Advanced Threat Detection";
        processingCores = 128;
        softwareVersion = "Gotham 2.1";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 200;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-12-01";
        maintenanceInterval = "1 month";
    }
    part instance 2165: Device {
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
        xPosition = 106.75175321597217;
        yPosition = -197.50496267383463;
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
    part instance 2166: Device {
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
    part instance 2167: Device {
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
        xPosition = 522.8096416352238;
        yPosition = 869.8940838124233;
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
    part instance 2168: Device {
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
        xPosition = 477.09353528050923;
        yPosition = 1278.7791068833171;
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
    part instance 2169: Device {
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
        xPosition = -236.05226684131532;
        yPosition = -524.1087154019738;
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
    part instance 2170: Device {
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
        xPosition = -772.7828288359951;
        yPosition = 589.0879032844455;
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
    part instance 2171: Device {
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
        xPosition = -116.12603316193332;
        yPosition = 1357.1326509533442;
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
    part instance 2172: Device {
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
        xPosition = 2240.451851765001;
        yPosition = 394.21778530169695;
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
    part instance 2173: Device {
        assetIdentifier = "WPN002";
        manufacturer = "Raytheon";
        modelNumber = "RIM-162 ESSM";
        assetName = "Evolved Sea Sparrow Missile";
        serialNumber = "RAY-RIM162-2023-001";
        comments = "Surface to air missile system";
        assetCostAmount = 1000000.0;
        netBookValueAmount = "900000.0";
        ownership = "US Navy";
        inventoryDate = "2023-02-20";
        datePlacedInService = "2023-03-20";
        usefulLifePeriods = "15 years";
        assetType = "Weapon System";
        locationID = "VLS-CELL-01";
        xPosition = -1325.935767400094;
        yPosition = -423.00721215971754;
        label = "RIM-162 ESSM";
        launchCells = 1;
        coolingSystems = "Air";
        missileCapacity = 1;
        networkInterface = "MIL-STD-1397";
        powerConsumption = 50;
        operationalStatus = "READY";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-08-20";
        maintenanceInterval = "12 months";
    }
    part instance 2174: Device {
        assetIdentifier = "COM002";
        manufacturer = "General Dynamics";
        modelNumber = "AN/USC-69";
        assetName = "HF Communication System";
        serialNumber = "GD-USC69-2023-001";
        comments = "Backup HF communication system";
        assetCostAmount = 500000.0;
        netBookValueAmount = "450000.0";
        ownership = "US Navy";
        inventoryDate = "2023-02-25";
        datePlacedInService = "2023-03-25";
        assetType = "Communication";
        locationID = "RADIO-RM-01";
        xPosition = -1326.080618728589;
        yPosition = -369.33116419741174;
        label = "HF Comms";
        dataRate = "10Mbps";
        frequencyBands = "HF";
        encryptionLevel = "AES-128";
        softwareVersion = "USC69.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 20;
        operationalStatus = "STANDBY";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-10-01";
        maintenanceInterval = "4 months";
    }
    part instance 2175: Device {
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
        xPosition = -1326.3045636180805;
        yPosition = -266.6732889043495;
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
    part instance 2176: Device {
        assetIdentifier = "SON002";
        manufacturer = "Atlas Elektronik";
        modelNumber = "DSQS-21BZ";
        assetName = "Hull Mounted Sonar";
        serialNumber = "AE-DSQS21-2023-001";
        comments = "Hull mounted sonar system";
        assetCostAmount = 1500000.0;
        netBookValueAmount = "1400000.0";
        ownership = "US Navy";
        inventoryDate = "2023-03-05";
        datePlacedInService = "2023-04-01";
        assetType = "Sensor";
        locationID = "HULL-FWD-01";
        xPosition = -1325.3331005404666;
        yPosition = -155.79300370752384;
        label = "DSQS-21 Sonar";
        beamCount = 128;
        depthRating = "300m";
        frequencyRange = "2-100kHz";
        softwareVersion = "DSQS21.1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 75;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-10-20";
        maintenanceInterval = "4 months";
    }
    part instance 2177: Device {
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
        xPosition = -1325.0656301587069;
        yPosition = -532.4126846878432;
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
    part instance 2178: Device {
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
        xPosition = 1450.7228305877316;
        yPosition = 1752.2519304141;
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
    part instance 2179: Device {
        assetIdentifier = "SRV001";
        manufacturer = "Dell";
        modelNumber = "PowerEdge R740xd";
        assetName = "Application Server";
        serialNumber = "DELL-R740XD-2023-001";
        comments = "Primary application server for shipboard applications";
        assetCostAmount = 75000.0;
        netBookValueAmount = "70000.0";
        ownership = "US Navy";
        inventoryDate = "2023-03-20";
        datePlacedInService = "2023-04-01";
        usefulLifePeriods = "5 years";
        assetType = "Server";
        locationID = "SERVER-RM-01";
        buildingNumber = "3";
        buildingName = "Server Room";
        xPosition = 2416.655002695672;
        yPosition = 2464.3701100933667;
        label = "App Server";
        cpuCores = 24;
        memorySize = "128GB";
        operatingSystem = "Red Hat Enterprise Linux 8";
        storageCapacity = "10TB";
        networkInterface = "Ethernet";
        powerConsumption = 300;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-15";
        maintenanceInterval = "3 months";
    }
    part instance 2180: Device {
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
        xPosition = 2416.7165322904093;
        yPosition = 2546.7648198808965;
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
    part instance 2181: Device {
        assetIdentifier = "ACL001";
        manufacturer = "Johnson Controls";
        modelNumber = "Metasys NAE55";
        assetName = "HVAC Controller";
        serialNumber = "JC-NAE55-2023-001";
        comments = "HVAC controller for the ship";
        assetCostAmount = 15000.0;
        netBookValueAmount = "13500.0";
        ownership = "US Navy";
        inventoryDate = "2023-03-30";
        datePlacedInService = "2023-04-01";
        usefulLifePeriods = "10 years";
        assetType = "Automation";
        locationID = "ENG-RM-01";
        buildingNumber = "4";
        buildingName = "Engineering Room";
        xPosition = 1617.9004823555224;
        yPosition = 2471.1101271302787;
        label = "HVAC Controller";
        controlPoints = 200;
        networkProtocol = "BACnet";
        softwareVersion = "Metasys 9.0";
        networkInterface = "Ethernet";
        powerConsumption = 25;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        lastMaintenanceDate = "2023-10-25";
        maintenanceInterval = "12 months";
    }
    part instance 2182: Device {
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
        xPosition = 1853.356554040819;
        yPosition = 1517.3870827016335;
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
    part instance 2183: Device {
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
        xPosition = 1337.0494640954958;
        yPosition = 2111.8802267177343;
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
    part instance 2184: Device {
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
        xPosition = 2210.074468956863;
        yPosition = 2143.7672180535546;
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
    part instance 2185: Device {
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
        xPosition = 2717.076754824866;
        yPosition = 1976.819612451621;
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
    part instance 2186: Device {
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
        xPosition = 2602.8476426546013;
        yPosition = 1857.2087705216534;
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
    part instance 2187: Device {
        assetIdentifier = "WAT001";
        manufacturer = "Alfa Laval";
        modelNumber = "AQ40";
        assetName = "Fresh Water Generator";
        serialNumber = "AL-AQ40-2023-001";
        comments = "Fresh water generator for shipboard water supply";
        assetCostAmount = 250000.0;
        netBookValueAmount = "225000.0";
        ownership = "US Navy";
        inventoryDate = "2023-04-25";
        datePlacedInService = "2023-05-01";
        usefulLifePeriods = "20 years";
        assetType = "Utilities";
        locationID = "UTIL-RM-01";
        xPosition = 1463.6630608533806;
        yPosition = 2348.7728690533822;
        label = "Water Generator";
        waterQuality = "Potable";
        operatingHours = 4000;
        networkInterface = "None";
        powerConsumption = 150;
        operationalStatus = "ACTIVE";
        securityClearance = "UNCLASSIFIED";
        productionCapacity = "40 m³/day";
        lastMaintenanceDate = "2023-11-20";
        maintenanceInterval = "12 months";
    }
    part instance 2189: Device {
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
        xPosition = -1016.3224121747662;
        yPosition = 361.41291201593003;
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
    part instance 2190: Device {
        assetIdentifier = "CMS003";
        manufacturer = "Lockheed Martin";
        modelNumber = "Aegis BMD 6.0";
        assetName = "Upgraded Combat Management System";
        serialNumber = "LM-AEGIS-2023-003";
        comments = "Upgraded version of the combat management system";
        assetCostAmount = 6000000.0;
        netBookValueAmount = "5500000.0";
        ownership = "US Navy";
        inventoryDate = "2023-05-10";
        datePlacedInService = "2023-06-01";
        usefulLifePeriods = "12 years";
        assetType = "Command and Control";
        locationID = "CIC-MAIN";
        buildingNumber = "2";
        buildingName = "Combat Information Center";
        xPosition = 2357.740246154208;
        yPosition = 551.5924446348777;
        label = "Aegis CMS 6.0";
        aiCapabilities = "Advanced+";
        processingCores = 128;
        redundancyLevel = "Quadruple";
        softwareVersion = "AEGIS-6.0.1";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 50;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-10-15";
        maintenanceInterval = "3 months";
    }
    part instance 2191: Device {
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
        xPosition = -175.2884495721939;
        yPosition = 1261.8107355392958;
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
    part instance 2192: Device {
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
        xPosition = 479.3739670250751;
        yPosition = 1327.8752785202803;
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
    part instance 2193: Device {
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
        xPosition = -120.85057341859356;
        yPosition = 1441.4090004375025;
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
    part instance 2194: Device {
        assetIdentifier = "ASW001";
        manufacturer = "Ultra Electronics";
        modelNumber = "NIXIE AN/SLQ-25";
        assetName = "Torpedo Decoy System";
        serialNumber = "ULT-NIXIE-2023-001";
        comments = "Advanced torpedo countermeasure system";
        assetCostAmount = 3500000.0;
        netBookValueAmount = "3325000.0";
        ownership = "US Navy";
        inventoryDate = "2023-12-10";
        datePlacedInService = "2023-12-25";
        usefulLifePeriods = "15 years";
        assetType = "Defense";
        locationID = "STERN-01";
        xPosition = -483.77631920942565;
        yPosition = 1292.3201111825276;
        label = "NIXIE System";
        operatingDepth = "100m";
        noiseGeneration = "Broadband";
        softwareVersion = "NIXIE 4.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 300;
        operationalStatus = "STANDBY";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-12-10";
        maintenanceInterval = "6 months";
    }
    part instance 2195: Device {
        assetIdentifier = "LAS001";
        manufacturer = "Northrop Grumman";
        modelNumber = "LaWS";
        assetName = "Laser Weapon System";
        serialNumber = "NG-LAWS-2023-001";
        comments = "High-energy laser weapon system for close-in defense";
        assetCostAmount = 25000000.0;
        netBookValueAmount = "23750000.0";
        ownership = "US Navy";
        inventoryDate = "2023-12-15";
        datePlacedInService = "2024-01-01";
        usefulLifePeriods = "20 years";
        assetType = "Weapon System";
        locationID = "DECK-10-FWD";
        xPosition = -337.7404771828483;
        yPosition = 1167.8273176016648;
        label = "LaWS";
        powerOutput = "150kW";
        softwareVersion = "LaWS 2.1";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 500;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        targetingAccuracy = "0.1mrad";
        lastMaintenanceDate = "2023-12-15";
        maintenanceInterval = "3 months";
    }
    part instance 2196: Device {
        assetIdentifier = "AUV001";
        manufacturer = "Boeing";
        modelNumber = "Echo Voyager";
        assetName = "Autonomous Underwater Vehicle";
        serialNumber = "BOE-EVOY-2023-001";
        comments = "Long-endurance autonomous underwater vehicle";
        assetCostAmount = 18000000.0;
        netBookValueAmount = "17100000.0";
        ownership = "US Navy";
        inventoryDate = "2023-12-20";
        datePlacedInService = "2024-01-05";
        usefulLifePeriods = "15 years";
        assetType = "Unmanned Vehicle";
        locationID = "HANGAR-02";
        xPosition = -167.20067091986454;
        yPosition = -904.1975519588512;
        label = "Echo Voyager";
        maxDepth = "3000m";
        endurance = "6 months";
        softwareVersion = "Voyager 3.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 0;
        operationalStatus = "STANDBY";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-12-20";
        maintenanceInterval = "6 months";
    }
    part instance 2197: Device {
        assetIdentifier = "SAT001";
        manufacturer = "L3Harris";
        modelNumber = "MPR-50";
        assetName = "Multi-band Satellite Terminal";
        serialNumber = "L3H-MPR50-2023-001";
        comments = "Advanced multi-band satellite communication terminal";
        assetCostAmount = 2500000.0;
        netBookValueAmount = "2375000.0";
        ownership = "US Navy";
        inventoryDate = "2023-12-25";
        datePlacedInService = "2024-01-10";
        usefulLifePeriods = "10 years";
        assetType = "Communication";
        locationID = "MAST-06";
        xPosition = 338.1141627382189;
        yPosition = 624.0148866881391;
        label = "Sat Terminal";
        dataRate = "1 Gbps";
        frequencyBands = "X,Ka,Q";
        softwareVersion = "MPR50 2.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 400;
        operationalStatus = "ACTIVE";
        securityClearance = "TOP_SECRET";
        lastMaintenanceDate = "2023-12-25";
        maintenanceInterval = "4 months";
    }
    part instance 2198: Device {
        assetIdentifier = "HPC001";
        manufacturer = "IBM";
        modelNumber = "Power System AC922";
        assetName = "AI Computing Platform";
        serialNumber = "IBM-AC922-2023-001";
        comments = "High-performance computing system for AI/ML applications";
        assetCostAmount = 1200000.0;
        netBookValueAmount = "1140000.0";
        ownership = "US Navy";
        inventoryDate = "2023-12-30";
        datePlacedInService = "2024-01-15";
        usefulLifePeriods = "5 years";
        assetType = "Computing";
        locationID = "SERVER-RM-05";
        buildingNumber = "3";
        buildingName = "Server Room";
        xPosition = 524.5433557989811;
        yPosition = -1388.8392427244048;
        label = "AI Platform";
        memorySize = "2TB";
        processingPower = "300 TFLOPS";
        softwareVersion = "PowerAI 2.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 800;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2023-12-30";
        maintenanceInterval = "3 months";
    }
    part instance 2199: Device {
        assetIdentifier = "RCS001";
        manufacturer = "BAE Systems";
        modelNumber = "SAMPSON MFR";
        assetName = "Radar Cross Section Monitor";
        serialNumber = "BAE-SAMP-2023-001";
        comments = "System for monitoring ship's radar cross section";
        assetCostAmount = 4500000.0;
        netBookValueAmount = "4275000.0";
        ownership = "US Navy";
        inventoryDate = "2024-01-05";
        datePlacedInService = "2024-01-20";
        usefulLifePeriods = "15 years";
        assetType = "Sensor";
        locationID = "MAST-07";
        xPosition = -408.811827096294;
        yPosition = -333.73189341679847;
        label = "RCS Monitor";
        resolution = "0.1 dBsm";
        frequencyRange = "2-18 GHz";
        softwareVersion = "SAMPSON 3.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 250;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2024-01-05";
        maintenanceInterval = "6 months";
    }
    part instance 2200: Device {
        assetIdentifier = "MAG001";
        manufacturer = "Ultra Electronics";
        modelNumber = "SeaGuard MDS";
        assetName = "Magnetic Detection System";
        serialNumber = "ULT-SGMDS-2024-001";
        comments = "Advanced magnetic anomaly detection system";
        assetCostAmount = 1800000.0;
        netBookValueAmount = "1710000.0";
        ownership = "US Navy";
        inventoryDate = "2024-01-10";
        datePlacedInService = "2024-01-25";
        usefulLifePeriods = "12 years";
        assetType = "Sensor";
        locationID = "HULL-AFT-03";
        xPosition = -456.7890123456;
        yPosition = -789.0123456789;
        label = "Mag Detector";
        sensitivity = "0.1 nT";
        detectionRange = "500m";
        softwareVersion = "SeaGuard 2.1";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 150;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2024-01-10";
        maintenanceInterval = "6 months";
    }
    part instance 2201: Device {
        assetIdentifier = "HYD001";
        manufacturer = "Rolls-Royce",";
        modelNumber = "MT30 Controller";
        assetName = "Hybrid Propulsion Controller";
        serialNumber = "RR-MT30C-2024-001";
        comments = "Advanced controller for hybrid propulsion system";
        assetCostAmount = 850000.0;
        netBookValueAmount = "807500.0";
        ownership = "US Navy";
        inventoryDate = "2024-01-15";
        datePlacedInService = "2024-01-30";
        usefulLifePeriods = "20 years";
        assetType = "Propulsion";
        locationID = "ENG-RM-12";
        xPosition = 2834.087751028315;
        yPosition = 1659.6494188429285;
        label = "Prop Control";
        efficiency = "98%";
        controlMode = "Hybrid";
        softwareVersion = "MT30C 1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 100;
        operationalStatus = "ACTIVE";
        securityClearance = "CONFIDENTIAL";
        lastMaintenanceDate = "2024-01-15";
        maintenanceInterval = "3 months";
    }
    part instance 2202: Device {
        assetIdentifier = "UUV001";
        manufacturer = "Huntington Ingalls";
        modelNumber = "Proteus";
        assetName = "Large Unmanned Undersea Vehicle";
        serialNumber = "HII-PROT-2024-001";
        comments = "Large displacement unmanned undersea vehicle";
        assetCostAmount = 22000000.0;
        netBookValueAmount = "20900000.0";
        ownership = "US Navy";
        inventoryDate = "2024-01-20";
        datePlacedInService = "2024-02-05";
        usefulLifePeriods = "15 years";
        assetType = "Unmanned Vehicle";
        locationID = "HANGAR-03";
        xPosition = -29.010874981839862;
        yPosition = -710.0703499048763;
        label = "Proteus UUV";
        maxDepth = "4000m";
        endurance = "30 days";
        softwareVersion = "Proteus 1.5";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 0;
        operationalStatus = "STANDBY";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2024-01-20";
        maintenanceInterval = "6 months";
    }
    part instance 2203: Device {
        assetIdentifier = "EMC001";
        manufacturer = "Raytheon";
        modelNumber = "AN/SLQ-59";
        assetName = "EMC Monitoring System";
        serialNumber = "RAY-SLQ59-2024-001";
        comments = "Electromagnetic compatibility monitoring system";
        assetCostAmount = 1500000.0;
        netBookValueAmount = "1425000.0";
        ownership = "US Navy";
        inventoryDate = "2024-01-25";
        datePlacedInService = "2024-02-10";
        usefulLifePeriods = "10 years";
        assetType = "Sensor";
        locationID = "MAST-08";
        xPosition = -896.1305208055567;
        yPosition = -62.868964398422804;
        label = "EMC Monitor";
        sensitivity = "-120 dBm";
        frequencyRange = "10 kHz - 40 GHz";
        softwareVersion = "SLQ59 1.0";
        networkInterface = "MIL-STD-1397";
        powerConsumption = 180;
        operationalStatus = "ACTIVE";
        securityClearance = "SECRET";
        lastMaintenanceDate = "2024-01-25";
        maintenanceInterval = "6 months";
    }
}

package Connections {

    part def DeviceConnection {
        property connectionType: String;
        property connectionDetails: Json?;
        property source: Float?;
        property target: Float?;
    }

    part instance 2165 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2165;
        target = Devices::2166;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "High-speed sensor data feed";
    }
    part instance 2166 -> 2125::DeviceConnection {
        connectionType = "command";
        source = Devices::2166;
        target = Devices::2125;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Triple redundant";
        responseTime = "<5ms";
        authentication = "PKI-based";
        connectionDetails = "Weapon control interface";
    }
    part instance 2167 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2167;
        target = Devices::2166;
        bandwidth = "100 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.999%";
        errorCorrection = "Forward EC";
        connectionDetails = "External communication link";
    }
    part instance 2168 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2168;
        target = Devices::2166;
        format = "NMEA 2000";
        protocol = "MIL-STD-1397";
        precision = "High";
        updateRate = "100Hz";
        validation = "Checksum";
        reliability = "99.999%";
        connectionDetails = "Navigation data feed";
    }
    part instance 2169 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2169;
        target = Devices::2166;
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        bufferSize = "1TB";
        dataFormat = "Raw + Processed";
        compression = "Lossy";
        connectionDetails = "Underwater sensor data";
    }
    part instance 2165 -> 2169::DeviceConnection {
        connectionType = "sync";
        source = Devices::2165;
        target = Devices::2169;
        jitter = "<1μs";
        accuracy = "±100ns";
        protocol = "MIL-STD-1397";
        syncRate = "1kHz";
        timeSource = "GPS";
        fallbackMode = "Internal";
        connectionDetails = "Sensor synchronization";
    }
    part instance 2170 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2170;
        target = Devices::2166;
        latency = "<1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Electronic warfare data feed";
    }
    part instance 2170 -> 2165::DeviceConnection {
        connectionType = "sync";
        source = Devices::2170;
        target = Devices::2165;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "1kHz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "Radar-EW coordination";
    }
    part instance 2171 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2171;
        target = Devices::2166;
        qos = "Normal";
        latency = "<50ms";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        redundancy = "Single-path";
        connectionDetails = "Backup sensor data feed";
    }
    part instance 2172 -> 2125::DeviceConnection {
        connectionType = "command";
        source = Devices::2172;
        target = Devices::2125;
        priority = "High";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Double redundant";
        responseTime = "<10ms";
        authentication = "PKI-based";
        connectionDetails = "Backup weapon control interface";
    }
    part instance 2178 -> 2179::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2179;
        latency = "<1ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Server network connection";
    }
    part instance 2179 -> 2180::DeviceConnection {
        connectionType = "power";
        source = Devices::2179;
        target = Devices::2180;
        current = "15A";
        voltage = "120V";
        priority = "Critical";
        protocol = "AC Power";
        redundancy = "None";
        connectionDetails = "Power supply to application server";
    }
    part instance 2178 -> 2181::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2181;
        latency = "<5ms";
        priority = "Normal";
        protocol = "BACnet/IP";
        bandwidth = "1 Gbps";
        redundancy = "Single-path";
        connectionDetails = "HVAC control network";
    }
    part instance 2182 -> 2178::DeviceConnection {
        connectionType = "network";
        source = Devices::2182;
        target = Devices::2178;
        latency = "<2ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "1 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Fire alarm system network connection";
    }
    part instance 2178 -> 2183::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2183;
        latency = "<10ms";
        priority = "Normal";
        protocol = "RTSP";
        bandwidth = "10 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Security camera video feed";
    }
    part instance 2178 -> 2184::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2184;
        latency = "<1ms";
        priority = "High";
        protocol = "Wiegand";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Access control system data";
    }
    part instance 2178 -> 2185::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2185;
        latency = "<2ms";
        priority = "High";
        protocol = "PROFINET";
        bandwidth = "100 Mbps";
        redundancy = "Dual-path";
        connectionDetails = "PLC control network";
    }
    part instance 2186 -> 2185::DeviceConnection {
        connectionType = "data";
        source = Devices::2186;
        target = Devices::2185;
        latency = "<5ms";
        priority = "Normal";
        protocol = "Modbus";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Generator control data";
    }
    part instance 2187 -> 2181::DeviceConnection {
        connectionType = "data";
        source = Devices::2187;
        target = Devices::2181;
        latency = "N/A";
        priority = "Low";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Water level monitoring (manual)";
    }
    part instance 2188 -> 2186::DeviceConnection {
        connectionType = "data";
        source = Devices::2188;
        target = Devices::2186;
        latency = "N/A";
        priority = "Normal";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Engine cooling data (manual)";
    }
    part instance 2189 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2189;
        target = Devices::2166;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "3D Radar data feed";
    }
    part instance 2190 -> 2125::DeviceConnection {
        connectionType = "command";
        source = Devices::2190;
        target = Devices::2125;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Quadruple redundant";
        responseTime = "<5ms";
        authentication = "PKI-based";
        connectionDetails = "Upgraded weapon control interface";
    }
    part instance 2192 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2192;
        target = Devices::2166;
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.99%";
        errorCorrection = "Forward EC";
        connectionDetails = "HF external communication link";
    }
    part instance 2193 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2193;
        target = Devices::2166;
        format = "NMEA 2000";
        protocol = "MIL-STD-1397";
        precision = "High";
        updateRate = "10Hz";
        validation = "Checksum";
        reliability = "99.99%";
        connectionDetails = "Navigation data feed";
    }
    part instance 2126 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2126;
        target = Devices::2166;
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        bufferSize = "1TB";
        dataFormat = "Raw + Processed";
        compression = "Lossy";
        connectionDetails = "Underwater sensor data";
    }
    part instance 2189 -> 2126::DeviceConnection {
        connectionType = "sync";
        source = Devices::2189;
        target = Devices::2126;
        jitter = "<1μs";
        accuracy = "±100ns";
        protocol = "MIL-STD-1397";
        syncRate = "1kHz";
        timeSource = "GPS";
        fallbackMode = "Internal";
        connectionDetails = "Sensor synchronization";
    }
    part instance 2127 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2127;
        target = Devices::2166;
        latency = "<1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Electronic warfare data feed";
    }
    part instance 2127 -> 2189::DeviceConnection {
        connectionType = "sync";
        source = Devices::2127;
        target = Devices::2189;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "1kHz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "Radar-EW coordination";
    }
    part instance 2178 -> 2128::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2128;
        latency = "<1ms";
        priority = "Normal";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Distribution switch connection";
    }
    part instance 2128 -> 2129::DeviceConnection {
        connectionType = "network";
        source = Devices::2128;
        target = Devices::2129;
        latency = "<1ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Database server network connection";
    }
    part instance 2130 -> 2129::DeviceConnection {
        connectionType = "power";
        source = Devices::2130;
        target = Devices::2129;
        current = "20A";
        voltage = "230V";
        priority = "Critical";
        protocol = "AC Power";
        redundancy = "None";
        connectionDetails = "Power supply to database server";
    }
    part instance 2178 -> 2131::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2131;
        latency = "<5ms";
        priority = "Normal";
        protocol = "Modbus TCP";
        bandwidth = "1 Gbps";
        redundancy = "Single-path";
        connectionDetails = "Building automation network";
    }
    part instance 2132 -> 2178::DeviceConnection {
        connectionType = "network";
        source = Devices::2132;
        target = Devices::2178;
        latency = "<2ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "1 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Fire alarm system network connection";
    }
    part instance 2178 -> 2134::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2134;
        latency = "<10ms";
        priority = "Normal";
        protocol = "RTSP";
        bandwidth = "15 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Security camera video feed";
    }
    part instance 2178 -> 2135::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2135;
        latency = "<1ms";
        priority = "High";
        protocol = "Zigbee";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Access control system data";
    }
    part instance 2178 -> 2136::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2136;
        latency = "<2ms";
        priority = "High";
        protocol = "Ethernet/IP";
        bandwidth = "100 Mbps";
        redundancy = "Dual-path";
        connectionDetails = "PLC control network";
    }
    part instance 2137 -> 2136::DeviceConnection {
        connectionType = "data";
        source = Devices::2137;
        target = Devices::2136;
        latency = "<5ms";
        priority = "Normal";
        protocol = "Modbus";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Generator control data";
    }
    part instance 2138 -> 2131::DeviceConnection {
        connectionType = "data";
        source = Devices::2138;
        target = Devices::2131;
        latency = "N/A";
        priority = "Low";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Water level monitoring (manual)";
    }
    part instance 2139 -> 2137::DeviceConnection {
        connectionType = "data";
        source = Devices::2139;
        target = Devices::2137;
        latency = "N/A";
        priority = "Normal";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Engine cooling data (manual)";
    }
    part instance 2140 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2140;
        target = Devices::2166;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "3D Radar data feed";
    }
    part instance 2141 -> 2125::DeviceConnection {
        connectionType = "command";
        source = Devices::2141;
        target = Devices::2125;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Quadruple redundant";
        responseTime = "<5ms";
        authentication = "PKI-based";
        connectionDetails = "Upgraded weapon control interface";
    }
    part instance 2143 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2143;
        target = Devices::2166;
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.99%";
        errorCorrection = "Forward EC";
        connectionDetails = "HF external communication link";
    }
    part instance 2144 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2144;
        target = Devices::2166;
        format = "NMEA 2000";
        protocol = "MIL-STD-1397";
        precision = "High";
        updateRate = "10Hz";
        validation = "Checksum";
        reliability = "99.99%";
        connectionDetails = "Navigation data feed";
    }
    part instance 2145 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2145;
        target = Devices::2166;
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        bufferSize = "1TB";
        dataFormat = "Raw + Processed";
        compression = "Lossy";
        connectionDetails = "Underwater sensor data";
    }
    part instance 2140 -> 2145::DeviceConnection {
        connectionType = "sync";
        source = Devices::2140;
        target = Devices::2145;
        jitter = "<1μs";
        accuracy = "±100ns";
        protocol = "MIL-STD-1397";
        syncRate = "1kHz";
        timeSource = "GPS";
        fallbackMode = "Internal";
        connectionDetails = "Sensor synchronization";
    }
    part instance 2146 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2146;
        target = Devices::2166;
        latency = "<1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Electronic warfare data feed";
    }
    part instance 2146 -> 2140::DeviceConnection {
        connectionType = "sync";
        source = Devices::2146;
        target = Devices::2140;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "1kHz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "Radar-EW coordination";
    }
    part instance 2178 -> 2147::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2147;
        latency = "<1ms";
        priority = "Normal";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "High-performance switch connection";
    }
    part instance 2147 -> 2148::DeviceConnection {
        connectionType = "network";
        source = Devices::2147;
        target = Devices::2148;
        latency = "<1ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Database server network connection";
    }
    part instance 2149 -> 2148::DeviceConnection {
        connectionType = "power";
        source = Devices::2149;
        target = Devices::2148;
        current = "20A";
        voltage = "230V";
        priority = "Critical";
        protocol = "AC Power";
        redundancy = "None";
        connectionDetails = "Power supply to database server";
    }
    part instance 2178 -> 2150::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2150;
        latency = "<5ms";
        priority = "Normal";
        protocol = "BACnet/IP";
        bandwidth = "1 Gbps";
        redundancy = "Single-path";
        connectionDetails = "Building automation network";
    }
    part instance 2151 -> 2178::DeviceConnection {
        connectionType = "network";
        source = Devices::2151;
        target = Devices::2178;
        latency = "<2ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "1 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Fire alarm system network connection";
    }
    part instance 2178 -> 2152::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2152;
        latency = "<10ms";
        priority = "Normal";
        protocol = "RTSP";
        bandwidth = "15 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Security camera video feed";
    }
    part instance 2178 -> 2153::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2153;
        latency = "<1ms";
        priority = "High";
        protocol = "Zigbee";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Access control system data";
    }
    part instance 2178 -> 2154::DeviceConnection {
        connectionType = "network";
        source = Devices::2178;
        target = Devices::2154;
        latency = "<2ms";
        priority = "High";
        protocol = "Ethernet/IP";
        bandwidth = "100 Mbps";
        redundancy = "Dual-path";
        connectionDetails = "PLC control network";
    }
    part instance 2155 -> 2154::DeviceConnection {
        connectionType = "data";
        source = Devices::2155;
        target = Devices::2154;
        latency = "<5ms";
        priority = "Normal";
        protocol = "Modbus";
        bandwidth = "1 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Generator control data";
    }
    part instance 2156 -> 2150::DeviceConnection {
        connectionType = "data";
        source = Devices::2156;
        target = Devices::2150;
        latency = "N/A";
        priority = "Low";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Water level monitoring (manual)";
    }
    part instance 2157 -> 2155::DeviceConnection {
        connectionType = "data";
        source = Devices::2157;
        target = Devices::2155;
        latency = "N/A";
        priority = "Normal";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Engine cooling data (manual)";
    }
    part instance 2158 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2158;
        target = Devices::2166;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "3D Radar data feed";
    }
    part instance 2159 -> 2125::DeviceConnection {
        connectionType = "command";
        source = Devices::2159;
        target = Devices::2125;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Quadruple redundant";
        responseTime = "<5ms";
        authentication = "PKI-based";
        connectionDetails = "Upgraded weapon control interface";
    }
    part instance 2161 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2161;
        target = Devices::2166;
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.99%";
        errorCorrection = "Forward EC";
        connectionDetails = "HF external communication link";
    }
    part instance 2162 -> 2161::DeviceConnection {
        connectionType = "data";
        source = Devices::2162;
        target = Devices::2161;
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
    }
    part instance 2194 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2194;
        target = Devices::2166;
        latency = "<5ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "1 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "Torpedo defense data feed";
    }
    part instance 2195 -> 2166::DeviceConnection {
        connectionType = "command";
        source = Devices::2195;
        target = Devices::2166;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Triple redundant";
        responseTime = "<2ms";
        authentication = "PKI-based";
        connectionDetails = "Laser weapon control interface";
    }
    part instance 2196 -> 2169::DeviceConnection {
        connectionType = "data";
        source = Devices::2196;
        target = Devices::2169;
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.99%";
        errorCorrection = "Forward EC";
        connectionDetails = "Underwater sensor data fusion";
    }
    part instance 2197 -> 2167::DeviceConnection {
        connectionType = "data";
        source = Devices::2197;
        target = Devices::2167;
        bandwidth = "1 Gbps";
        encryption = "AES-256";
        compression = "Adaptive";
        availability = "99.999%";
        errorCorrection = "LDPC";
        connectionDetails = "Satellite communications backup";
    }
    part instance 2198 -> 2166::DeviceConnection {
        connectionType = "data";
        source = Devices::2198;
        target = Devices::2166;
        latency = "<1ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "40 Gbps";
        encryption = "AES-256";
        redundancy = "Triple";
        connectionDetails = "AI processing data feed";
    }
    part instance 2198 -> 2164::DeviceConnection {
        connectionType = "data";
        source = Devices::2198;
        target = Devices::2164;
        latency = "<0.5ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        bandwidth = "100 Gbps";
        encryption = "AES-256";
        redundancy = "Quad";
        connectionDetails = "AI-Cybersecurity integration";
    }
    part instance 2199 -> 2165::DeviceConnection {
        connectionType = "sync";
        source = Devices::2199;
        target = Devices::2165;
        jitter = "<100ns";
        accuracy = "±50ns";
        protocol = "MIL-STD-1397";
        syncRate = "10kHz";
        timeSource = "Atomic";
        fallbackMode = "GPS";
        connectionDetails = "Radar signature monitoring";
    }
    part instance 2200 -> 2196::DeviceConnection {
        connectionType = "data";
        source = Devices::2200;
        target = Devices::2196;
        latency = "<10ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "1 Gbps";
        encryption = "AES-256";
        redundancy = "Dual";
        connectionDetails = "Magnetic anomaly data feed";
    }
    part instance 2201 -> 2185::DeviceConnection {
        connectionType = "control";
        source = Devices::2201;
        target = Devices::2185;
        latency = "<1ms";
        priority = "Critical";
        protocol = "PROFINET";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Propulsion system control";
    }
    part instance 2202 -> 2196::DeviceConnection {
        connectionType = "sync";
        source = Devices::2202;
        target = Devices::2196;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "100Hz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "Underwater vehicle coordination";
    }
    part instance 2203 -> 2170::DeviceConnection {
        connectionType = "data";
        source = Devices::2203;
        target = Devices::2170;
        latency = "<2ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        redundancy = "Dual";
        connectionDetails = "EMC monitoring for EW systems";
    }
    part instance 2198 -> 2133::DeviceConnection {
        connectionType = "data";
        source = Devices::2198;
        target = Devices::2133;
        latency = "<0.1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        bandwidth = "40 Gbps";
        encryption = "Quantum";
        redundancy = "Triple";
        connectionDetails = "AI-Quantum key processing";
    }
    part instance 2195 -> 2191::DeviceConnection {
        connectionType = "command";
        source = Devices::2195;
        target = Devices::2191;
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        validation = "Triple redundant";
        responseTime = "<2ms";
        authentication = "PKI-based";
        connectionDetails = "Laser weapon coordination with CIWS";
    }
    part instance 2198 -> 2129::DeviceConnection {
        connectionType = "data";
        source = Devices::2198;
        target = Devices::2129;
        latency = "<0.5ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "100 Gbps";
        encryption = "AES-256";
        redundancy = "Triple";
        connectionDetails = "AI data storage and analysis";
    }
    part instance 2196 -> 2202::DeviceConnection {
        connectionType = "sync";
        source = Devices::2196;
        target = Devices::2202;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "100Hz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "AUV-UUV coordination";
    }
    part instance 2197 -> 2161::DeviceConnection {
        connectionType = "data";
        source = Devices::2197;
        target = Devices::2161;
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        compression = "Adaptive";
        availability = "99.999%";
        errorCorrection = "LDPC";
        connectionDetails = "Multi-band satellite data fusion";
    }
    part instance 2200 -> 2169::DeviceConnection {
        connectionType = "data";
        source = Devices::2200;
        target = Devices::2169;
        latency = "<5ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "2 Gbps";
        encryption = "AES-256";
        redundancy = "Dual";
        connectionDetails = "Magnetic-Sonar data fusion";
    }
    part instance 2203 -> 2189::DeviceConnection {
        connectionType = "data";
        source = Devices::2203;
        target = Devices::2189;
        latency = "<2ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "1 Gbps";
        encryption = "AES-256";
        redundancy = "Dual";
        connectionDetails = "EMC monitoring for radar systems";
    }
    part instance 2199 -> 2140::DeviceConnection {
        connectionType = "sync";
        source = Devices::2199;
        target = Devices::2140;
        jitter = "<100ns";
        accuracy = "±50ns";
        protocol = "MIL-STD-1397";
        syncRate = "10kHz";
        timeSource = "Atomic";
        fallbackMode = "GPS";
        connectionDetails = "RCS monitoring for navigation radar";
    }
    part instance 2194 -> 2126::DeviceConnection {
        connectionType = "data";
        source = Devices::2194;
        target = Devices::2126;
        latency = "<5ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "1 Gbps";
        encryption = "AES-256";
        redundancy = "Dual";
        connectionDetails = "Torpedo defense sonar integration";
    }
    part instance 2201 -> 2155::DeviceConnection {
        connectionType = "control";
        source = Devices::2201;
        target = Devices::2155;
        latency = "<1ms";
        priority = "Critical";
        protocol = "PROFINET";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Engine control integration";
    }
    part instance 2198 -> 2148::DeviceConnection {
        connectionType = "data";
        source = Devices::2198;
        target = Devices::2148;
        latency = "<0.5ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "40 Gbps";
        encryption = "AES-256";
        redundancy = "Dual";
        connectionDetails = "AI database integration";
    }
    part instance 2203 -> 2146::DeviceConnection {
        connectionType = "data";
        source = Devices::2203;
        target = Devices::2146;
        latency = "<2ms";
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "2 Gbps";
        encryption = "AES-256";
        redundancy = "Dual";
        connectionDetails = "EMC monitoring for EW suite";
    }
    part instance 2197 -> 2143::DeviceConnection {
        connectionType = "data";
        source = Devices::2197;
        target = Devices::2143;
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        compression = "Adaptive";
        availability = "99.999%";
        errorCorrection = "LDPC";
        connectionDetails = "Satellite-HF communications integration";
    }
}