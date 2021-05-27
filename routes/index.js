var express = require('express');
var router = express.Router();


/* GET home page. */
router.get('/', function (req, res) {
    res.render('index', { title: 'Globomantics' });
});
router.get('/link1', function (req, res) {
    res.render('link1', { title: 'Drug Interactions', author: "Todd Little" });
});
router.get('/link2', function (req, res) {
    res.render('link2', { title: 'Patient Care', author: "Rob Cinberg" });
});

module.exports = router;