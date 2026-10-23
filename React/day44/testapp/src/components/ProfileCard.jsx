import "./Style1.css";
import profileImage from "./Profile.png";

function ProfileCard() {
  return (
    <div className="profile-card">
      <img
        src={profileImage}
        alt="Profile"
        className="profile-img"
      />

      <h2>Arun Kumar</h2>
      <h4>Frontend Developer</h4>

      <p>
        I love creating websites and learning
        new technologies.
      </p>

      <button className="follow-btn">Follow</button>
    </div>
  );
}

export default ProfileCard;
