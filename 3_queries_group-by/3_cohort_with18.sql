
SELECT cohorts.name AS cohort_name, 
COUNT(students.name) AS total_students
FROM cohorts
JOIN students 
ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.name) > 17
ORDER BY total_students ;
