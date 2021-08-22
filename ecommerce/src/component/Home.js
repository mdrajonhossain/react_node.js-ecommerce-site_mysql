import React,{ useState, useEffect } from 'react';
import '../App.css';
import Header from './Header';
import { Link} from "react-router-dom";
import Dataview from './Dataview';
const axios = require('axios');




function Home() {
	    const [dataf, setDataf] = useState([]);

useEffect(() => {    
    axios.get('http://192.168.0.102:3001/apibad')
    .then(function (response) {          
      setDataf(response.data);
    })
    .catch(function (error) {    
      console.log(error);
    })
},[100]);



 
return (
    <>
    <Header/>              
    <div className="product_body">
      
      <div className="sitebar"></div>


   
      	<div className="home">
      		{dataf.map((data)=> {
        return (
          <div className="c_card">
            <img src={data.imagePath} alt="Girl in a jacket"/>
            <div className="">{data.title}</div>
            <div className="">Price :{data.price}</div>            
          </div>
          )
       })}
      	</div>
     






     </div>
    </>
  );
}

export default Home;

