import React,{ useState, useEffect } from 'react';
import '../App.css';
import Header from './Header';
import { Link} from "react-router-dom";
const axios = require('axios');


function Addcardpage() {
	const [dataproduct, setDataproduct] = useState([]);


	useEffect(() => {
		setInterval(function(){ 
        var product_card = JSON.parse(localStorage.getItem("product_card") || "[]");
    	setDataproduct(product_card);
        },10);    	
	},[]);


const product_add_delete = (id)=> {	
	const product_card = JSON.parse(localStorage.getItem("product_card"));
	product_card.splice(id, 1);
	localStorage.setItem('product_card',JSON.stringify(product_card));
}

 

 function sum(...args) {
  var sum = 0;
  for (var arg of args) sum += arg;
  return sum;
}
 
return (
    <>
    <Header/>

    <div className="table_div">
		<table className="product_add_table">
						
			<tr>
				<td>Product Image</td>
				<td>Product Name</td>
				<td>Product Qnt</td>
				<td>Product Price</td>
				<td>Total</td>
				<td>Action</td>
			</tr>

		 {dataproduct.map((data, index)=> {
        return (
				<tr>
					<td><img src={data.product_img} alt="Girl in a jacket" width="80" height="40"/></td>
					<td>{data.product_name}</td>					
					<td>{data.qunt}</td>					
					<td>{data.price}</td>					
					<td>{data.qunt * data.price}</td>					
					<td><button onClick={()=>product_add_delete(index)}>Delete</button></td>
				</tr>
        	)
       	})}
		</table>

	</div>
    </>
  );
}

export default Addcardpage;
