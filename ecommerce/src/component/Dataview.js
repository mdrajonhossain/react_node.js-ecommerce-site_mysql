import React,{ useState, useEffect } from 'react';
import '../App.css';
const axios = require('axios');



function Dataview() {
    const [dataf, setDataf] = useState([]);

useEffect(() => {    
    axios.get('http://192.168.0.102:3001/apibad')
    .then(function (response) {    
      console.log(response.data);
      setDataf(response.data);
    })
    .catch(function (error) {    
      console.log(error);
    })
},[100]);


const handleClick = (e)=> {
  alert(e.product_name);
}

  
return (
    <div className="textbody">
       {dataf.map((data)=> {
        return (
          <div className="card">
            <img src={data.product_img} alt="Girl in a jacket" onClick={()=>handleClick(data)}/>
            <div className="">{data.product_name}</div>
            <div className="">Price :{data.product_price}</div>            
          </div>
          )
       })}
    </div>
  );
}

export default Dataview;
