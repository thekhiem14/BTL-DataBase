DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_staff`(
IN p_StaffID INT
)
BEGIN
DELETE FROM staff
WHERE StaffID = p_StaffID;
END$$
DELIMITER ;
