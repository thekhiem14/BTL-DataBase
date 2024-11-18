DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAthleteDetails`(
    IN p_AthleteID INT,
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_Address TEXT,
    IN p_Status ENUM('Active', 'Inactive', 'Suspended')
)
BEGIN
    UPDATE athletes
    SET 
        FirstName = p_FirstName,
        LastName = p_LastName,
        Email = p_Email,
        Address = p_Address,
        Status = p_Status
    WHERE AthleteID = p_AthleteID;
END$$
DELIMITER ;
