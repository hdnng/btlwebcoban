<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplements.aspx.cs" Inherits="WebApplication1.aspx.Supplements" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplements</title>
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/js.js" defer></script>
    <script src="/js/search.js"></script>
    <script src="/js/filter.js"></script>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            document.querySelectorAll('form').forEach(form => {
                form.addEventListener('submit', function (event) {
                    event.preventDefault(); // Ngăn form khỏi submit mặc định

                    var formData = new FormData(this);
                    console.log('Submitting form:', Array.from(formData.entries())); // Log form data

                    fetch(this.action, {
                        method: 'POST',
                        body: formData
                    }).then(response => response.text()).then(data => {
                        // Update cart count with the returned count
                        document.querySelector('.cart-count').textContent = data.trim();
                    }).catch(error => console.error('Error:', error));
                });
            });
        });
    </script>
</head>

<body>
    <header>
        <div class="top-bar">
            <p>Free Shipping on orders over $50</p>
        </div>
        <div class="nav-bar">
            <div class="logo"><a href="Homepage.aspx">group5Gym</a></div>
            <nav>
                <ul>
                    <li><a href="Homepage.aspx">Home</a></li>
                    <li class="dropdown">Products
            <div class="hidden-menu">
                <ul>

                    <li><a href="Supplements.aspx">Supplements</a></li>
                    <li><a href="Accessory.aspx">Accessories</a></li>
                    <li><a href="Clothes.aspx">Clothing</a></li>
                </ul>
            </div>
                    </li>
                    <li><a href="Deal.aspx">Deals</a></li>
                    <li><a href="AboutUs.aspx">About Us</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>
                </ul>
            </nav>
            <div class="account-actions">



                <div class="search-container">
                    <img id="search-icon" src="/img/logo/magnifying-glass.png" alt="search">
                    <input type="text" id="searchInput" placeholder="Enter your search" />
                </div>


                <% if (Session[WebApplication1.Global.user_name].Equals("guest"))
                    { %>
                <a href="Login.aspx">Login
                </a>
                <% }
                    else
                    { %>
                <a href="Login.aspx">
                    <img src="/img/logo/user.png" alt="Account"></a> |
    <% }
    %>



                <a href="Cart.aspx">
                    <img src="/img/logo/basket.png" alt="Cart" /></a>
                <span class="cart-count">0</span>
            </div>
        </div>
    </header>
    <main>
        <div class="filter-section">
            <h3>Filter by Price</h3>
            <form id="priceFilterForm">
                <label for="minPrice">Min Price:</label>
                <input type="number" id="minPrice" name="minPrice" step="0.01" min="0" />

                <label for="maxPrice">Max Price:</label>
                <input type="number" id="maxPrice" name="maxPrice" step="0.01" min="0" />

                <button type="button" onclick="applyPriceFilter()">Apply Filter</button>
            </form>
        </div>
        <div class="featured-products">
            <h2>Supplements</h2>
            <div class="product-grid" id="Supplement" runat="server">
                <!-- Sản phẩm sẽ được hiển thị tại đây -->
            </div>
        </div>
    </main>
    <footer>
        <div class="container">
            <div>
                <h4>List of Shops</h4>
                <ul>
                    <li>
                        <img src="/img/logo/gps.png" alt="location">HCM</li>
                    <li>
                        <img src="/img/logo/gps.png" alt="location">HN</li>
                </ul>
            </div>
            <div>
                <h4>Return Policy</h4>
                <ul>
                    <li><a href="datapolicy.html">Data Policy</a></li>
                    <li><a href="privacypolicy.html">Privacy Policy</a></li>
                    <li><a href="returnpolicy.html">Return Policy</a></li>
                </ul>
            </div>
            <div>
                <h4>About Us</h4>
                <ul>
                    <li><a href="ourstory.html">Our Story</a></li>
                    <li><a href="careers.html">Careers</a></li>
                    <li><a href="Sustainability.html">Sustainability</a></li>
                </ul>
            </div>
            <div>
                <h4>Follow Us</h4>
                <ul class="social-links">
                    <li><a href="https://www.facebook.com" target="_blank">
                        <img src="/img/logo/facebook.png" alt="Facebook" /></a></li>
                    <li><a href="https://www.instagram.com" target="_blank">
                        <img src="/img/logo/instagram.png" alt="Instagram" /></a></li>
                    <li><a href="https://twitter.com" target="_blank">
                        <img src="/img/logo/twitter.png" alt="Twitter" /></a></li>
                </ul>
            </div>
        </div>
    </footer>
</body>

</html>
