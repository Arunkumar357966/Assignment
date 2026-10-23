import "./Style3.css";
import laptop from "./laptop.png";
import iphone from "./iphone.png";
import headphones from "./headphones.png";
import smartwatch from "./smartwatch.png";
import mouse from "./mouse.png";
import tablet from "./tablet.png";

const products = [
  {
    id: 1,
    name: "Laptop - MacBook Pro",
    price: 239900,
    rating: 4.9,
    image: laptop,
  },
  {
    id: 2,
    name: "Iphone",
    price: 164900,
    rating: 4.9,
    image: iphone,
  },
  {
    id: 3,
    name: "Headphones",
    price: 2999,
    rating: 4.5,
    image: headphones,
  },
  {
    id: 4,
    name: "Smartwatch",
    price: 2499,
    rating: 4.5,
    image: smartwatch,
  },
  {
    id: 5,
    name: "Mouse",
    price: 999,
    rating: 4.4,
    image: mouse,
  },
  {
    id: 6,
    name: "Tablet",
    price: 15999,
    rating: 4.6,
    image: tablet,
  },
];

function Products() {
  function addToCart(product) {
    alert(product.name + " added to cart!");
  }

  return (
    <div className="products-page">
      <h1>Our Products</h1>

      <div className="product-grid">
        {products.map((product) => (
          <div className="product-card" key={product.id}>
            <img
              src={product.image}
              alt={product.name}
              onError={(e) => {
                e.currentTarget.style.display = "none";
              }}
            />

            <h3>{product.name}</h3>
            <p>₹{product.price.toLocaleString("en-IN")}</p>
            <p>{product.rating}</p>

            <button onClick={() => addToCart(product)}>
              Add to Cart
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Products;
