import React,{ useState, useEffect } from 'react';
import '../App.css';
import { Link} from "react-router-dom";
import { BsBucketFill } from "react-icons/bs";
const axios = require('axios');



function Header(){    
    const [localcount, setLocalcount] = useState('');
    
    useEffect(() => {    
        axios.get('http://192.168.0.102:3001/orderpadingshow')
        .then(function (response) {          
          setLocalcount(response.data.length)            
        })
        .catch(function (error) {    
          console.log(error);
        })
    });



return (
    <div className="header">
        <Link to="/"><img src="http://bikroybaba.com/assets/logo/500x150.png"/></Link>        
        <div className="res">Registration</div>
        <div className="log">Login</div>
        
        <Link to="/cardpage">
            <div className="addcard">
            	<BsBucketFill style={{fontSize:"22px", color:"black"}}/>
            	<span className="addcard_count">{localcount}</span>
            </div>
        </Link>

    </div>
  );
}



export default Header;
