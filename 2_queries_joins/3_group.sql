SELECT students.name, COUNT(assignment_submissions.*)
FROM assignment_submissions 
JOIN students
ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING COUNT(assignment_submissions.*) < 100;