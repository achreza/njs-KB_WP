var express = require("express");
var app = express();

var mysql = require("mysql");

var myConnection = require("express-myconnection");
var expressLayout = require("express-ejs-layouts");

var config = require("./config");
var dbOptions = {
  host: config.database.host,
  user: config.database.user,
  password: config.database.password,
  port: config.database.port,
  database: config.database.db,
};


app.use(myConnection(mysql, dbOptions, "pool"));

app.set("view engine", "ejs");
app.use(expressLayout);




// KB
var index = require("./routes/index");
var jenis = require("./routes/kb/jenis");
var criteria = require("./routes/kb/criteria");
var priority = require("./routes/kb/priority");
var alternate = require("./routes/kb/alternate");
var result = require("./routes/kb/result");
var effect = require("./routes/kb/effect");
var detail = require("./routes/kb/detail");

var expressValidator = require("express-validator");
app.use(expressValidator());

var bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var methodOverride = require("method-override");

app.use(
  methodOverride(function (req, res) {
    if (req.body && typeof req.body === "object" && "_method" in req.body) {
      // look in urlencoded POST bodies and delete it
      var method = req.body._method;
      delete req.body._method;
      return method;
    }
  })
);

var flash = require("express-flash");
var cookieParser = require("cookie-parser");
var session = require("express-session");

app.use(cookieParser("keyboard cat"));
app.use(
  session({
    secret: "keyboard cat",
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 },
  })
);
app.use(flash());

app.use("/", index);
app.use("/jenis", jenis);
app.use("/criteria", criteria);
app.use("/priority", priority);
app.use("/alternate", alternate);
app.use("/result", result);
app.use("/effect", effect);
app.use("/detail",detail);


app.use(express.static("public"));
app.use(express.static(__dirname + "/public"));

app.listen(3000, function () {
  console.log("Server running at port 3000: http://127.0.0.1:3000");
});
