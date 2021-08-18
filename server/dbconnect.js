var mysql = require('mysql');

var con = mysql.createConnection({
	host     : 'localhost',
    database : 'ponnodb',
    user     : 'root',
    password : ''
});

 
module.exports = con;