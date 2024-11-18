DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_nutrition_plan`(
IN p_PlanName VARCHAR(100),
IN p_Description TEXT,
IN p_Duration INT
)
BEGIN
INSERT INTO nutritionplans (PlanName, Description, Duration)
VALUES (p_PlanName, p_Description, p_Duration);
END$$
DELIMITER ;
