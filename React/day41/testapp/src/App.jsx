import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'


function App() {
  // 1
  const [name, setName] = useState("");
  const [result, setResult] = useState("");

  function handleSubmit(e) {
    e.preventDefault();
    setResult(name);
  }

  // 2
  const [city, setCity] = useState("");
  const [output, setOutput] = useState("");

  // 3
   function showNumber(num) {
    alert("You selected: " + num);
  }

  // 4
   const [message, setMessage] = useState("");

  function handleClick() {
    setMessage("Button clicked!");
  }

  function handleDoubleClick() {
    setMessage("Button double-clicked!");
  }

  function handleMouseOver() {
    setMessage("Mouse is over the button!");
  }

  // 5
  const [email, setEmail] = useState("");
  const [output1, setOutput1] = useState("");

  // 6
   const [empid, setEmpid] = useState("");
  const [empname, setEmpname] = useState("");
  const [salary, setSalary] = useState("");
  const [desg, setDesg] = useState("");
  const [deptno, setDeptno] = useState("");
  const [employee, setEmployee] = useState(null);

  function handleSubmit(e) {
    e.preventDefault();

    setEmployee({
      empid,
      empname,
      salary,
      desg,
      deptno
    });
  }

  // 7
    const [product, setProduct] = useState({
    id: 101,
    name: "Laptop",
    price: 50000,
    category: "Electronics"
  });

  function updateProduct() {
    setProduct({
      ...product,
      name: "Mobile",
      price: 25000,
      category: "Smartphones"
    });
  }

  // 8
   const [customers, setCustomers] = useState([
    "Arun",
    "Kumar",
    "Rahul"
  ]);

  const [name1, setName1] = useState("");

  function addCustomer() {
    if (name.trim() === "") return;

    setCustomers([...customers, name.trim()]);
    setName("");
  }

  function deleteCustomer(index) {
    setCustomers(
      customers.filter((_, i) => i !== index)
    );
  }
  return (
    <div>
      {/* 1 */}
      <h2>User Registration</h2>

      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Enter your name"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
        <button type="submit">Submit</button>
      </form>

      <h3>Your Name: {result}</h3>

      {/* 2 */}
       <h2>City Details</h2>

      <input
        type="text"
        placeholder="Enter your city"
        onChange={(e) => setCity(e.target.value)}
      />

      <button onClick={() => setOutput(city)}>
        Show City
      </button>

      <h3>City: {output}</h3>

      {/* 3 */}
       <h2>Passing Value to an Event</h2>

      <button onClick={() => showNumber(10)}>
        Number 10
      </button>

      <button onClick={() => showNumber(20)}>
        Number 20
      </button>

      <button onClick={() => showNumber(30)}>
        Number 30
      </button>

      {/* 4 */}
       <h2>Multiple Events</h2>

      <button onClick={handleClick}>
        Click
      </button>

      <button onDoubleClick={handleDoubleClick}>
        Double Click
      </button>

      <button onMouseOver={handleMouseOver}>
        Mouse Over
      </button>

      <h3>{message}</h3>

      {/* 5 */}
        <h2>Email Details</h2>

      <input
        type="email"
        placeholder="Enter your email"
        onChange={(e) => setEmail(e.target.value)}
        onBlur={() => setOutput1(email)}
      />

      <h3>Email: {output1}</h3>

      {/* 6 */}
       <h2>Employee Details</h2>

      <form onSubmit={handleSubmit}>
        <input
          placeholder="Employee ID"
          value={empid}
          onChange={(e) => setEmpid(e.target.value)}
          required
        />
        <br /><br />

        <input
          placeholder="Employee Name"
          value={empname}
          onChange={(e) => setEmpname(e.target.value)}
          required
        />
        <br /><br />

        <input
          type="number"
          placeholder="Salary"
          value={salary}
          onChange={(e) => setSalary(e.target.value)}
          required
        />
        <br /><br />

        <input
          placeholder="Designation"
          value={desg}
          onChange={(e) => setDesg(e.target.value)}
          required
        />
        <br /><br />

        <input
          placeholder="Department Number"
          value={deptno}
          onChange={(e) => setDeptno(e.target.value)}
          required
        />
        <br /><br />

        <button type="submit">Print Details</button>
      </form>

      {employee && (
        <div>
          <h3>Employee Information</h3>
          <p>Employee ID: {employee.empid}</p>
          <p>Name: {employee.empname}</p>
          <p>Salary: ₹{employee.salary}</p>
          <p>Designation: {employee.desg}</p>
          <p>Department Number: {employee.deptno}</p>
        </div>
      )}

      {/* 7 */}
            <h2>Product Information</h2>

      <p>Product ID: {product.id}</p>
      <p>Name: {product.name}</p>
      <p>Price: ₹{product.price}</p>
      <p>Category: {product.category}</p>

      <button onClick={updateProduct}>
        Update Product
      </button>

      {/* 8 */}
       <h2>Customer Management</h2>

      <input
        type="text"
        placeholder="Enter customer name"
        value={name}
        onChange={(e) => setName1(e.target.value)}
      />

      <button onClick={addCustomer}>
        Add Customer
      </button>

      <h3>Customer List</h3>

      {customers.length === 0 ? (
        <p>No customers available.</p>
      ) : (
        <ul>
          {customers.map((customer, index) => (
            <li key={index}>
              {customer}{" "}
              <button onClick={() => deleteCustomer(index)}>
                Delete
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default App;
