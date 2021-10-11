SELECT 
students.name AS student,
AVG(assignment_submissions.duration) AS time_taken,
AVG(assignments.duration) AS estimated_time
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignments.duration) > AVG(assignment_submissions.duration)
ORDER BY time_taken