import React from 'react';
import '../App.css';
import Header from './Header';
import { Link} from "react-router-dom";




function Home() {
 
return (
    <>
    <Header/>    
      <div className="home"><Link to="/product">Product</Link></div>
    </>
  );
}

export default Home;
