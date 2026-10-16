import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import "./App.css";
import ProfileCard from "./components/ProfileCard.jsx";
import Button from "./components/Button.jsx";
import Card from "./components/Card.jsx";

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div className="container">
      <h1>React Props and Children</h1>

      {/* Task 1: Profile Cards */}
      <h2>1. User Profile Cards</h2>

      <div className="row">
        <ProfileCard name="John" age={25} role="Developer">
          <p>Likes React and JavaScript.</p>
        </ProfileCard>

        <ProfileCard name="Priya" age={22} role="Designer">
          <p>Enjoys creating beautiful websites.</p>
        </ProfileCard>

        <ProfileCard name="Arun" age={21} role="Frontend Developer">
          <p>Learning React and web development.</p>
        </ProfileCard>
      </div>

      {/* Task 2: Reusable Buttons */}
      <h2>2. Reusable Buttons</h2>

      <div className="buttons">
        <Button color="blue" size="small">
          Save
        </Button>

        <Button color="green" size="medium">
          Login
        </Button>

        <Button color="red" size="large">
          Submit
        </Button>
      </div>

      {/* Task 3: Reusable Cards */}
      <h2>3. Reusable Cards</h2>

      <div className="row">
        <Card title="Product" footer="₹999">
          <p>This is a great product.</p>
        </Card>

        <Card title="About" footer="Learn More">
          <p>We build user-friendly websites.</p>
        </Card>

        <Card title="Contact" footer="Contact Us">
          <p>Email: example@gmail.com</p>
        </Card>
      </div>
    </div>
    </>
  )
}

export default App
