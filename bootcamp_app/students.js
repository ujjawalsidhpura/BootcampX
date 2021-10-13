const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
})

//parameterizing input data for safe injection
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const values = [`%${cohortName}%`, limit];

const dbQuery =
  `
SELECT 
students.id AS id ,
students.name AS name,
cohorts.name AS cohort_name
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2
`

pool.query(dbQuery, values)
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(`${user.name} has an id of ${user.id} and was in ${user.cohort_name} cohort \n`)
    })
  })
  .catch((err) => {
    console.error('error', err.stack)
  })