SELECT students.name, students.email, cohorts.id AS Cohort
FROM students LEFT JOIN cohorts 
ON cohort_id = cohorts.id;