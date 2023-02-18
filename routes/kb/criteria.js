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
                res.render("kb/criteria/criteria", {
                    title: "Kriteria List",
                    data: "",
                    layout: 'layouts/layout'
                });
            } else {
                // render to views/kb/criteria/criteria.ejs template file

                res.render("kb/criteria/criteria", {
                    title: "Kriteria List",
                    data: rows,
                    layout: 'layouts/layout',
                    jenis
                });
            }
        });
    });
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
