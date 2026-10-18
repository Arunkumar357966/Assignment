import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'

function App() {
  // 1
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [submittedUser, setSubmittedUser] = useState("");

  function handleSubmit(e) {
    e.preventDefault();
    setSubmittedUser(username);
  }

  // 2
  const [name, setName] = useState("");
  const [age, setAge] = useState("");
  const [department, setDepartment] = useState("");
  const [student, setStudent] = useState(null);

  function handleSubmit(e) {
    e.preventDefault();
    setStudent({ name, age, department });
  }

  // 3
   const [course, setCourse] = useState("");

  //  4
  const [accepted, setAccepted] = useState(false);
  const [message, setMessage] = useState("");

  function handleSubmit(e) {
    e.preventDefault();
    setMessage("Form submitted successfully!");
  }

  // 5
   const [form, setForm] = useState({
    name: "",
    email: "",
    password: "",
    gender: "",
    course: ""
  });

  const [submitted, setSubmitted] = useState(null);

  function handleChange(e) {
    setForm({
      ...form,
      [e.target.name]: e.target.value
    });
  }

  function handleSubmit(e) {
    e.preventDefault();
    setSubmitted({ ...form });
  }

  return (
    <>
    {/* 1 */}
       <h2>Login Form</h2>

      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Enter username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          required
        />
        <br /><br />

        <input
          type="password"
          placeholder="Enter password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <br /><br />

        <button type="submit">Login</button>
      </form>

      {submittedUser && <h3>Welcome, {submittedUser}!</h3>}

      {/* 2 */}
       <h2>Student Details</h2>

      <form onSubmit={handleSubmit}>
        <input
          placeholder="Student Name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          required
        />
        <br /><br />

        <input
          type="number"
          placeholder="Age"
          value={age}
          onChange={(e) => setAge(e.target.value)}
          required
        />
        <br /><br />

        <input
          placeholder="Department"
          value={department}
          onChange={(e) => setDepartment(e.target.value)}
          required
        />
        <br /><br />

        <button type="submit">Submit</button>
      </form>

      {student && (
        <div>
          <h3>Student Information</h3>
          <p>Name: {student.name}</p>
          <p>Age: {student.age}</p>
          <p>Department: {student.department}</p>
        </div>
      )}

      {/* 3 */}
      <h2>Course Selection</h2>

      <select
        value={course}
        onChange={(e) => setCourse(e.target.value)}
      >
        <option value="">Select a course</option>
        <option value="React">React</option>
        <option value=".NET">.NET</option>
        <option value="Java">Java</option>
      </select>

      {course && <h3>Selected Course: {course}</h3>}

      {/* 4 */}
            <h2>Terms and Conditions</h2>

      <form onSubmit={handleSubmit}>
        <label>
          <input
            type="checkbox"
            checked={accepted}
            onChange={(e) => {
              setAccepted(e.target.checked);
              setMessage("");
            }}
          />
          I accept the terms and conditions
        </label>

        <br /><br />

        <button type="submit" disabled={!accepted}>
          Submit
        </button>
      </form>

      {message && <p>{message}</p>}

      {/* 5 */}
       <h2>Student Registration</h2>

      <form onSubmit={handleSubmit}>
        <input
          name="name"
          placeholder="Full Name"
          value={form.name}
          onChange={handleChange}
          required
        />
        <br /><br />

        <input
          name="email"
          type="email"
          placeholder="Email"
          value={form.email}
          onChange={handleChange}
          required
        />
        <br /><br />

        <input
          name="password"
          type="password"
          placeholder="Password"
          value={form.password}
          onChange={handleChange}
          required
          minLength={6}
        />
        <br /><br />

        <label>Gender: </label>
        <select
          name="gender"
          value={form.gender}
          onChange={handleChange}
          required
        >
          <option value="">Select Gender</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
        <br /><br />

        <label>Course: </label>
        <select
          name="course"
          value={form.course}
          onChange={handleChange}
          required
        >
          <option value="">Select Course</option>
          <option value="React">React</option>
          <option value=".NET">.NET</option>
          <option value="Java">Java</option>
        </select>
        <br /><br />

        <button type="submit">Register</button>
      </form>

      {submitted && (
        <div>
          <h3>Registration Successful!</h3>
          <p>Name: {submitted.name}</p>
          <p>Email: {submitted.email}</p>
          <p>Gender: {submitted.gender}</p>
          <p>Course: {submitted.course}</p>
        </div>
      )}
    </>
  )
}

export default App;