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

    part instance 1330: Device {
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
        xPosition = -624.1028801191173;
        yPosition = -285.8421661172913;
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
    part instance 1331: Device {
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
    part instance 1332: Device {
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
        xPosition = 401.204417257253;
        yPosition = 205.94358860730392;
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
    part instance 1333: Device {
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
        xPosition = -747.5181704762257;
        yPosition = 286.5054104928823;
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
    part instance 1334: Device {
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
        xPosition = 158.83600868435;
        yPosition = -550.9638087467823;
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
    part instance 1335: Device {
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
        xPosition = -576.4412629920223;
        yPosition = 222.23351121416658;
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
    part instance 1336: Device {
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
    part instance 1337: Device {
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
    part instance 1338: Device {
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
    part instance 1339: Device {
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
        xPosition = 1652.0;
        yPosition = 62.0;
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
    part instance 1340: Device {
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
        xPosition = 764.0;
        yPosition = 1952.75;
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
    part instance 1341: Device {
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
        xPosition = -388.3630268045933;
        yPosition = 218.93452379591446;
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
    part instance 1342: Device {
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
        xPosition = 1393.0;
        yPosition = -193.0;
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
    part instance 1343: Device {
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
        xPosition = 714.0;
        yPosition = 643.0;
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
    part instance 1344: Device {
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
        xPosition = 634.5450191461381;
        yPosition = 236.98676107740846;
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
    part instance 1345: Device {
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
    part instance 1346: Device {
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
    part instance 1347: Device {
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
        xPosition = 961.064039386341;
        yPosition = -404.07799671780487;
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
    part instance 1348: Device {
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
        xPosition = -3.271072755324667;
        yPosition = 24.364463622337666;
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
    part instance 1349: Device {
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
        xPosition = 1316.5;
        yPosition = 2039.0;
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
    part instance 1350: Device {
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
        xPosition = -532.4424603401426;
        yPosition = -735.1177134855795;
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
}

package Connections {

    part def DeviceConnection {
        property connectionType: String;
        property connectionDetails: Json?;
        property source: Float?;
        property target: Float?;
    }

    part instance 1337 -> 1348::DeviceConnection {
        connectionType = "network";
        source = Devices::1337;
        target = Devices::1348;
        latency = "<5ms";
        priority = "Normal";
        protocol = "BACnet/IP";
        bandwidth = "1 Gbps";
        redundancy = "Single-path";
        connectionDetails = "Building automation network";
    }
    part instance 1337 -> 1349::DeviceConnection {
        connectionType = "network";
        source = Devices::1337;
        target = Devices::1349;
        latency = "<10ms";
        priority = "Normal";
        protocol = "RTSP";
        bandwidth = "15 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Security camera video feed";
    }
    part instance 1350 -> 1348::DeviceConnection {
        connectionType = "data";
        source = Devices::1350;
        target = Devices::1348;
        latency = "N/A";
        priority = "Low";
        protocol = "None";
        bandwidth = "N/A";
        redundancy = "None";
        connectionDetails = "Water level monitoring (manual)";
    }
    part instance 1330 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1330;
        target = Devices::1331;
        qos = "High Priority";
        latency = "<10ms";
        protocol = "MIL-STD-1397";
        bandwidth = "10 Gbps";
        encryption = "AES-256";
        redundancy = "Dual-path";
        connectionDetails = "High-speed sensor data feed";
    }
    part instance 1332 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1332;
        target = Devices::1331;
        bandwidth = "100 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.999%";
        errorCorrection = "Forward EC";
        connectionDetails = "External communication link";
    }
    part instance 1333 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1333;
        target = Devices::1331;
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        bufferSize = "1TB";
        dataFormat = "Raw + Processed";
        compression = "Lossy";
        connectionDetails = "Underwater sensor data";
    }
    part instance 1330 -> 1333::DeviceConnection {
        connectionType = "sync";
        source = Devices::1330;
        target = Devices::1333;
        jitter = "<1μs";
        accuracy = "±100ns";
        protocol = "MIL-STD-1397";
        syncRate = "1kHz";
        timeSource = "GPS";
        fallbackMode = "Internal";
        connectionDetails = "Sensor synchronization";
    }
    part instance 1334 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1334;
        target = Devices::1331;
        latency = "<1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        security = "TOP SECRET";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Electronic warfare data feed";
    }
    part instance 1334 -> 1330::DeviceConnection {
        connectionType = "sync";
        source = Devices::1334;
        target = Devices::1330;
        priority = "High";
        protocol = "MIL-STD-1397";
        syncMode = "Real-time";
        updateRate = "1kHz";
        dataSharing = "Bidirectional";
        fallbackMode = "Autonomous";
        connectionDetails = "Radar-EW coordination";
    }
    part instance 1335 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1335;
        target = Devices::1331;
        qos = "Normal";
        latency = "<50ms";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        redundancy = "Single-path";
        connectionDetails = "Backup sensor data feed";
    }
    part instance 1339 -> 1337::DeviceConnection {
        connectionType = "network";
        source = Devices::1339;
        target = Devices::1337;
        latency = "<2ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "1 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Fire alarm system network connection";
    }
    part instance 1337 -> 1340::DeviceConnection {
        connectionType = "network";
        source = Devices::1337;
        target = Devices::1340;
        latency = "<10ms";
        priority = "Normal";
        protocol = "RTSP";
        bandwidth = "10 Mbps";
        redundancy = "Single-path";
        connectionDetails = "Security camera video feed";
    }
    part instance 1341 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1341;
        target = Devices::1331;
        format = "NMEA 2000";
        protocol = "MIL-STD-1397";
        precision = "High";
        updateRate = "10Hz";
        validation = "Checksum";
        reliability = "99.99%";
        connectionDetails = "Navigation data feed";
    }
    part instance 1337 -> 1342::DeviceConnection {
        connectionType = "network";
        source = Devices::1337;
        target = Devices::1342;
        latency = "<1ms";
        priority = "Normal";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Distribution switch connection";
    }
    part instance 1342 -> 1343::DeviceConnection {
        connectionType = "network";
        source = Devices::1342;
        target = Devices::1343;
        latency = "<1ms";
        priority = "High";
        protocol = "TCP/IP";
        bandwidth = "10 Gbps";
        redundancy = "Dual-path";
        connectionDetails = "Database server network connection";
    }
    part instance 1344 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1344;
        target = Devices::1331;
        bandwidth = "5 Gbps";
        encryption = "AES-256";
        compression = "Lossless";
        availability = "99.99%";
        errorCorrection = "Forward EC";
        connectionDetails = "HF external communication link";
    }
    part instance 1345 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1345;
        target = Devices::1331;
        format = "NMEA 2000";
        protocol = "MIL-STD-1397";
        precision = "High";
        updateRate = "10Hz";
        validation = "Checksum";
        reliability = "99.99%";
        connectionDetails = "Navigation data feed";
    }
    part instance 1346 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1346;
        target = Devices::1331;
        priority = "High";
        protocol = "MIL-STD-1397";
        bandwidth = "5 Gbps";
        bufferSize = "1TB";
        dataFormat = "Raw + Processed";
        compression = "Lossy";
        connectionDetails = "Underwater sensor data";
    }
    part instance 1347 -> 1331::DeviceConnection {
        connectionType = "data";
        source = Devices::1347;
        target = Devices::1331;
        latency = "<1ms";
        priority = "Critical";
        protocol = "MIL-STD-1397";
        bandwidth = "1 Gbps";
        redundancy = "Triple";
        connectionDetails = "Electronic warfare data feed";
    }
}