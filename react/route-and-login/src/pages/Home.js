import React from "react"
import { Link } from "react-router-dom"

const Home = () => {
  return <div className="Home">
    Home
    <p>
      <Link to='/secret'>secret</Link>
    </p>
  </div>
}

export default Home
