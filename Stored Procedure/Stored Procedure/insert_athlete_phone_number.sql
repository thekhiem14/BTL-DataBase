DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_athlete_phone_number`(
    IN p_AthleteID INT,
    IN p_PhoneType ENUM('Mobile', 'Home', 'Emergency'),
    IN p_PhoneNumber VARCHAR(20)
)
BEGIN
    INSERT INTO athletephonenumbers (AthleteID, PhoneType, PhoneNumber)
    VALUES (p_AthleteID, p_PhoneType, p_PhoneNumber);
END$$
DELIMITER ;
