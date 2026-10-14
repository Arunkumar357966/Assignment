import { useState } from 'react'
import heroImg from './assets/hero.png'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import './App.css'
import Student from './components/Student.jsx'
import LoginStatus from './components/LoginStatus.jsx'
import Result from './components/Result.jsx'
import Product from './components/Product.jsx'
import AgeCheck from './components/AgeCheck.jsx'

function App() {
  const [count, setCount] = useState(0)

  return (
     <div>
      <Student />
      <hr />

      <LoginStatus />
      <hr />

      <Result />
      <hr />

      <Product />
      <hr />

      <AgeCheck />
    </div>
  );
}

export default App
