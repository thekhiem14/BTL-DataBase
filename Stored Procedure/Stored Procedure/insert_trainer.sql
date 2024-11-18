DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_trainer`(
IN p_FirstName VARCHAR(50),
IN p_LastName VARCHAR(50),
IN p_DateOfBirth DATE,
IN p_Email VARCHAR(100),
IN p_HireDate DATE,
IN p_TrainerQualification TEXT
)
BEGIN
INSERT INTO trainers (FirstName, LastName, DateOfBirth, Email, HireDate, TrainerQualification)
VALUES (p_FirstName, p_LastName, p_DateOfBirth, p_Email, p_HireDate, p_TrainerQualification);
END$$
DELIMITER ;
