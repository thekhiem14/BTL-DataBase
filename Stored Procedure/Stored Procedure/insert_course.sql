DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_course`(
IN p_CourseName VARCHAR(100),
IN p_TrainerID INT,
IN p_Schedule TEXT,
IN p_Requirements TEXT,
IN p_Description TEXT,
IN p_Status ENUM('Active','Inactive')
)
BEGIN
INSERT INTO courses (CourseName, TrainerID, Schedule, Requirements, Description, Status)
VALUES (p_CourseName, p_TrainerID, p_Schedule, p_Requirements, p_Description, p_Status);
END$$
DELIMITER ;
