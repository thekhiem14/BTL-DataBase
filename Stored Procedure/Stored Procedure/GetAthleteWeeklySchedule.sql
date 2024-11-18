DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAthleteWeeklySchedule`(
    IN p_AthleteID INT
)
BEGIN
    SELECT 
        DayOfWeek,
        StartTime,
        EndTime,
        ActivityType,
        CourseName,
        TrainerName,
        FacilityName,
        Notes
    FROM AthleteCurrentSchedule
    WHERE AthleteID = p_AthleteID
    ORDER BY 
        CASE DayOfWeek
            WHEN 'Monday' THEN 1
            WHEN 'Tuesday' THEN 2
            WHEN 'Wednesday' THEN 3
            WHEN 'Thursday' THEN 4
            WHEN 'Friday' THEN 5
            WHEN 'Saturday' THEN 6
            WHEN 'Sunday' THEN 7
        END,
        StartTime;
END$$
DELIMITER ;
