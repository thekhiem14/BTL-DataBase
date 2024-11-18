DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_staff_phone_number`(
    IN p_PhoneID INT
)
BEGIN
    DELETE FROM staffphonenumbers
    WHERE PhoneID = p_PhoneID;
END$$
DELIMITER ;
