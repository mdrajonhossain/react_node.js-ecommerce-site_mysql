const handleClick = (e)=> {
  
  var article = {product_img:e.product_img, product_name:e.product_name, product_qunt:e.product_qunt, product_price:e.product_price}

  axios.post('http://192.168.0.102:3001/orderpading', article)
    .then(response => {
      console.log(response.data)
    });
  console.log(article);
}

<div className="home"><Link to="/product">Product</Link></div>