const faker = require("faker");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const exphbs = require("express-handlebars");
const path = require("path");
const express = require("express");
const app = express();

const port = 8088;

app.engine("hbs", exphbs({ defaultLayout: "main", extname: ".hbs" }));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs");

//css
app.use(express.static(__dirname + "/public"));

app.use(
  bodyParser.urlencoded({
    extends: true,
  })
);

//-------CONNECT MYSQL-------------

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root@admin",
  database: "join_us",
});

//-------Total email-------------

app.get("/", function (req, res) {
  let q = "SELECT COUNT(*) AS count FROM users";

  connection.query(q, function (error, results, fields) {
    if (error) throw error;
    console.log(results);
    const count = results[0].count;
    return res.render("home", { count: count });
  });
});

//-------Register-------------

app.post("/register", function (req, res) {
  let person = {
    email: req.body.email,
  };
  let q = "INSERT INTO users SET ?";

  connection.query(q, person, function (error, results, fields) {
    if (error) throw error;
    console.log(results);
    res.redirect("/");
  });
});

app.listen(port, function () {
  console.log(`Server running port ${port}`);
});

// connection.end();
