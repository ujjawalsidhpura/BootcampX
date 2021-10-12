SELECT cohorts.name AS cohort ,
AVG(assistance_requests.completed_at - assistance_requests.started_at) AS duration
FROM assistance_requests 
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY duration DESC
LIMIT 1
