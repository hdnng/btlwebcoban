<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.aspx.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/js.js" defer></script>
    <script src="/js/search.js" defer></script>

    
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
                <a href="Login.aspx">Login</a>
                <% }
                    else
                    { %>
                <a href="Login.aspx">
                    <img src="/img/logo/user.png" alt="Account"></a> |
                <% } %>
                <a href="Cart.aspx">
                    <img src="/img/logo/basket.png" alt="Cart" /></a>
                <span class="cart-count">0</span>
            </div>
        </div>
    </header>

    <script>
        // JavaScript to toggle password visibility
        function togglePassword(inputId) {
            var passwordInput = document.getElementById(inputId);
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }
    </script>

    <%  bool isLogin = false;
        bool isSignUp = false;
        bool isAdmin = false;
        if (Session[WebApplication1.Global.user_name].Equals("admin"))
        {
            isAdmin = true;
            isLogin = false;
            isSignUp = false;
        }
        if (Session[WebApplication1.Global.user_name].Equals("guest"))
        {
            isAdmin = false;
            isLogin = true;
            isSignUp = false;
        }
        if (Session[WebApplication1.Global.user_name].Equals("guest") && Request.QueryString["do"] != null && Request.QueryString["do"].Equals("signup"))
        {
            isAdmin = false;
            isLogin = false;
            isSignUp = true;
        }

        if (isLogin)
        { %>
    <div class="row-body">
        <form id="form1" action="loginhandler.aspx" method="post">
            <div class="image">
                <div class="details" id="loginForm">
                    <h2>Login with group5gym</h2>

                    <input type="text" placeholder="Username" name="txtUsername" required="required" id="txtUsername" />
                    <div class="password-container">
                        <input type="password" placeholder="Password" name="txtPassword" required="required" id="txtPassword" style="width: 100%;" />
                        <!-- Show/Hide Password Button -->
                        <button type="button" class="show-password-btn" onclick="togglePassword('txtPassword')">
                            <img src="../src/PICS/eye.png" alt="Show Password" />
                        </button>
                    </div>
                   <button class="button" type="submit" id="loginButton">Login</button>
                    <p>
                        <a href="#">Forgot your email or password?</a>
                        
                    </p>
                    <p>Don't have an account? <a href="Login.aspx?do=signup">Create one now</a></p>
                </div>
            </div>
        </form>
        
    </div>
    <% } %>
    <%if (isSignUp)
        { %>
    <div class="row-body">
        <form id="form2" action="signuphandler.aspx" method="post">
            <div class="image" id="signupForm">
                <div class="details">
                    <h2>Let start create your account.</h2>

                    <input type="text" placeholder="Username" name="txtNewUsername" required="required" id="txtNewUsername" />
                    <div class="password-container">
                        <input type="password" placeholder="Password" name="txtNPassword" required="required" id="txtNPassword" style="width: 100%;" />
                        <button type="button" class="show-password-btn" onclick="togglePassword('txtNPassword')">
                            <img src="../src/PICS/eye.png" alt="Show Password" />
                        </button>
                    </div>

                    <div class="password-container">
                        <input type="password" placeholder="Confirm Password" name="txtConfirmNPassword" required="required" id="txtConfirmNPassword" style="width: 100%;" />
                        <button type="button" class="show-password-btn" onclick="togglePassword('txtConfirmNPassword')">
                            <img src="../src/PICS/eye.png" alt="Show Password" />
                        </button>
                    </div>
                    <p>
                        Welcome to group5gym.
                    </p>
                    <button class="button" type="submit">Sign up</button>
                    <p>Got your account? <a href="Login.aspx">Login now</a></p>
                </div>
            </div>
        </form>
    </div>
    <% }%>
    <%if (!isSignUp && !isLogin && !isAdmin)
        { %>
    <form id="form3" action="changepassword.aspx" method="post">
        <div class="row-body">
            <div class="image">
                <div class="details">
                    <h2>Hello <%= Session[WebApplication1.Global.user_name] %></h2>
                    <h2>Change Password</h2>

                    <div class="password-container">
                        <input type="password" placeholder="Old Password" name="txtOCPassword" required="required" id="txtOCPassword" style="width: 100%;" />
                        <button type="button" class="show-password-btn" onclick="togglePassword('txtOCPassword')">
                            <img src="../src/PICS/eye.png" alt="Show Password" />
                        </button>
                    </div>

                    <div class="password-container">
                        <input type="password" placeholder="Password" name="txtCPassword" required="required" id="txtCPassword" style="width: 100%;" />
                        <button type="button" class="show-password-btn" onclick="togglePassword('txtCPassword')">
                            <img src="../src/PICS/eye.png" alt="Show Password" />
                        </button>
                    </div>

                    <div class="password-container">
                        <input type="password" placeholder="Confirm Password" name="txtConfirmCPassword" required="required" id="txtConfirmCPassword" style="width: 100%;" />
                        <button type="button" class="show-password-btn" onclick="togglePassword('txtConfirmCPassword')">
                            <img src="../src/PICS/eye.png" alt="Show Password" />
                        </button>
                    </div>
                    <button class="button" type="submit">Change Password</button>
                    <a href='loginhandler.aspx?do=out'>Logout</a>
                </div>
            </div>
        </div>
    </form>
    <% }
        if (!isSignUp && !isLogin && isAdmin)
        {%>
    <form id="form4" action="producthandler.aspx" method="post">
        <div class="row-body">
            <div class="image">
                <div class="details">
                    <h2>Hello admin</h2>

                    <input type="text" placeholder="Product ID" name="txtNewproductID" required="required" />
                    <input type="text" placeholder="Product Name" name="txtNewproductName" required="required" />
                    <input type="text" placeholder="Description" name="txtNewproductDescription" required="required" />
                    <input type="text" placeholder="Path" name="txtNewproductPath" style="display: none;" />
                    <input type="text" placeholder="Type" name="txtNewproductType" required="required" />
                    <input type="text" placeholder="Price" name="txtNewproductPrice" required="required" />
                    <button class="button" type="submit">Create</button>
                    <a href='loginhandler.aspx?do=out'>Logout</a>
                    <a href="AllProducts.aspx">manage</a>
                </div>
            </div>
        </div>
    </form>
    <% }%>

    <footer>
        <div class="footer-content">
            <div class="social-media">
                <a href="#"><img src="/img/logo/facebook.png" alt="Facebook" /></a>
                <a href="#"><img src="/img/logo/twitter.png" alt="Twitter" /></a>
                <a href="#"><img src="/img/logo/instagram.png" alt="Instagram" /></a>
            </div>
            <p>&copy; 2024 group5Gym. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>