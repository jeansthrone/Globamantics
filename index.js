const path = require('path')
const express = require('express')
const exphbs = require('express-handlebars')
var favicon = require('serve-favicon');
var routes = require('./routes/index');

const app = express()

app.engine('.hbs', exphbs({
  defaultLayout: 'layout',
  extname: '.hbs',
  layoutsDir: path.join(__dirname, 'views/layouts')
}))
app.set('view engine', '.hbs')
app.set('views', path.join(__dirname, 'views'))

app.use(favicon(path.join(__dirname, 'public', '/Icons/Globo_Icon_Home.png')));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', routes);
// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
  });

 // error handlers 
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
});

app.listen(3000);