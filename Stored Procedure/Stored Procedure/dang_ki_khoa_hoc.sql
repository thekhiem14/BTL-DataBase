DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `enroll_athlete_to_course`(
    IN athlete_id INT,
    IN course_id INT
)
BEGIN
    -- Khai báo các biến
    DECLARE athlete_exists INT;
    DECLARE course_exists INT;
    DECLARE already_enrolled INT;
    
    -- Kiểm tra xem athlete có tồn tại không
    SELECT COUNT(*) INTO athlete_exists 
    FROM athletes 
    WHERE AthleteID = athlete_id;

    -- Kiểm tra xem course có tồn tại không
    SELECT COUNT(*) INTO course_exists 
    FROM courses 
    WHERE CourseID = course_id AND Status = 'Active';

    -- Kiểm tra xem athlete đã đăng ký khóa học này chưa
    SELECT COUNT(*) INTO already_enrolled 
    FROM courseathletes 
    WHERE AthleteID = athlete_id AND CourseID = course_id;

    -- Nếu các điều kiện đều thỏa mãn thì thực hiện đăng ký
    IF athlete_exists > 0 THEN
        IF course_exists > 0 THEN
            IF already_enrolled = 0 THEN
                INSERT INTO courseathletes (CourseID, AthleteID)
                VALUES (course_id, athlete_id);
                SELECT 'Đăng ký khóa học thành công!' AS Message;
            ELSE
                SELECT 'Athlete đã đăng ký khóa học này rồi!' AS Message;
            END IF;
        ELSE
            SELECT 'Khóa học không tồn tại hoặc không còn hoạt động!' AS Message;
        END IF;
    ELSE
        SELECT 'Athlete không tồn tại trong hệ thống!' AS Message;
    END IF;
END$$
DELIMITER ;
