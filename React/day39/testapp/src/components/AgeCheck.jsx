function AgeCheck() {
  let age = 20;
  let message;

  if (age >= 18) {
    message = "Eligible to Vote";
  } else {
    message = "Not Eligible to Vote";
  }

  return (
    <div>
      <h2>Age Check</h2>
      <p>Age: {age}</p>
      <p>{message}</p>
    </div>
  );
}

export default AgeCheck;