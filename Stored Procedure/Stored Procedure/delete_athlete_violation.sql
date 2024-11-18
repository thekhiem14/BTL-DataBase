DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_athlete_violation`(
    IN p_AthleteViolationID INT
)
BEGIN
    DELETE FROM athleteviolations
    WHERE AthleteViolationID = p_AthleteViolationID;
END$$
DELIMITER ;
