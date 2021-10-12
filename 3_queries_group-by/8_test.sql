SELECT cohorts.name, count(students)
FROM students
JOIN cohorts on cohorts.id = cohort_id
GROUP BY cohorts.name;

-- SELECT avg(count(students))
-- FROM students
-- JOIN cohorts on cohorts.id = cohort_id
-- GROUP BY cohorts;

-- Error