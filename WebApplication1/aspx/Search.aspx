<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebApplication1.aspx.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>group5Gym Layout</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/search.css">
    <script src="/js/js.js" defer></script>
    <script src="/js/search.js"></script>
    <script src="/js/filter.js"></script>
    <script>
        function applyPriceFilter() {
            var minPrice = parseFloat(document.getElementById('minPrice').value) || 0;
            var maxPrice = parseFloat(document.getElementById('maxPrice').value) || Infinity;

            document.querySelectorAll('.image').forEach(item => {
                var priceText = item.querySelector('p').textContent;
                var price = parseFloat(priceText.replace('$', ''));

                if (price >= minPrice && price <= maxPrice) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        }
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

    <main class="search-results">
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
        <div class="container">
            <% 
                var glstProduct = Application[WebApplication1.Global.product_list] as List<WebApplication1.model.Product>;
                List<WebApplication1.model.Product> tempProduct = new List<WebApplication1.model.Product>();
                string name = Request.QueryString["search"];
                int productsDisplayed = 0;

                if (name != null && !string.IsNullOrWhiteSpace(name))
                {
                    glstProduct = glstProduct.FindAll(p => p.ProductName.IndexOf(name, StringComparison.CurrentCultureIgnoreCase) >= 0);
                }

                tempProduct = glstProduct;

                if (tempProduct.Any())
                {
            %>
            <div class="label">
                <p>Search.&nbsp;</p>
                <span>Results for <%= WebApplication1.cs.StringExtensions.FirstCharToUpper(name) %></span>
            </div>
            <%
                foreach (var p in tempProduct)
                {
                    if (productsDisplayed % 4 == 0)
                    {
                        // Start a new row for every 4 products
            %><div class="row">
                <%
                    }
                %>
                <div class="image">
                    <img src="..<%=p.ImageURL%>" alt="" />
                    <div class="details">
                        <h2><%=p.ProductName%></h2>
                        <p>$<%=p.Price%></p>
                        <div class="more">
                            <a href="productdetail.aspx?type=<%=p.Category%>&productId=<%=p.Id%>&name=<%=p.ProductName%>" class="read-more">Details</a>
                        </div>
                    </div>
                </div>
                <%
                    productsDisplayed++;

                    if (productsDisplayed % 4 == 0)
                    {
                        // Close the row after displaying 4 products
                %>
            </div>
            <%
                    }
                }

                // Close the row if the last row is not complete
                if (productsDisplayed % 4 != 0)
                {
            %>
        </div>
        <%
                }
            }
            else
            {
        %>
        <div class="label">
            <span>Sorry, no matches were found.</span>
            <span>Try a new search or use our suggestions.</span>
        </div>
        <%
            }
        %>
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

