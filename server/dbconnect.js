var mysql = require('mysql');

var con = mysql.createConnection({
	host     : 'localhost',
    database : 'ecommerce_one',
    user     : 'root',
    password : ''
});

 
module.exports = con;