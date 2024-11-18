DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_trainers_phone_number`(
    IN p_PhoneID INT
)
BEGIN
    DELETE FROM trainerphonenumbers
    WHERE PhoneID = p_PhoneID;
END$$
DELIMITER ;
