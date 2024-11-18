DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_trainer`(
IN p_TrainerID INT
)
BEGIN
DELETE FROM trainers
WHERE TrainerID = p_TrainerID;
END$$
DELIMITER ;
