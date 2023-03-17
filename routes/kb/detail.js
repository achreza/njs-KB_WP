var express = require("express");
var app = express();

app.get("/(:jenis)/(:index)", function (req, res) {
    // render to views/index.ejs template file
    let index = req.params.index;
    let jenis = req.params.jenis;

    
    req.getConnection(function (error, conn) {
        conn.query("SELECT detail.id_detail, alternatif.nm_alternatif,detail.keterangan FROM detail JOIN alternatif ON detail.id_alternatif = alternatif.id_alternatif WHERE detail.id_metode = "+index+";", function (err, rows) {
            //if(err) throw err
            if (err) {
                req.flash("error", err);
                res.render("kb/detail/detail", {
                    title: "SPK-KB",
                    data: "",
                    layout: 'layouts/layout'
                });
            } else {
                // render to views/kb/criteria/criteria.ejs template file

                res.render("kb/detail/detail", {
                    title: "SPK-KB",
                    data: rows,
                    layout: 'layouts/layout',
                    index,
                    jenis,
                    page: "detail"
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
