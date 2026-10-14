function Result() {
  let mark = 75;
  let result;

  if (mark >= 35) {
    result = "Pass";
  } else {
    result = "Fail";
  }

  return (
    <div>
      <h2>Exam Result</h2>
      <p>Mark: {mark}</p>
      <p>{result}</p>
    </div>
  );
}

export default Result;