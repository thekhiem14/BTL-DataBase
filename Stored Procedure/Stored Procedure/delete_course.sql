DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_course`(
IN p_CourseID INT
)
BEGIN
DELETE FROM courses
WHERE CourseID = p_CourseID;
END$$
DELIMITER ;

