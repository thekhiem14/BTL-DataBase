DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_staff_phone_number`(
    IN p_staffID INT,
    IN p_PhoneType ENUM('Mobile', 'Home', 'Emergency'),
    IN p_PhoneNumber VARCHAR(20)
)
BEGIN
    INSERT INTO staffphonenumbers (StaffID, PhoneType, PhoneNumber)
    VALUES (p_StaffID, p_PhoneType, p_PhoneNumber);
END$$
DELIMITER ;
