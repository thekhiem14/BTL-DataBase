DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTrainerProfile`(
    IN p_TrainerID INT,
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_DateOfBirth DATE,
    IN p_HireDate DATE,
    IN p_Qualification TEXT
)
BEGIN
    UPDATE trainers
    SET 
        FirstName = p_FirstName,
        LastName = p_LastName,
        Email = p_Email,
        DateOfBirth = p_DateOfBirth,
        HireDate = p_HireDate,
        TrainerQualification = p_Qualification
    WHERE TrainerID = p_TrainerID;
END$$
DELIMITER ;

