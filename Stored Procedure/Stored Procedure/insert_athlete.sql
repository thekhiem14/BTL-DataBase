DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_athlete`(
    IN new_first_name VARCHAR(50),
    IN new_last_name VARCHAR(50),
    IN new_email VARCHAR(100),
    IN new_address TEXT,
    IN new_status ENUM('Active', 'Inactive', 'Suspended')
)
BEGIN
    INSERT INTO athletes (FirstName, LastName, Email, Address, Status)
    VALUES (new_first_name, new_last_name, new_email, new_address, new_status);
END$$
DELIMITER ;
