var express = require("express");
var app = express();

app.get("/(:jenis)", function (req, res) {
    let jenis = req.params.jenis;
    req.getConnection(function (error, conn) {
        if (jenis == "Istri") {
            conn.query("SELECT * FROM wp_ranking LIMIT 3", function (err, rows) {
                //if(err) throw err
                if (error) {
                    req.flash("error", err);
                    res.render("kb/weight/priority", {
                        title: "SPK-KB",
                        data: "",
                        layout: "layouts/layout",
                        page: "priority"
                    });
                } else {
                    // render to views/kb/weight/priority.ejs template file

                    res.render("kb/result/result", {
                        title: "SPK-KB",
                        layout: "layouts/layout",
                        data: rows,
                        jenis,
                        page: "result"
                    });
                }
            });
        } else {
            conn.query("SELECT * FROM wp_ranking WHERE nm_alternatif IN ('Kondom', 'Kontrasepsi Mantap') ORDER BY nilaiV DESC; ", function (err, rows) {
                //if(err) throw err
                if (error) {
                    req.flash("error", err);
                    res.render("kb/weight/priority", {
                        title: "SPK-KB",
                        data: "",
                        layout: "layouts/layout",
                        page: "priority"
                    });
                } else {
                    // render to views/kb/weight/priority.ejs template file

                    res.render("kb/result/result2", {
                        title: "SPK-KB",
                        layout: "layouts/layout",
                        data: rows,
                        jenis,
                        page: "result"
                    });
                }
            });
        }

    });
    // render to views/index.ejs template file




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
