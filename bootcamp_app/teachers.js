const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
})

pool.query(
  `
  SELECT DISTINCT teachers.name AS teacher,  cohorts.name AS cohort
  FROM teachers
  JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name LIKE '${process.argv[2]}'
  ORDER BY teacher
  `
)
  .then((res) => {
    res.rows.forEach((assist) => {
      console.log(`${assist.cohort} : ${assist.teacher}`)
    })
  })
  .catch((err) => {
    console.error('error', err.stack)
  })