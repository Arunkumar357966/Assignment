function Product() {
  let isAvailable = false;

  return (
    <div>
      <h2>Product Availability</h2>
      <p>
        {isAvailable
          ? "Product In Stock"
          : "Out of Stock"}
      </p>
    </div>
  );
}

export default Product;