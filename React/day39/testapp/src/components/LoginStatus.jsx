function LoginStatus() {
  let isLoggedIn = true;

  return (
    <div>
      <h2>Login Status</h2>
      {isLoggedIn ? (
        <p>Welcome User!</p>
      ) : (
        <p>Please Login</p>
      )}
    </div>
  );
}

export default LoginStatus;