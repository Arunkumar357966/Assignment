import { BrowserRouter,Routes,Route,Link }
from "react-router-dom";

import Home from "./components/Home";
import About from "./components/About";
import Contact from "./components/Contact";
import Products from "./components/Products";
import Login from "./components/Login";
import Dashboard from "./components/Dashboard";

function App() {
  return (
    <BrowserRouter>
      <nav>
        <Link to="/">Home</Link> {" | "}
        <Link to="/about">About</Link> {" | "}
        <Link to="/contact">Contact</Link> {" | "}
        <Link to="/products">Products</Link> {" | "}
        <Link to="/login">Login</Link> {" | "}
        <Link to="/dashboard">Dashboard</Link>
      </nav>

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/products" element={<Products />} />
        <Route path="/login" element={<Login />} />
        <Route path="/dashboard" element={<Dashboard />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
