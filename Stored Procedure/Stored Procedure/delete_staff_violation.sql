DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_staff_violation`(
    IN p_StaffViolationID INT
)
BEGIN
    DELETE FROM staffviolations
    WHERE staffViolationID = p_StaffViolationID;
END$$
DELIMITER ;
