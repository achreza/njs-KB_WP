var express = require("express");
var app = express();

app.get("/(:jenis)", function (req, res) {
  // render to views/index.ejs template file

  let jenis = req.params.jenis;
  req.getConnection(function (error, conn) {
    conn.query("SELECT * FROM kriteria", function (err, rows) {
      //if(err) throw err
      if (err) {
        req.flash("error", err);
        res.render("kb/weight/priority", {
          title: "SPK-KB",
          data: "",
          layout: "layouts/layout",
          page: "priority"
        });
      } else {
        // render to views/kb/weight/priority.ejs template file

        res.render("kb/weight/priority", {
          title: "SPK-KB",
          data: rows,
          layout: "layouts/layout",
          jenis,
          page: "priority"
        });
      }
    });
  });
});

// ADD NEW kriteria POST ACTION
app.post("/add/(:jenis)", function (req, res, next) {
  req.assert("prioritas", "prioritas is required").notEmpty(); //Validate prioritas
  req.assert("id_kriteria", "id_kriteria is required").notEmpty(); //Validate id_kriteria
  let jenis = req.params.jenis;

  if (!req.validationErrors()) {
    var value = req.sanitize("prioritas").escape().trim();
    var id_kriteria = req.sanitize("id_kriteria").escape().trim();

    var arrValue = value.split(",");
    var arrId = id_kriteria.split(",");

    var tes = [];

    for (var i = 0; i < arrValue.length; i++) {
      tes.push([arrValue[i], arrId[i]]);
    }

    req.getConnection(function (error, conn) {
      var hasError = false;
      for (let index = 0; index < arrValue.length; index++) {
        var sql = "UPDATE bobot set value = " + arrValue[index] + " where id_kriteria = " + arrId[index] + ";";

        conn.query(sql, function (err, result) {
          if (err && !hasError) {
            hasError = true;
            req.flash("error", err);
            res.redirect("/criteria/" + jenis);
          }
        });
      }

      if (!hasError) {
        res.redirect("/result/" + jenis);
      }
    });
  } else {
    req.flash('error', 'There was an error processing your request, please try again.');
    res.redirect('/criteria/' + jenis);
  }
});

/**
 * We assign app object to module.exports
 *
 * module.exports exposes the app object as a module
 *
 * module.exports should be used to return the object
 * when this file is required in another module like app.js
 */
module.exports = app;
