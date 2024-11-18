DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpsertStaffProfile`(
    IN p_StaffID INT,
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_DateOfBirth DATE,
    IN p_Email VARCHAR(100),
    IN p_Address TEXT,
    IN p_HireDate DATE,
    IN p_StaffType ENUM('Office','Cleaning','Maintenance','Security')
)
BEGIN
    IF p_StaffID IS NULL OR p_StaffID = 0 THEN
        -- Insert new staff
        INSERT INTO staff (
            FirstName, LastName, DateOfBirth, 
            Email, Address, HireDate, StaffType
        ) VALUES (
            p_FirstName, p_LastName, p_DateOfBirth, 
            p_Email, p_Address, p_HireDate, p_StaffType
        );
        SET p_StaffID = LAST_INSERT_ID();
    ELSE
        -- Update existing staff
        UPDATE staff
        SET 
            FirstName = p_FirstName,
            LastName = p_LastName,
            DateOfBirth = p_DateOfBirth,
            Email = p_Email,
            Address = p_Address,
            HireDate = p_HireDate,
            StaffType = p_StaffType
        WHERE StaffID = p_StaffID;
    END IF;
    
    SELECT p_StaffID AS StaffID;
END$$
DELIMITER ;

