import React,{ useState, useEffect } from 'react';
import '../App.css';
import Header from './Header';
import { Link} from "react-router-dom";
const axios = require('axios');




function Addcardpage() {
	const [localdata, setLocadata] = useState([]);
	


 

useEffect(() => {    
    axios.get('http://192.168.0.102:3001/orderpadingshow')
    .then(function (response) {          
      setLocadata(response.data);
    	console.log(response.data.length)
    	setInterval(function(){localStorage.setItem("addcardcount", JSON.stringify(response.data.length))},100);
    })
    .catch(function (error) {    
      console.log(error);
    })
});




const addproductdelet = (e)=> {
	alert(e)
}

 
return (
    <>
    <Header/>    
      <table className="addtable">
	      <tr>
	      	<td>Product</td>
	      	<td>Product Name</td>
	      	<td>Quantity</td>
	      	<td>Price</td>
	      	<td>Total</td>
	      	<td>Action</td>
	      </tr>

	      {
	      	localdata && localdata.map((data, index)=> {
		        return (
			      <tr>
			      	<td><img src={data.product_img} alt="Girl in a jacket" style={{width:'25px'}}/></td>
			      	<td>{data.product_name}</td>
			      	<td>{data.quantity}</td>			      	
			      	<td>{data.price}</td>			      	
			      	<td>{data.quantity * data.price}</td>
			      	<td><button className="addproductbtn" onClick={()=>addproductdelet(index)}>Delete</button></td>
			      </tr>
		        )
       		})

	  	}





      </table>
    </>
  );
}

export default Addcardpage;
