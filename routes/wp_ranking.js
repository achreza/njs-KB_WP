var express = require("express");
var app = express();

// SHOW LIST OF wp_rankingS
app.get("/", function (req, res, next) {
  req.getConnection(function (error, conn) {
    conn.query("SELECT * FROM wp_ranking", function (err, rows, fields) {
      //if(err) throw err
      if (err) {
        req.flash("error", err);
        res.render("wp_ranking/list", {
          title: "wp_ranking List",
          data: "",
        });
      } else {
        // render to views/wp_ranking/list.ejs template file
        res.render("wp_ranking/list", {
          title: "wp_ranking List",
          data: rows,
        });
      }
    });
  });
});

module.exports = app;
