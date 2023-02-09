var express = require("express");
var app = express();

// SHOW LIST OF bobotS
app.get("/", function (req, res, next) {
  res.render("home/home", { title: "DSS Bahasa Pemrogaman" });
});

module.exports = app;
