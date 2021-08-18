import React from 'react';
import '../App.css';
import { Link} from "react-router-dom";
import { BsBucketFill } from "react-icons/bs";








function Header() {
  
  
return (
    <div className="header">
        <Link to="/"><img src="http://bikroybaba.com/assets/logo/500x150.png"/></Link>
        <div className="home"> <Link to="/">Home</Link></div>
        <div className="res">Registration</div>
        <div className="log">Login</div>
        <div className="addcard">
        	<BsBucketFill style={{fontSize:"22px", color:"black"}}/>
        	<span className="addcard_count">5</span>
        </div>
    </div>
  );
}



export default Header;
