const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
})

//parameterizing input to protect against unsafe injection
const dbQuery = `
SELECT DISTINCT teachers.name AS teacher,  cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teacher
`
const cohort = `%${process.argv[2]}%`;
const values = [cohort];

pool.query(dbQuery, values)
  .then((res) => {
    res.rows.forEach((assist) => {
      console.log(`${assist.cohort} : ${assist.teacher}`)
    })
  })
  .catch((err) => {
    console.error('error', err.stack)
  })