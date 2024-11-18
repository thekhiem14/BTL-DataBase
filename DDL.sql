CREATE TABLE `athleteachievements` (
  `AthleteID` int NOT NULL,
  `AchievementID` int DEFAULT NULL,
  `AchievementDate` date DEFAULT NULL,
  `CompetitionName` varchar(100) DEFAULT NULL,
  `AchievementType` varchar(50) DEFAULT NULL,
  `Reward` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AthleteID`),
  CONSTRAINT `athleteachievements_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `athletehealthhistory` (
  `HealthID` int NOT NULL AUTO_INCREMENT,
  `AthleteID` int DEFAULT NULL,
  `BloodType` varchar(5) DEFAULT NULL,
  `Allergies` text,
  `MedicalConditions` text,
  `EmergencyContact` varchar(100) DEFAULT NULL,
  `LastCheckupDate` date DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`HealthID`),
  KEY `AthleteID` (`AthleteID`),
  CONSTRAINT `athletehealthhistory_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `athletephonenumbers` (
  `PhoneID` int NOT NULL AUTO_INCREMENT,
  `AthleteID` int DEFAULT NULL,
  `PhoneType` enum('Mobile','Home','Emergency') DEFAULT 'Mobile',
  `PhoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`PhoneID`),
  KEY `AthleteID` (`AthleteID`),
  CONSTRAINT `athletephonenumbers_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `athletes` (
  `AthleteID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` text,
  `JoinDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Active','Inactive','Suspended') DEFAULT 'Active',
  `LastModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AthleteID`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `athletescheduleassignments` (
  `AssignmentID` int NOT NULL AUTO_INCREMENT,
  `AthleteID` int NOT NULL,
  `TemplateID` int NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1',
  `CreatedBy` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `LastModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AssignmentID`),
  KEY `AthleteID` (`AthleteID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `CreatedBy` (`CreatedBy`),
  CONSTRAINT `athletescheduleassignments_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`),
  CONSTRAINT `athletescheduleassignments_ibfk_2` FOREIGN KEY (`TemplateID`) REFERENCES `scheduletemplates` (`TemplateID`),
  CONSTRAINT `athletescheduleassignments_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `athletespecialities` (
  `SpecialityID` int NOT NULL AUTO_INCREMENT,
  `AthleteID` int DEFAULT NULL,
  `SportType` varchar(50) NOT NULL,
  `YearsExperience` int DEFAULT NULL,
  PRIMARY KEY (`SpecialityID`),
  KEY `AthleteID` (`AthleteID`),
  CONSTRAINT `athletespecialities_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `athleteviolations` (
  `AthleteViolationID` int NOT NULL AUTO_INCREMENT,
  `AthleteID` int DEFAULT NULL,
  `ViolationDate` date DEFAULT NULL,
  `Description` text,
  `Severity` enum('Minor','Moderate','Severe') DEFAULT NULL,
  `Status` enum('Pending','Resolved') DEFAULT 'Pending',
  `Resolution` text,
  PRIMARY KEY (`AthleteViolationID`),
  KEY `AthleteID` (`AthleteID`),
  CONSTRAINT `athleteviolations_ibfk_1` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `classfacilities` (
  `EquipmentID` int DEFAULT NULL,
  `RoomID` int NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  KEY `EquipmentID` (`EquipmentID`),
  CONSTRAINT `classfacilities_ibfk_1` FOREIGN KEY (`EquipmentID`) REFERENCES `facilities` (`FacilityID`),
  CONSTRAINT `classfacilities_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `facilities` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `cleaningstaff` (
  `StaffID` int NOT NULL,
  `Schedule` text,
  `AreaResponsibility` text,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `cleaningstaff_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `courseathletes` (
  `EnrollmentID` int NOT NULL AUTO_INCREMENT,
  `CourseID` int DEFAULT NULL,
  `AthleteID` int DEFAULT NULL,
  PRIMARY KEY (`EnrollmentID`),
  KEY `CourseID` (`CourseID`),
  KEY `AthleteID` (`AthleteID`),
  CONSTRAINT `courseathletes_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  CONSTRAINT `courseathletes_ibfk_2` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `courseplans` (
  `PlanID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`PlanID`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `courseplans_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  CONSTRAINT `courseplans_ibfk_2` FOREIGN KEY (`PlanID`) REFERENCES `nutritionplans` (`PlanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `courses` (
  `CourseID` int NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(100) NOT NULL,
  `TrainerID` int DEFAULT NULL,
  `Schedule` text,
  `Requirements` text,
  `Description` text,
  `Status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`CourseID`),
  KEY `TrainerID` (`TrainerID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`TrainerID`) REFERENCES `trainers` (`TrainerID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `equipment` (
  `FacilityID` int NOT NULL,
  `EquipmentType` varchar(50) DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `LastMaintenance` date DEFAULT NULL,
  PRIMARY KEY (`FacilityID`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`FacilityID`) REFERENCES `facilities` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `facilities` (
  `FacilityID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `FacilityType` enum('Room','Equipment') NOT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `maintenancestaff` (
  `StaffID` int NOT NULL,
  `MaintenanceArea` varchar(100) DEFAULT NULL,
  `Schedule` text,
  `EmergencyResponse` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `maintenancestaff_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `nutritionplans` (
  `PlanID` int NOT NULL AUTO_INCREMENT,
  `PlanName` varchar(100) NOT NULL,
  `Description` text,
  `Duration` int DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PlanID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `officestaff` (
  `StaffID` int NOT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Schedule` text,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `officestaff_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `payments` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `PaymentDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentType` enum('Cash','Bank Transfer') DEFAULT NULL,
  `ReceivedBy` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `ReceivedBy` (`ReceivedBy`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`ReceivedBy`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `rooms` (
  `FacilityID` int NOT NULL,
  `FloorNumber` int DEFAULT NULL,
  `MaxOccupancy` int DEFAULT NULL,
  `LastMaintenance` date DEFAULT NULL,
  PRIMARY KEY (`FacilityID`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`FacilityID`) REFERENCES `facilities` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `rules` (
  `RuleID` int NOT NULL AUTO_INCREMENT,
  `RuleTitle` varchar(100) NOT NULL,
  `Description` text,
  PRIMARY KEY (`RuleID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `scheduletemplatedetails` (
  `DetailID` int NOT NULL AUTO_INCREMENT,
  `TemplateID` int NOT NULL,
  `DayOfWeek` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `ActivityType` enum('Course','Training','Rest','Nutrition','Other') NOT NULL,
  `CourseID` int DEFAULT NULL,
  `TrainerID` int DEFAULT NULL,
  `FacilityID` int DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`DetailID`),
  KEY `TemplateID` (`TemplateID`),
  KEY `CourseID` (`CourseID`),
  KEY `TrainerID` (`TrainerID`),
  KEY `FacilityID` (`FacilityID`),
  CONSTRAINT `scheduletemplatedetails_ibfk_1` FOREIGN KEY (`TemplateID`) REFERENCES `scheduletemplates` (`TemplateID`) ON DELETE CASCADE,
  CONSTRAINT `scheduletemplatedetails_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  CONSTRAINT `scheduletemplatedetails_ibfk_3` FOREIGN KEY (`TrainerID`) REFERENCES `trainers` (`TrainerID`),
  CONSTRAINT `scheduletemplatedetails_ibfk_4` FOREIGN KEY (`FacilityID`) REFERENCES `facilities` (`FacilityID`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `scheduletemplates` (
  `TemplateID` int NOT NULL AUTO_INCREMENT,
  `TemplateName` varchar(100) NOT NULL,
  `Description` text,
  `IsActive` tinyint(1) DEFAULT '1',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `LastModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TemplateID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `securitystaff` (
  `StaffID` int NOT NULL,
  `Schedule` text,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `securitystaff_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` text,
  `HireDate` date DEFAULT NULL,
  `StaffType` enum('Office','Cleaning','Maintenance','Security') NOT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `staffphonenumbers` (
  `PhoneID` int NOT NULL AUTO_INCREMENT,
  `StaffID` int DEFAULT NULL,
  `PhoneType` enum('Mobile','Home','Emergency') DEFAULT 'Mobile',
  `PhoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`PhoneID`),
  KEY `StaffID` (`StaffID`),
  CONSTRAINT `staffphonenumbers_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `staffviolations` (
  `staffViolationID` int NOT NULL,
  `staffID` int DEFAULT NULL,
  `ViolationDate` date DEFAULT NULL,
  `Description` text,
  `Severity` enum('Minor','Moderate','Severe') DEFAULT NULL,
  `Status` enum('Pending','Resolved') DEFAULT 'Pending',
  `Resolution` text,
  PRIMARY KEY (`staffViolationID`),
  KEY `staffID` (`staffID`),
  CONSTRAINT `staffviolations_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `trainerphonenumbers` (
  `PhoneID` int NOT NULL AUTO_INCREMENT,
  `TrainerID` int DEFAULT NULL,
  `PhoneType` enum('Mobile','Home','Emergency') DEFAULT 'Mobile',
  `PhoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`PhoneID`),
  KEY `TrainerID` (`TrainerID`),
  CONSTRAINT `trainerphonenumbers_ibfk_1` FOREIGN KEY (`TrainerID`) REFERENCES `trainers` (`TrainerID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `trainers` (
  `TrainerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `TrainerQualification` text,
  PRIMARY KEY (`TrainerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `trainerviolations` (
  `ViolationID` int NOT NULL AUTO_INCREMENT,
  `TrainerID` int DEFAULT NULL,
  `ViolationDate` date DEFAULT NULL,
  `Description` text,
  `Severity` enum('Minor','Moderate','Severe') DEFAULT NULL,
  `Status` enum('Pending','Resolved') DEFAULT 'Pending',
  `Resolution` text,
  PRIMARY KEY (`ViolationID`),
  KEY `TrainerID` (`TrainerID`),
  CONSTRAINT `trainerviolations_ibfk_1` FOREIGN KEY (`TrainerID`) REFERENCES `trainers` (`TrainerID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
