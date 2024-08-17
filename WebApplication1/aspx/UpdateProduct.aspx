<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="WebApplication1.aspx.UpdateProduct" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Update Product</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/update.css">
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
        <form id="form1" runat="server">
            <div>
                <h2>Update Product</h2>
                <asp:HiddenField ID="productIdField" runat="server" />
                <div>
                    <label for="productName">Product Name:</label>
                    <asp:TextBox ID="productName" runat="server" />
                </div>
                <div>
                    <label for="productPrice">Product Price:</label>
                    <asp:TextBox ID="productPrice" runat="server" />
                </div>
                <div>
                    <label for="productImageURL">Product Image URL:</label>
                    <asp:TextBox ID="productImageURL" runat="server" />
                </div>
                <div>
                    <label for="productDescription">Product Description:</label>
                    <asp:TextBox ID="productDescription" runat="server" TextMode="MultiLine" />
                </div>
                <div>
                    <label for="trangthai">trangthai:</label>
                    <asp:TextBox ID="trangthai" runat="server" TextMode="MultiLine" />
                </div>
                <div>
                    <asp:Button ID="updateButton" runat="server" Text="Update" OnClick="UpdateProductForm_Submit" />
                </div>
            </div>
        </form>
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
