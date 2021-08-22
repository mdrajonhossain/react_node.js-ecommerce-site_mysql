import {  BrowserRouter as Router,  Switch,  Route,  Link} from "react-router-dom";
import React from 'react';
import './App.css';
import Home from './component/Home';
import Productspage from './component/Productspage';
import Addcardpage from './component/Addcardpage';



function App() {
     
  
return (
    <>
    <Router>    	
		<Route path="/" exact component={Home}/>
		<Route path="/product" component={Productspage}/>    	
		<Route path="/cardpage" component={Addcardpage}/>    	
    </Router>   
    </>
  );
}

export default App;
