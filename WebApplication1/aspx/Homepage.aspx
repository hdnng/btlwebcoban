<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WebApplication1.aspx.Homepag" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fixed Height Page</title>
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/js.js" defer></script>
    <script src="/js/search.js"></script>
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
        <!-- Nội dung chính -->
        <div class="welcome-section">
            <h1>Welcome to group5Gym</h1>
            <p>Your one-stop shop for all your protein needs.</p>
            <button class="shop-now-btn">Shop Now</button>
        </div>
        <div class="featured-products">
            <h2>Featured Products</h2>
            <div class="product-grid">
                <div class="product-item">
                    <img src="/img/logoproduct/deal1.png" alt="Product 1">
                    <h3>Whey Protein</h3>
                    <p>$29.99</p>
                    <button>Add to Cart</button>
                    <button>Buy Now</button>
                </div>
                <div class="product-item">
                    <img src="/img/logoproduct/water_bottle.png" alt="Product 2">
                    <h3>Vegan Protein</h3>
                    <p>$34.99</p>
                    <button>Add to Cart</button>
                    <button>Buy Now</button>
                </div>
                <div class="product-item">
                    <img src="/img/logoproduct/deal3.png" alt="Product 3">
                    <h3>Pre-Workout</h3>
                    <p>$24.99</p>
                    <button>Add to Cart</button>
                    <button>Buy Now</button>
                </div>
                <div class="product-item">
                    <img src="/img/logoproduct/hoodie.png" alt="Product 4">
                    <h3>Protein Bars</h3>
                    <p>$19.99</p>
                    <button>Add to Cart</button>
                    <button>Buy Now</button>
                </div>
                <div class="product-item">
                    <img src="/img/logoproduct/strap.png" alt="Product 4">
                    <h3>Protein Bars</h3>
                    <p>$19.99</p>
                    <button>Add to Cart</button>
                    <button>Buy Now</button>
                </div>
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
                    <li><a href="https://www.youtube.com" target="_blank">
                        <img src="/img/logo/youtube.png" alt="YouTube" /></a></li>
                    <li><a href="https://www.twitter.com" target="_blank">
                        <img src="/img/logo/twitter.png" alt="Twitter" /></a></li>
                </ul>
            </div>
        </div>
        <div class="lower-footer">
            <p>© 2024 group5Gym. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>

