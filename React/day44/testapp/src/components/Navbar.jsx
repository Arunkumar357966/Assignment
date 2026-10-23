import "./Style2.css";
function Navbar() {
  return (
    <nav className="navbar">
      <h2 className="logo">STORE</h2>

      <div className="nav-links">
        <a href="#home">Home</a>
        <a href="#about">About</a>
        <a href="#services">Services</a>
        <a href="#contact">Contact</a>
        <button className="login-btn">Login</button>
      </div>
    </nav>
  );
}

export default Navbar;
