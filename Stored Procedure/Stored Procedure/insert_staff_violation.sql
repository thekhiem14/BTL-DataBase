DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_staff_violation`(
    IN p_StaffID INT,
    IN p_ViolationDate DATE,
    IN p_Description TEXT,
    IN p_Severity ENUM('Minor','Moderate','Severe'),
    IN p_Status ENUM('Pending','Resolved'),
    IN p_Resolution TEXT
)
BEGIN
    INSERT INTO staffviolations (staffID, ViolationDate, Description, Severity, Status, Resolution)
    VALUES (p_StaffID, p_ViolationDate, p_Description, p_Severity, p_Status, p_Resolution);
END$$
DELIMITER ;
