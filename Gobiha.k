<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Catalogue with Filters</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background: #f7f7f7;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
    }

    .filters {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-bottom: 30px;
      flex-wrap: wrap;
    }

    select, input[type="range"] {
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      background: white;
    }

    .catalogue {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 20px;
    }

    .product {
      background: white;
      border-radius: 8px;
      padding: 15px;
      text-align: center;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      transition: transform 0.2s;
    }

    .product:hover {
      transform: scale(1.05);
    }

    .product img {
      width: 100%;
      height: 150px;
      object-fit: cover;
      border-radius: 6px;
      margin-bottom: 10px;
    }

    .price {
      color: #007BFF;
      font-weight: bold;
    }

    #priceValue {
      font-weight: bold;
    }
  </style>
</head>
<body>
  <h1>Product Catalogue</h1>

  <div class="filters">
    <select id="categoryFilter">
      <option value="all">All Categories</option>
      <option value="electronics">Electronics</option>
      <option value="fashion">Fashion</option>
      <option value="home">Home</option>
    </select>

    <label>
      Max Price: $<span id="priceValue">500</span>
      <input type="range" id="priceFilter" min="0" max="500" value="500">
    </label>
  </div>

  <div id="catalogue" class="catalogue"></div>

  <script>
    const products = [
      { id: 1, name: "Smartphone", price: 300, category: "electronics", image: "https://via.placeholder.com/200x150?text=Smartphone" },
      { id: 2, name: "Laptop", price: 450, category: "electronics", image: "https://via.placeholder.com/200x150?text=Laptop" },
      { id: 3, name: "T-Shirt", price: 25, category: "fashion", image: "https://via.placeholder.com/200x150?text=T-Shirt" },
      { id: 4, name: "Sneakers", price: 80, category: "fashion", image: "https://via.placeholder.com/200x150?text=Sneakers" },
      { id: 5, name: "Blender", price: 60, category: "home", image: "https://via.placeholder.com/200x150?text=Blender" },
      { id: 6, name: "Coffee Maker", price: 120, category: "home", image: "https://via.placeholder.com/200x150?text=Coffee+Maker" },
    ];

    const catalogue = document.getElementById("catalogue");
    const categoryFilter = document.getElementById("categoryFilter");
    const priceFilter = document.getElementById("priceFilter");
    const priceValue = document.getElementById("priceValue");

    function renderProducts(list) {
      catalogue.innerHTML = "";
      if (list.length === 0) {
        catalogue.innerHTML = "<p>No products found.</p>";
        return;
      }
      list.forEach(product => {
        const div = document.createElement("div");
        div.classList.add("product");
        div.innerHTML = `
          <img src="${product.image}" alt="${product.name}">
          <h3>${product.name}</h3>
          <p class="price">$${product.price}</p>
          <p>${product.category}</p>
        `;
        catalogue.appendChild(div);
      });
    }

    function applyFilters() {
      const category = categoryFilter.value;
      const maxPrice = parseInt(priceFilter.value);

      const filtered = products.filter(p =>
        (category === "all" || p.category === category) &&
        p.price <= maxPrice
      );

      renderProducts(filtered);
    }

    // Event listeners
    categoryFilter.addEventListener("change", applyFilters);
    priceFilter.addEventListener("input", () => {
      priceValue.textContent = priceFilter.value;
      applyFilters();
    });

    // Initial render
    renderProducts(products);
  </script>
</body>
</html>
