router.post('/product_cata', (req, res, next) => {
    var catagori  = req.body.catagori;
    var group  = req.body.group;  
    var cata_post = "INSERT INTO catagori (product_catagori, product_group) VALUES ('"+catagori+"','"+group+"')"; 
    db.query(cata_post);
    res.redirect('/cata');
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



router.all('/orderpading', function (req, res) {
  const product_name = req.body.product_name;
  const product_img = req.body.product_img;
  const quantity = req.body.product_qunt;
  const price = req.body.product_price;  
  
  var order_card = "INSERT INTO order_card (product_name, product_img, quantity, price) VALUES ('"+product_name+"','"+product_img+"','"+quantity+"','"+price+"')"; 
  db.query(order_card);
  res.send({mss:"successfully"})
})


router.get('/orderpadingshow', function (req, res) {
  db.query('select * from order_card', function (error, results, fields) {
    res.send(results)
  })

})