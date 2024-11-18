-- Lấy danh sách tất cả huấn luyện viên được sắp xếp theo ngày tuyển dụng mới nhất
SELECT FirstName, LastName, HireDate, Email
FROM Trainers
ORDER BY HireDate DESC;
-- Đếm số lượng vận động viên trong từng khóa học
SELECT c.CourseName, COUNT(ca.AthleteID) as AthleteCount
FROM Courses c
LEFT JOIN CourseAthletes ca ON c.CourseID = ca.CourseID
GROUP BY c.CourseID, c.CourseName;
--   Tìm các phòng tập chưa được bảo trì trong 6 tháng qua
SELECT r.FacilityID, f.Name, r.LastMaintenance
FROM Rooms r
JOIN Facilities f ON r.FacilityID = f.FacilityID
WHERE r.LastMaintenance < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
--   Liệt kê tất cả các thiết bị và lịch sử bảo trì của chúng
SELECT f.Name, e.EquipmentType, e.PurchaseDate, e.LastMaintenance
FROM Equipment e
JOIN Facilities f ON e.FacilityID = f.FacilityID
ORDER BY e.LastMaintenance;
-- Danh sách nhân viên và số vi phạm họ đã bị ghi nhận trong năm qua
SELECT staff.FirstName, COUNT(staffviolations.staffViolationID) AS violation_count
FROM staff
JOIN staffviolations ON staff.staffID = staffviolations.staffID
WHERE staffviolations.violationDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY staff.staffID
HAVING violation_count > 0
ORDER BY violation_count DESC;
-- Tìm các phòng được sử dụng nhiều nhất trong lịch học:
SELECT f.Name, COUNT(std.DetailID) as UsageCount
FROM facilities f
JOIN scheduletemplatedetails std ON f.FacilityID = std.FacilityID
GROUP BY f.FacilityID, f.Name
ORDER BY UsageCount DESC;
-- Liệt kê tất cả các khóa học diễn ra vào thứ Hai:
SELECT c.CourseName, std.StartTime, std.EndTime
FROM courses c
JOIN scheduletemplatedetails std ON c.CourseID = std.CourseID
WHERE std.DayOfWeek = 'Monday';
-- Tìm athletes chưa đăng ký khóa học nào:
SELECT a.FirstName, a.LastName, a.Email
FROM athletes a
LEFT JOIN courseathletes ca ON a.AthleteID = ca.AthleteID
WHERE ca.EnrollmentID IS NULL;
-- Tìm các athletes có lịch tập trùng nhau
SELECT DISTINCT a1.FirstName, a1.LastName, a2.FirstName, a2.LastName, std.DayOfWeek, std.StartTime
FROM athletescheduleassignments asa1
JOIN athletescheduleassignments asa2 ON asa1.TemplateID = asa2.TemplateID
JOIN athletes a1 ON asa1.AthleteID = a1.AthleteID
JOIN athletes a2 ON asa2.AthleteID = a2.AthleteID
JOIN scheduletemplatedetails std ON asa1.TemplateID = std.TemplateID
WHERE a1.AthleteID < a2.AthleteID;
-- Liệt kê tất cả các khóa học và số lượng athletes đăng ký
SELECT c.CourseName, COUNT(ca.AthleteID) as StudentCount
FROM courses c
LEFT JOIN courseathletes ca ON c.CourseID = ca.CourseID
GROUP BY c.CourseID, c.CourseName;
-- Tìm staff có nhiều vi phạm nhất
SELECT s.FirstName, s.LastName, COUNT(sv.staffViolationID) as ViolationCount
FROM staff s
LEFT JOIN staffviolations sv ON s.StaffID = sv.staffID
GROUP BY s.StaffID, s.FirstName, s.LastName
ORDER BY ViolationCount DESC
LIMIT 1;
-- Đếm số lượng khóa học mà mỗi trainer phụ trách:
SELECT t.FirstName, t.LastName, COUNT(c.CourseID) as CourseCount
FROM trainers t
LEFT JOIN courses c ON t.TrainerID = c.TrainerID
GROUP BY t.TrainerID, t.FirstName, t.LastName;
-- Liệt kê tất cả các vi phạm nghiêm trọng (severe) của athletes:
SELECT a.FirstName, a.LastName, av.ViolationDate, av.Description
FROM athletes a
JOIN athleteviolations av ON a.AthleteID = av.AthleteID
WHERE av.Severity = 'Severe';


