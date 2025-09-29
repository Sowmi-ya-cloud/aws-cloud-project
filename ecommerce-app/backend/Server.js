const express = require("express");
const app = express();
const fs = require("fs");
app.use(express.json());
let products = JSON.parse(fs.readFileSync("products.json"));
// Fetch products
app.get("/products", (req, res) => {
 res.json(products);
});
// Add to cart
app.post("/cart", (req, res) => {
 const { productId } = req.body;
 res.json({ message: `Product ${productId} added to cart` });
});
// Place order
app.post("/order", (req, res) => {
 res.json({ message: "Order placed successfully!" });
});
app.listen(3000, () => console.log("Backend running on port 3000"));
