import {  BrowserRouter as Router,  Switch,  Route,  Link} from "react-router-dom";
import React from 'react';
import './App.css';
import Home from './component/Home';
import Productspage from './component/Productspage';



function App() {
     
  
return (
    <>
    <Router>    	
		<Route path="/" exact component={Home}/>
		<Route path="/product" component={Productspage}/>    	
    </Router>   
    </>
  );
}

export default App;
