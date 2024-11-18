DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAthleteHealthRecord`(
    IN p_AthleteID INT,
    IN p_BloodType VARCHAR(5),
    IN p_Allergies TEXT,
    IN p_MedicalConditions TEXT,
    IN p_EmergencyContact VARCHAR(100),
    IN p_LastCheckupDate DATE,
    IN p_Notes TEXT
)
BEGIN
    INSERT INTO athletehealthhistory (
        AthleteID,
        BloodType,
        Allergies,
        MedicalConditions,
        EmergencyContact,
        LastCheckupDate,
        Notes
    ) VALUES (
        p_AthleteID,
        p_BloodType,
        p_Allergies,
        p_MedicalConditions,
        p_EmergencyContact,
        p_LastCheckupDate,
        p_Notes
    ) ON DUPLICATE KEY UPDATE 
        BloodType = p_BloodType,
        Allergies = p_Allergies,
        MedicalConditions = p_MedicalConditions,
        EmergencyContact = p_EmergencyContact,
        LastCheckupDate = p_LastCheckupDate,
        Notes = p_Notes;
END$$
DELIMITER ;
