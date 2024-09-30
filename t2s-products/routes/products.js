const express = require('express');
const router = express.Router();
const products = require('../data/products.json'); // Load the product data from JSON

// Homepage Route (Dynamic Product Listing)
router.get('/', (req, res) => {
  res.render('index', { products });
});

// Shopping Cart Route (for simplicity, no actual cart logic yet)
router.get('/cart', (req, res) => {
  res.render('cart');
});

module.exports = router;