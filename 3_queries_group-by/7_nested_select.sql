

SELECT students.name, 
(SELECT COUNT(*) FROM assignments) - 
 COUNT(assignment_submissions.*) AS remaining_assignments
FROM assignment_submissions 
JOIN students 
ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP By students.name