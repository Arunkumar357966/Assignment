import { useState } from "react";
import ProfileCard from "./components/ProfileCard.jsx";
import Navbar from "./components/Navbar.jsx";
import Products from "./components/Products.jsx";
import "./components/Style1.css";
import "./components/Style2.css";
import "./components/Style3.css";


function App() {
  return (
    <>
      <ProfileCard />
       <Navbar /> 
      <Products /> 
    </>
  );
}
export default App;