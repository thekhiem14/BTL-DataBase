DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_trainer_violation`(
    IN p_ViolationID INT
)
BEGIN
    DELETE FROM trainerviolations
    WHERE ViolationID = p_ViolationID;
END$$
DELIMITER ;

