import React,{ useState, useEffect } from 'react';
import '../App.css';
import { Link} from "react-router-dom";
import { BsBucketFill } from "react-icons/bs";
const axios = require('axios');



function Header(){    
    const [localcount, setLocalcount] = useState('');
    const [product_card_count, setProduct_card_count] = useState('');
    const [login_tab, setLogin_tab] = useState(false);
    
    useEffect(() => {    
        axios.get('http://192.168.0.102:3001/orderpadingshow')
        .then(function (response) {          
          setLocalcount(response.data.length)            
        })
        .catch(function (error) {    
          console.log(error);
        })
    });


    


    useEffect(() => {    
        setInterval(function(){ 
        var product_card = JSON.parse(localStorage.getItem("product_card") || "[]");
            setProduct_card_count(product_card.length)
        },10);        
    });


return (
    <>
    <div className="header">
        <Link to="/"><img src="http://bikroybaba.com/assets/logo/500x150.png"/></Link>        
        <div className="log" onClick={()=>setLogin_tab(!login_tab)}>Login</div>
        
        <Link to="/cardpage">
            <div className="addcard">
            	<BsBucketFill style={{fontSize:"22px", color:"black"}}/>
            	<span className="addcard_count">{product_card_count}</span>
            </div>
        </Link>


</div>
{login_tab ?
<div className="login_tap">
</div>
:""}
</>

  );
}



export default Header;
