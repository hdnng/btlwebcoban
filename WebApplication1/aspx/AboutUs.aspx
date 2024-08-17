<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="WebApplication1.aspx.AboutUs" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accessory</title>

    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/aboutus.css">
    <script src="/js/js.js" defer></script>
    <script src="/js/search.js"></script>
    <script src="/js/filter.js"></script>
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
        <section class="about-me">
            <div class="container">
                <p>
                    <h2>About Us</h2>
                </p>
                <br>
                <br>
                <div class="profile">
                    <img src="/img/avt/cbum.jpg" alt="HD Picture">
                    <div class="bio">
                        <h3>HD</h3>
                        <p>
                            À propos de moi
                            Je m'appelle HD, et je suis passionné(e) par le fitness et la musculation. Depuis plusieurs
                            années, je m'efforce de mener une vie saine et active en m'entraînant régulièrement à la
                            salle de sport. Mon objectif principal est de partager mes connaissances et mon enthousiasme
                            pour le fitness avec les autres.
                            <br>
                            <br>
                            En tant que passionné(e) de gym, j'ai acquis une solide compréhension des techniques
                            d'entraînement, de la nutrition sportive et de l'importance de la récupération. J'aime créer
                            des programmes d'entraînement personnalisés qui aident les gens à atteindre leurs objectifs
                            de forme physique, qu'il s'agisse de perdre du poids, de gagner en masse musculaire ou
                            d'améliorer leur condition physique générale.
                            <br>
                            <br>
                            La gym est bien plus qu'une simple activité physique pour moi; c'est un mode de vie. Je suis
                            convaincu(e) que l'engagement envers une routine de fitness régulière peut transformer non
                            seulement le corps, mais aussi l'esprit, en apportant discipline, confiance en soi et
                            bien-être général.
                            <br>
                            <br>
                            Je serais ravi(e) de vous accompagner dans votre parcours de remise en forme et de vous
                            aider à atteindre vos objectifs. Ensemble, nous pouvons repousser nos limites et découvrir
                            le meilleur de nous-mêmes.
                            <br>
                            <br>
                        </p>
                    </div>

                    <img src="/img/avt/davidlaid.jpg" alt="Anh Duc Picture">
                    <div class="bio">
                        <h3>Anh Duc</h3>
                        <p>
                            À propos de nous
                            Nous sommes HD et Anh Duc, deux passionnés de fitness et de musculation. Depuis plusieurs
                            années, nous nous efforçons de mener une vie saine et active en nous entraînant
                            régulièrement à la salle de sport. Notre objectif principal est de partager nos
                            connaissances et notre enthousiasme pour le fitness avec les autres.
                            <br>
                            <br>
                            En tant que passionnés de gym, nous avons acquis une solide compréhension des techniques
                            d'entraînement, de la nutrition sportive et de l'importance de la récupération. Nous aimons
                            créer des programmes d'entraînement personnalisés qui aident les gens à atteindre leurs
                            objectifs de forme physique, qu'il s'agisse de perdre du poids, de gagner en masse
                            musculaire ou d'améliorer leur condition physique générale.
                            <br>
                            <br>
                            Pour nous, la gym est bien plus qu'une simple activité physique; c'est un mode de vie. Nous
                            sommes convaincus que l'engagement envers une routine de fitness régulière peut transformer
                            non seulement le corps, mais aussi l'esprit, en apportant discipline, confiance en soi et
                            bien-être général.
                            <br>
                            <br>
                            Nous serions ravis de vous accompagner dans votre parcours de remise en forme et de vous
                            aider à atteindre vos objectifs. Ensemble, nous pouvons repousser nos limites et découvrir
                            le meilleur de nous-mêmes.
                            <br>
                            <br>
                        </p>
                    </div>
                </div>

                <br>
                <br>

                <div class="profile">
                    <img src="/img/avt/jeff.jpg" alt="Tung Duong Picture">
                    <div class="bio">
                        <h3>Tung Duong</h3>
                        <p>
                            À propos de nous
                            Nous sommes HD, Anh Duc, Trong Ngo, et Tung Duong, quatre passionnés de fitness et de
                            musculation. Depuis plusieurs années, nous nous efforçons de mener une vie saine et active
                            en nous entraînant régulièrement à la salle de sport. Notre objectif principal est de
                            partager nos connaissances et notre enthousiasme pour le fitness avec les autres.
                            <br>
                            <br>
                            En tant que passionnés de gym, nous avons acquis une solide compréhension des techniques
                            d'entraînement, de la nutrition sportive et de l'importance de la récupération. Nous aimons
                            créer des programmes d'entraînement personnalisés qui aident les gens à atteindre leurs
                            objectifs de forme physique, qu'il s'agisse de perdre du poids, de gagner en masse
                            musculaire ou d'améliorer leur condition physique générale.
                            <br>
                            <br>
                            Pour nous, la gym est bien plus qu'une simple activité physique; c'est un mode de vie. Nous
                            sommes convaincus que l'engagement envers une routine de fitness régulière peut transformer
                            non seulement le corps, mais aussi l'esprit, en apportant discipline, confiance en soi et
                            bien-être général.
                            <br>
                            <br>
                            Nous serions ravis de vous accompagner dans votre parcours de remise en forme et de vous
                            aider à atteindre vos objectifs. Ensemble, nous pouvons repousser nos limites et découvrir
                            le meilleur de nous-mêmes.
                            <br>
                            <br>
                        </p>
                    </div>

                    <img src="/img/avt/trong.jpg" alt="Trong Ngo Picture">
                    <div class="bio">
                        <h3>Trong Ngo</h3>
                        <p>
                            À propos de nous
                            Nous sommes HD, Anh Duc et Trong Ngo, trois passionnés de fitness et de musculation. Depuis
                            plusieurs années, nous nous efforçons de mener une vie saine et active en nous entraînant
                            régulièrement à la salle de sport. Notre objectif principal est de partager nos
                            connaissances et notre enthousiasme pour le fitness avec les autres.
                            <br>
                            <br>
                            En tant que passionnés de gym, nous avons acquis une solide compréhension des techniques
                            d'entraînement, de la nutrition sportive et de l'importance de la récupération. Nous aimons
                            créer des programmes d'entraînement personnalisés qui aident les gens à atteindre leurs
                            objectifs de forme physique, qu'il s'agisse de perdre du poids, de gagner en masse
                            musculaire ou d'améliorer leur condition physique générale.
                            <br>
                            <br>
                            Pour nous, la gym est bien plus qu'une simple activité physique; c'est un mode de vie. Nous
                            sommes convaincus que l'engagement envers une routine de fitness régulière peut transformer
                            non seulement le corps, mais aussi l'esprit, en apportant discipline, confiance en soi et
                            bien-être général.
                            <br>
                            <br>
                            Nous serions ravis de vous accompagner dans votre parcours de remise en forme et de vous
                            aider à atteindre vos objectifs. Ensemble, nous pouvons repousser nos limites et découvrir
                            le meilleur de nous-mêmes.
                            <br>
                            <br>
                        </p>
                    </div>
                </div>
            </div>
        </section>

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

