DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_nutrition_plan`(
IN p_PlanID INT
)
BEGIN
DELETE FROM nutritionplans
WHERE PlanID = p_PlanID;
END$$
DELIMITER ;


