DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignScheduleTemplate`(
    IN p_AthleteID INT,
    IN p_TemplateID INT,
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    IN p_CreatedBy INT
)
BEGIN
    -- Check for existing active schedules
    UPDATE AthleteScheduleAssignments 
    SET IsActive = FALSE 
    WHERE AthleteID = p_AthleteID 
    AND IsActive = TRUE;
    
    -- Insert new schedule assignment
    INSERT INTO AthleteScheduleAssignments (
        AthleteID, 
        TemplateID, 
        StartDate, 
        EndDate, 
        CreatedBy
    ) VALUES (
        p_AthleteID,
        p_TemplateID,
        p_StartDate,
        p_EndDate,
        p_CreatedBy
    );
END$$
DELIMITER ;

