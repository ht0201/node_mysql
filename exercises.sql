const faker = require("faker");
const mysql = require("mysql");

/* function generateAddress() {
  console.log(faker.internet.email());
  console.log(faker.date.past());
  console.log(faker.address.city());
}

generateAddress(); */

//-------CONNECT MYSQL-------------

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root@admin",
  database: "join_us",
});

/*  -------COUNT total: email------ */
/* let q = "SELECT COUNT(*) as total FROM users";
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results[0].total);
}); */

/* -------INSERT one data------- */
/* let q = 'INSERT INTO users (email) VALUES("test6@gmail.com")';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
}); */

/* -------INSERT data take 2------- */
/* let person = {
  email: faker.internet.email(),
  created_at: faker.date.past(),
};
console.log(person);

connection.query(
  "INSERT INTO users SET ?",
  person,
  function (error, results, fields) {
    if (error) throw error;
    console.log(results);
  }
); */

/* -------INSERT a lot of  data------- */

/* let dataArr = []
for (let i = 0; i < 500; i++) {
  dataArr.push([faker.internet.email(), faker.date.past()]);
}

let dataArr = [
  [faker.internet.email(), faker.date.past()],
  [faker.internet.email(), faker.date.past()],
  [faker.internet.email(), faker.date.past()],
];

let q = "INSERT INTO users (email, created_at) VALUES ?";
connection.query(q, [dataArr], function (error, results, fields) {
  if (error) throw error;
  console.log(results);
}); */

/* -------Exercise ------- */

/* -------Find Earliest Date A User Joined ------- */
/* let q =
  "SELECT DATE_FORMAT(created_at, '%M %D %Y') as earliest_date  FROM users ORDER BY created_at ASC LIMIT 1"; */

/* -------Find Email Of The First (Earliest)User ------- */
/* let q =
  "SELECT * FROM users WHERE created_at = (SELECT MIN(created_at) FROM users) ";
 */

/* -------Users According To The Month They Joined ------- */
/* let q =
  "SELECT MONTHNAME(created_at) as month, COUNT(*) as count FROM users GROUP BY month ORDER BY count DESC"; */

/* -------Users According To The Month They Joined ------- */
/* let q =
  "SELECT MONTHNAME(created_at) as month, COUNT(*) as count FROM users GROUP BY month ORDER BY count DESC"; */

/* -------Count Number of Users With Yahoo Emails ------- */
/* let q =
  "SELECT COUNT(email) as yahoo_users FROM users WHERE email LIKE '%@yahoo.com'"; */

/* -------Calculate Total Number of Users for Each Email Host ------- */

let q =
  "SELECT CASE WHEN email LIKE '%@gmail.com' THEN 'gmail' WHEN email LIKE '%@yahoo.com' THEN 'yahoo' WHEN email LIKE '%@hotmail.com' THEN 'hotmail' ELSE 'others' END as provider, COUNT(*) AS total_users FROM users GROUP BY provider ORDER BY total_users DESC";

connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});

connection.end();
