DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_staff`(
IN p_FirstName VARCHAR(50),
IN p_LastName VARCHAR(50),
IN p_DateOfBirth DATE,
IN p_Email VARCHAR(100),
IN p_Address TEXT,
IN p_HireDate DATE,
IN p_StaffType ENUM('Office','Cleaning','Maintenance','Security')
)
BEGIN
INSERT INTO staff (FirstName, LastName, DateOfBirth, Email, Address, HireDate, StaffType)
VALUES (p_FirstName, p_LastName, p_DateOfBirth, p_Email, p_Address, p_HireDate, p_StaffType);
END$$
DELIMITER ;
