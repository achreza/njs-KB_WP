var express = require("express");
var app = express();

app.get("/", function (req, res) {
  // render to views/index.ejs template file

  let jenis = req.params.jenis;
  req.getConnection(function (error, conn) {
    conn.query("SELECT * FROM kriteria", function (err, rows) {
      //if(err) throw err
      if (err) {
        req.flash("error", err);
        res.render("kb/weight/priority", {
          title: "Kriteria List",
          data: "",
          layout: "layouts/layout",
        });
      } else {
        // render to views/kb/weight/priority.ejs template file

        res.render("kb/weight/priority", {
          title: "Kriteria List",
          data: rows,
          layout: "layouts/layout",
          jenis,
        });
      }
    });
  });
});

// ADD NEW kriteria POST ACTION
app.post("/add", function (req, res, next) {
  req.assert("prioritas", "prioritas is required").notEmpty(); //Validate prioritas
  req.assert("id_kriteria", "id_kriteria is required").notEmpty(); //Validate id_kriteria

  var errors = req.validationErrors();

  if (!errors) {
    //No errors were found.  Passed Validation!

    /********************************************
             * Express-validator module
             
            req.body.comment = 'a <span>comment</span>';
            req.body.kriteriaprioritas = '   a kriteria    ';
    
            req.sanitize('comment').escape(); // returns 'a &lt;span&gt;comment&lt;/span&gt;'
            req.sanitize('kriteriaprioritas').trim(); // returns 'a kriteria'
            ********************************************/
    var bobot = {
      value: req.sanitize("prioritas").escape().trim(),
      id_kriteria: req.sanitize("id_kriteria").escape().trim(),
    };

    var value = req.sanitize("prioritas").escape().trim();
    var id_kriteria = req.sanitize("id_kriteria").escape().trim();

    var arrValue = value.split(",");
    var arrId = id_kriteria.split(",");

    var tes = [];

    for (var i = 0; i < arrValue.length; i++) {
      tes.push([arrValue[i], arrId[i]]);
    }

    console.log(value);

    req.getConnection(function (error, conn) {
      var sql = "INSERT INTO bobot (value, id_kriteria) VALUES ?";
      conn.query(sql, [tes], function (err, result) {
        //if(err) throw err
        if (err) {
          req.flash("error", err);

          // render to views/kriteria/add.ejs
          req.getConnection(function (error, conn) {
            conn.query("SELECT * FROM kriteria", function (err, rows) {
              //if(err) throw err
              if (err) {
                req.flash("error", err);
                res.render("kb/weight/priority", {
                  title: "Kriteria List",
                  data: "",
                  layout: "layouts/layout",
                });
              } else {
                // render to views/kb/weight/priority.ejs template file

                res.render("kb/weight/priority", {
                  title: "Kriteria List",
                  data: rows,
                  layout: "layouts/layout",
                });
              }
            });
          });
        } else {
          req.flash("success", "Data added successfully!");

          // render to views/kriteria/add.ejs
          res.render("kb/result/result", {
            title: "Add New kriteria",
            layout: "layouts/layout",
          });
        }
      });
    });
  } else {
    //Display errors to kriteria
    // var error_msg = "";
    // errors.forEach(function (error) {
    //   error_msg += error.msg + "<br>";
    // });
    // req.flash("error", error_msg);
    // res.render("kriteria/add", {
    //   title: "Add New kriteria",
    //   prioritas: req.body.prioritas,
    //   id_kriteria: req.body.id_kriteria,
    // });
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
