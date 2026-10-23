function Products() {
  const products = ["Laptop", "Mobile", "Headphones"];

  return (
    <div>
      <h1>Product List</h1>
      {products.map((product) => (
        <p key={product}>{product}</p>
      ))}
    </div>
  );
}
export default Products;