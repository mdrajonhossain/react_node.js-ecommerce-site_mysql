var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('./../dbconnect.js');
const bcrypt = require('bcrypt');
var multer  = require('multer');
const fs = require('fs').promises;
var cors = require('cors')


router.use(cors())


var corsOptions = {
  origin: 'http://192.168.0.102:3001/',
  optionsSuccessStatus: 200 
}



/* GET home page. */

var session = require('express-session');
router.use(session({
  name : 'app.sid',
  secret: "1234567890QWERTY",
  resave: true,
  saveUninitialized: true
}));


var storage = multer.diskStorage({
  destination: './upload',
  filename: function (req, file, cb) {
    cb(null, Date.now() + '.jpg')}
  })
var upload = multer({ storage: storage })




router.get('/', (req, res, next) => {
 	if(req.session.username){
		res.redirect('/dash');		
 	}else{
 		res.render('index');
 	}
})


router.get('/registration', (req, res)=> {
    const username = "rajon";
    const email = "rajonhossaindhaka@gmail.com";
    const password = "12345";

      const hashPass = bcrypt.hashSync(password, 10);
    var sql = "INSERT INTO admin_authentication (email, username, conpassword) VALUES ('"+email+"','"+username+"', '"+hashPass+"')"; 
    db.query(sql);      
    res.redirect('/');  
});



 router.get('/dash', (req, res, next) => {
 	if(req.session.username){
    
		res.render('dashbord', {
      "username": req.session.username,
      "email": req.session.email,      
    });

 	}else{
 		res.redirect('/');
 	}
})

 


router.post('/auth', function(req, res, next) {
var username  = req.body.username;
var password  = req.body.password; 	

if(username != '' && password != ''){	
	 
	db.query('SELECT * FROM admin_authentication WHERE username = ?',[username], function (error, results, fields) {
        if(results.length >0){
            bcrypt.compare(password, results[0].conpassword, function(err, ress) {
            	console.log(ress)
                if(!ress){
                    res.redirect('/');
                }else{
                	req.session.username = username;
                  req.session.email = results[0].email;
                    res.redirect('/dash');
                }
            });         
        }else{
        	res.redirect('/');
        }
    });
}
});

router.get('/logoute', function(req, res, next) {	

	req.session.destroy(function(err) {   		
   		res.redirect('/');
	});
});


 router.get('/cata', (req, res, next) => {
  db.query('select * from catagori', function (error, results, fields) {      
    if(req.session.username){      
      
        res.render('catagori', {results:results});
    }else{
      res.redirect('/');
    }
  })
})

 
router.post('/product_cata', (req, res, next) => {
    var catagori  = req.body.catagori;
    var group  = req.body.group;  
    var cata_post = "INSERT INTO catagori (product_catagori, product_group) VALUES ('"+catagori+"','"+group+"')"; 
    db.query(cata_post);
    res.redirect('/cata');
})



 router.get('/prod', (req, res, next) => {
  db.query('select * from product_add', function (error, results, fields) {     
      db.query('select * from catagori', function (error, cata, fields) {
        if(req.session.username){      
            res.render('product', {results:results, cata:cata});
        }else{
          res.redirect('/');
        }
    })
  })
})


 

router.use('/products', express.static('upload'));
router.post('/productsadd', upload.single('product_img'),(req, res, next) => {
  const catagori = req.body.catagori;
  const productgroup = req.body.productgroup;
  const product_name = req.body.product_name;  
  const product_img = `http://192.168.0.102:3001/products/${req.file.filename}`  
  const product_price = req.body.product_price;
  const product_qunt = req.body.product_qunt;
  const product_discount = req.body.product_discount;
  const product_discription = req.body.product_discription;
  
  var products_post = "INSERT INTO product_add (catagori, productgroup, product_name, product_img, product_price, product_qunt, product_discount, product_discription) VALUES ('"+catagori+"','"+productgroup+"','"+product_name+"','"+product_img+"','"+product_price+"','"+product_qunt+"','"+product_discount+"','"+product_discription+"')";
  db.query(products_post);    
  res.redirect('/prod');
})


 router.get('/productdel/:id', (req, res, next) => {
    const iddelte = req.params.id;
    db.query("select * from product_add WHERE id = '"+req.params.id+"'", function (error, results, fields) {
      fs.unlink('./upload/'+results[0].product_img.substr(35)); 
      db.query("DELETE FROM product_add WHERE id = '"+req.params.id+"'", function (error, results, fields) {      
          res.redirect('/prod');
      })
    })
})



router.get('/apibad', function (req, res) {
  db.query('select * from product_add', function (error, results, fields) {
    res.send(results)
  })

})


module.exports = router;
