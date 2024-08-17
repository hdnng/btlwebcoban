<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="WebApplication1.header" %>
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
                <li><a href="deal.html">Deals</a></li>
                <li><a href="aboutus.html">About Us</a></li>
                <li><a href="contact.html">Contact</a></li>
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