DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_athlete_achievement`(
IN p_AthleteID INT
)
BEGIN
DELETE FROM athleteachievements
WHERE AthleteID = p_AthleteID;
END$$
DELIMITER ;

