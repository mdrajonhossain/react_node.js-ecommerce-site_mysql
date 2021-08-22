import React,{ useState, useEffect } from 'react';
import '../App.css';
import Header from './Header';

import { Link, useHistory} from "react-router-dom";
const axios = require('axios');





function Home() {
	    const [dataf, setDataf] = useState([]);
      const [catadata, setCatadata] = useState([]);
      const [filteringdata, setFilteringdata] = useState([]);      
      const [singpleproduct, setSingpleproduct] = useState([]);      
      const [product_details_hide_show, setProduct_details_hide_show] = useState(false);



useEffect(() => {    
    axios.get('http://192.168.0.102:3001/apibad')
    .then(function (response) {          
      setDataf(response.data);
    })
    .catch(function (error) {    
      console.log(error);
    })
},[]);



useEffect(() => {    
    axios.get('http://192.168.0.102:3001/apicat')
    .then(function (response) {          
      setCatadata(response.data);
    })
    .catch(function (error) {    
      console.log(error);
    })
},[]);

 
const catagorifiling= (e)=> {  
  setFilteringdata(e)
}

const product_show = dataf.filter((data)=>{
  return data.product_category.match(filteringdata);
})

const product_details = (e)=> {
  // alert(e.title)
  setSingpleproduct(e)
  setProduct_details_hide_show(!product_details_hide_show)
}


const addcardbtn = (e)=>{
  function getRandomInt(max) {
    return Math.floor(Math.random() * max);
  }
  var id = Math.random();
  var product_card = JSON.parse(localStorage.getItem("product_card") || "[]");
  product_card.push({id: id, product_img: e.imagePath, product_name: e.title, qunt:1, price:e.price});
  localStorage.setItem("product_card", JSON.stringify(product_card));
}

const allProduct = ()=>{  
  window.history.go('/');
}

 
return (
    <>
    <Header/>             
    
    <div className="product_body">      

    <div className="sitebar">
        <div className="pro_gory" onClick={()=>allProduct()}>All Product</div>
        {catadata.map((caf)=> {
        return <div className="pro_gory" onClick={()=>catagorifiling(caf.title)}>{caf.title}</div>})
        }
    </div>        
      


    <div className="right_site">
      {product_show.map((data)=> {
        return (
          <div className="card">
            <img src={data.imagePath} alt="Girl in a jacket"/>            
            <div className="text">
              <div className="">{data.title}</div>
              <div className="">Price :{data.price}</div>            
            </div>
              <div className="addcardbtn" onClick={()=>addcardbtn(data)}>Add card</div>
              <div className="addcardhover" onClick={()=>product_details(data)}>Add card</div>
          </div>
          )
       })}
    </div>   
    

{product_details_hide_show ? 
<div className="product_details_tab">
  <div className="product_details_tab_header">
    Product Details
    <div className="product_details_tab_close" onClick={()=>setProduct_details_hide_show(!product_details_hide_show)}>X</div>
  </div>

    <div className="product_details_tab_body">
      <div className="" style={{color:'#00b8ff'}}><h2>{singpleproduct.title}</h2></div>      
      <img src={singpleproduct.imagePath} alt="Girl in a jacket" width="420" height="350"/>
      <div className="addcard_proudct_details" onClick={()=>product_details(singpleproduct)}>Add card</div>
    </div>
</div>
:""}



    </div>     
    </>
  );
}

export default Home;




