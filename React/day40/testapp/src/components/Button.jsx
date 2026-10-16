function Button({ color, size, children }) {
  return (
    <button
      className={`btn ${size}`}
      style={{ backgroundColor: color }}
    >
      {children}
    </button>
  );
}

export default Button;
