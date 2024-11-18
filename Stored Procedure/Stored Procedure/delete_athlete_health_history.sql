DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_athlete_health_history`(
IN p_HealthID INT
)
BEGIN
DELETE FROM athletehealthhistory
WHERE HealthID = p_HealthID;
END$$
DELIMITER ;
