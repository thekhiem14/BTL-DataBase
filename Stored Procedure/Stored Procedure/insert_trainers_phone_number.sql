DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_trainers_phone_number`(
    IN p_TrainerID INT,
    IN p_PhoneType ENUM('Mobile', 'Home', 'Emergency'),
    IN p_PhoneNumber VARCHAR(20)
)
BEGIN
    INSERT INTO Trainerphonenumbers (TrainerID, PhoneType, PhoneNumber)
    VALUES (p_TrainerID, p_PhoneType, p_PhoneNumber);
END$$
DELIMITER ;
