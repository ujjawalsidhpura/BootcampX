SELECT cohorts.name AS cohort,
AVG(assistance_requests.completed_at - assistance_requests.started_at)
 AS avg_time
FROM assistance_requests
JOIN students ON student_id = students.id 
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY avg_time