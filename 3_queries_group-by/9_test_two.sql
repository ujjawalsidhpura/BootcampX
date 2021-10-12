-- SELECT avg(total_students) as avg_students
-- FROM (
--  SELECT count(students) as total_students
--  FROM students
--  JOIN cohorts on cohorts.id = cohort_id
--  GROUP BY cohorts
-- ) 

-- OR

-- SELECT avg(totals_table.total_students) as avg_students
-- FROM (
--  SELECT count(students) as total_students
--  FROM students
--  JOIN cohorts on cohorts.id = cohort_id
--  GROUP BY cohorts
-- ) as totals_table
 
SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);