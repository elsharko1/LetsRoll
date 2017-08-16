<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--<html>
<!--<head>
    <title>Profile</title>
</head>
<body>
<p>
<form action="editprofile" method="POST">
    Full Name: <input name="fullName" value="${user.fullName}"/> <br>
    Email: <input name="email" value="${user.email}"/> <br>
    Location: <input name="location" value="${user.location}"/> <br>
    Skills: <select multiple name="skills">
    <option value="Disabled">Disabled</option>
    <option value="Children">Children</option>
    <option value="People">People</option>
    <option value="Animal">Animal</option>
    <option value="Administrative">Adminstrative</option>
    <option value="Technical">Technical</option>
    <option value="Other">Mystery</option><br>
    <input type="submit" value="Submit Profile Changes"/>
</form>
<br>
</select>
</p>
<a href="/homepage">Home page</a>
</body>
</html> -->





<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Basic page information -->
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Clas-design">
    <title>Log In Page</title>

    <!-- Fav Icon -->
    <link rel="shortcut icon" href="webresources/assets/images/favicon.ico">

    <!-- Custom Google fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600,600italic,700,700italic,300italic,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>

    <!-- Bootstrap CSS Style -->
    <link rel="stylesheet" href="webresources/assets/css/bootstrap/bootstrap.min.css">

    <!-- Template CSS Style -->
    <link rel="stylesheet" href="webresources/assets/css/style.css">

    <!-- Animate CSS  -->
    <link rel="stylesheet" href="webresources/assets/css/animate.css">

    <!-- FontAwesome Icons  -->
    <link rel="stylesheet" href="webresources/assets/fonts/font-awesome-4.3/css/font-awesome.min.css">

    <!-- Et-line Icons  -->
    <link rel="stylesheet" href="webresources/assets/fonts/et-line-font/style.css">

    <!-- BXslider CSS  -->
    <link rel="stylesheet" href="webresources/assets/css/bxslider/jquery.bxslider.css">

    <!-- Owl carousel -->
    <link rel="stylesheet" href="webresources/assets/css/owl.carousel/owl.carousel.css">
    <link rel="stylesheet" href="webresources/assets/css/owl.carousel/owl.theme.css">
    <link rel="stylesheet" href="webresources/assets/css/owl.carousel/owl.transitions.css">

    <!-- Magnific-Popup CSS Style -->
    <link rel="stylesheet" href="webresources/assets/css/magnific-popup/magnific-popup.css">

    <!-- YTplayer CSS Style -->
    <link rel="stylesheet" href="webresources/assets/css/YTPlayer/jquery.mb.YTPlayer.min.css">

    <!-- Superslides CSS Style -->
    <link rel="stylesheet" href="webresources/assets/css/superslides.css">

    <!-- Morphext CSS Style -->
    <link rel="stylesheet" href="webresources/assets/css/morphext.css">

    <!-- Flexslider CSS Style -->
    <link rel="stylesheet" href="webresources/assets/css/flexslider.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 Ements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<!-- Preload the Whole Page -->
<div id="preloader">
    <div id="loading-animation">&nbsp;</div>
</div>

<!-- Navbar
================================================== -->
<header class="clearfix">
    <!-- Static navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="header-top-line">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-7">
                        <span><i class="fa fa-phone"></i> +102655874624</span>
                        <span><i class="fa fa-envelope"></i> contact@gmail.com</span>
                    </div>
                    <div class="col-md-6 col-sm-5">
                        <div class="right-align">
                            <ul>
                                <li><a href="#" class="shopping-button"><i class="fa fa-shopping-cart"></i> Your Cart</a>
                                    <div class="shoping-drop">
                                        <div class="items-area">
                                            <p>Recently added items</p>
                                            <ul>
                                                <li>
                                                    <img src="webresources/assets/images/shop/products/5.jpg" alt="">
                                                    <div class="items-cont">
                                                        <h2>Ligt Summer Dress<a href="#">x</a><a href="#"><i class="fa fa-pencil"></i></a></h2>
                                                        <p>1X - <span>390$</span></p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="total-price">
                                            <p>Total $1290</p>
                                        </div>
                                        <div class="continue-shop">
                                            <a href="shop-cart.html">View Cart</a>
                                            <a href="shop-checkout.html">Checkout</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img alt="" src="images/logo.png"></a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="megadrop"><a class="active" href="index.html">Home</a>
                        <div class="megadrop-down">
                            <div class="container">
                                <div class="dropdown">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="index.html">Home 1 - Default</a></li>
                                                <li><a href="index-2.html">Home 2</a></li>
                                                <li><a href="index-3.html">Home 3</a></li>
                                                <li><a href="index-4.html">Home 4</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="index-5.html">Home 5</a></li>
                                                <li><a href="index-6.html">Home 6</a></li>
                                                <li><a href="index-7.html">Home 7</a></li>
                                                <li><a href="index-8.html">Home 8</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="index-portfolio.html">Home Portfolio</a></li>
                                                <li><a href="index-landing.html">Landing page</a></li>
                                                <li><a href="index-app.html">App Landing Page</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul class="last-child">
                                                <li><a href="index-one-page.html">One page 1</a></li>
                                                <li><a href="index-one-page2.html">One page 2</a></li>
                                                <li><a href="index-one-page3.html">One page 3</a></li>
                                                <li><a href="index-one-page4.html">One page 4</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="megadrop"><a href="index.html">Pages</a>
                        <div class="megadrop-down">
                            <div class="container">
                                <div class="dropdown">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="pages-about.html">About us 1</a></li>
                                                <li><a href="pages-about-2.html">About us 2</a></li>
                                                <li><a href="pages-about-3.html">About us 3</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="pages-services.html">Services 1</a></li>
                                                <li><a href="pages-services-2.html">Services 2</a></li>
                                                <li><a href="pages-services-3.html">Services 3</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="pages-team.html">Team members 1</a></li>
                                                <li><a href="pages-team-2.html">Team members 2</a></li>
                                                <li><a href="pages-register.html">Register</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul class="last-child">
                                                <li><a href="#.html">Error 404 (next update)</a></li>
                                                <li><a href="#html.html">Under construction (next update)</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="drop"><a href="blog-grid-3col.html">Blog</a>
                        <ul class="drop-down">
                            <li><a href="blog-grid-3col.html">Grid<i class="fa fa-angle-right"></i></a>
                                <ul class="drop-down level3">
                                    <li><a href="blog-grid-3col.html">3 Colums</a>
                                    <li><a href="blog-grid-4col.html">4 Colums</a>
                                    <li><a href="blog-grid-leftsidebar.html">Left Sidebar</a>
                                    <li><a href="blog-grid-rightsidebar.html">Right Sidebar</a>
                                </ul>
                            </li>
                            <li><a href="blog-standard.html">Standart<i class="fa fa-angle-right"></i></a>
                                <ul class="drop-down level3">
                                    <li><a href="blog-fullwidth.html">Fullwidth</a>
                                    <li><a href="blog-leftsidebar.html">Left Sidebar</a>
                                    <li><a href="blog-rightsidebar.html">Right Sidebar</a>
                                </ul>
                            </li>
                            <li><a href="blog-masonry.html">Masonry<i class="fa fa-angle-right"></i></a>
                                <ul class="drop-down level3">
                                    <li><a href="blog-masonry.html">Fullwidth</a>
                                    <li><a href="blog-masonry-leftsidebar.html">Left Sidebar</a>
                                    <li><a href="blog-masonry-rightsidebar.html">Right Sidebar</a>
                                </ul>
                            </li>
                            <li><a href="single-post.html">Single Post</a></li>
                        </ul>
                    </li>

                    <li class="drop"><a href="portfolio-standart-3col.html">Portfolio</a>
                        <ul class="drop-down">

                            <li><a href="portfolio-standart-3col.html">Portfolio 3 Col<i class="fa fa-angle-right"></i></a>
                                <ul class="drop-down level3">
                                    <li><a href="pportfolio-standart-3col-fullwidth.html">Fullwidth</a>
                                    <li><a href="portfolio-standart-3col.html">Boxed</a>
                                    <li><a href="portfolio-description-3col.html">With describtion</a>
                                </ul>
                            </li>

                            <li><a href="portfolio-standart-4col.html">Portfolio 4 Col<i class="fa fa-angle-right"></i></a>
                                <ul class="drop-down level3">
                                    <li><a href="pportfolio-standart-4col-fullwidth.html">Fullwidth</a>
                                    <li><a href="portfolio-standart-4col.html">Boxed</a>
                                    <li><a href="portfolio-description-4col.html">With describtion</a>
                                </ul>
                            </li>

                            <li><a href="portfolio-masonry.html">Masonry<i class="fa fa-angle-right"></i></a>
                                <ul class="drop-down level3">
                                    <li><a href="portfolio-masonry.html">Standard</a>
                                    <li><a href="portfolio-masonry-fullscreen.html">Fullscreen</a>
                                    <li><a href="portfolio-masonry-fullwidth.html">Fullwidth</a>
                                    <li><a href="portfolio-masonry-fullwidth-2.html">Fullwidth 2</a>
                                </ul>
                            </li>
                            <li><a href="single-project.html">Single Project<i class="fa fa-angle-right"></i></a>
                                <ul class="drop-down level3">
                                    <li><a href="single-project.html">Single Project 1</a>
                                    <li><a href="single-project-2.html">Single Project 2</a>
                                    <li><a href="single-project-3.html">Single Project 3</a>
                                    <li><a href="single-video-project.html">Single Project 4</a>
                                    <li><a href="single-video-project-2.html">Single Project 4</a>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="drop"><a href="shop.html">Shop</a>
                        <ul class="drop-down">
                            <li><a href="shop.html">Shop homepage</a></li>
                            <li><a href="shop-with-sidebar.html">With Left Sidebar - Grid</a></li>
                            <li><a href="shop-with-sidebar-list.html">With Left Sidebar - List</a></li>
                            <li><a href="shop-single-product.html">Product Page</a></li>
                            <li><a href="shop-cart.html">Shopping Cart</a></li>
                            <li><a href="shop-checkout.html">Checkout</a></li>
                        </ul>
                    </li>
                    <li class="megadrop"><a href="#.html">Shortcodes</a>
                        <div class="megadrop-down">
                            <div class="container">
                                <div class="dropdown">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="shortcodes-buttons.html">Buttons</a></li>
                                                <li><a href="shortcodes-typography.html">Typography</a></li>
                                                <li><a href="shortcodes-icon-list.html">Icon lists</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="shortcodes-icon-box.html">Icon boxes</a></li>
                                                <li><a href="shortcodes-promo-box.html">Promo boxes</a></li>
                                                <li><a href="shortcodes-lightbox.html">Lightbox</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul>
                                                <li><a href="shortcodes-sliders.html">Sliders</a></li>
                                                <li><a href="shortcodes-tabs.html">Tabs</a></li>
                                                <li><a href="shortcodes-alerts.html">Alert boxes</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <ul class="last-child">
                                                <li><a href="shortcodes-toggles.html">Toggles &amp; accordions</a></li>
                                                <li><a href="shortcodes-modal.html">Modal &amp; popovers</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="drop"><a href="contact.html">Contact</a>
                        <ul class="drop-down right-side">
                            <li><a href="contact.html">Contact Page 1</a></li>
                            <li><a href="contact2.html">Contact Page 2</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="open-search"><i class="fa fa-search"></i></a>
                        <form class="form-search">
                            <div class="container">
                                <input type="search" placeholder="Type to Search"/>
                                <a href="#" class="close-search">x</a>
                            </div>
                        </form>
                    </li>
                </ul>
            </div> <!-- end navbar-collapse -->
        </div>
    </nav>
</header>
<!-- End Header -->

<div id="wrapper">

    <!-- Head page section
    ================================================== -->
    <section>
        <div id="head-page-section" class="l-grey-bg">
            <div class="container">
                <div class="row">

                    <!-- col-md-8 -->
                    <div class="col-md-8 col-sm-7">
                        <div class="head-title">
                            <h1>
                                My account
                            </h1>
                        </div> <!-- end subsection-text -->
                    </div> <!-- end col-md-8 -->

                    <!-- col-md-4 -->
                    <div class="col-md-4 col-sm-5">
                        <div class="project-navigation">
                            <ol class="breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li><a href="#.html">Pages</a></li>
                                <li class="active">Login</li>
                            </ol>
                        </div> <!-- end project-navigation -->
                    </div> <!-- end col-md-4 -->

                </div> <!-- end row -->
            </div> <!-- end container -->
        </div>
    </section>
    <!-- end head-page-section -->

    <!-- Register section
    ================================================== -->
    <section>
        <div class="page-section pad-sec-80">
            <div class="register-section">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6">
                            <form id="sign-in-form">

                                <h2>Log in</h2>

                                <div class="form-group">
                                    <label for="email">User name or E-mail <span>*</span></label>
                                    <input name="email" id="email" class="form-control" type="text">
                                </div> <!-- end form-group -->

                                <div class="form-group">
                                    <label for="password">Password <span>*</span></label>
                                    <input name="password" id="password" class="form-control" type="password">
                                </div> <!-- end form-group -->

                                <div class="submit-area">
                                    <input type="submit" id="submit_sign-in" class="btn btn-md btn-primary" value="Sign In">
                                    <span>Forgot your <a href="#">Password</a>?</span>
                                </div> <!-- end form-group -->

                            </form>

                            <div class="sep-section"></div>

                            <div class="sign-different">
                                <p>Want to use one of your other accounts? Sign-in here:</p>
                                <a class="facebook-sign" href="#"><i class="fa fa-facebook"></i> Sign In With Facebook</a>
                                <a class="twitter-sign" href="#"><i class="fa fa-twitter"></i> Sign In With Twitter</a>
                            </div> <!-- end sign-different -->

                        </div> <!-- col-md-6 -->


                        <div class="col-md-6">
                            <form id="register-form">
                                <h2>Register</h2>

                                <div class="form-group">
                                    <label for="username">User Name<span>*</span></label>
                                    <input name="username" id="username" class="form-control" type="text">
                                </div> <!-- end form-group -->

                                <div class="form-group">
                                    <label for="e-mail">E-mail <span>*</span></label>
                                    <input name="e-mail" id="e-mail" class="form-control" type="text">
                                </div> <!-- end form-group -->

                                <div class="form-group">
                                    <label for="pass-word">Password <span>*</span></label>
                                    <input name="pass-word" id="pass-word" class="form-control" type="password">
                                </div> <!-- end form-group -->

                                <div class="form-group">
                                    <label for="re-pass-word">Re - Enter Password <span>*</span></label>
                                    <input name="re-pass-word" id="re-pass-word" class="form-control" type="password">
                                </div> <!-- end form-group -->

                                <div class="submit-area">
                                    <input type="submit" id="submit_register" class="btn btn-md btn-primary" value="Register">
                                </div>
                            </form>
                        </div> <!-- col-md-6 -->

                    </div> <!-- end row -->
                </div> <!-- end container -->
            </div> <!-- end register-section -->
        </div>
    </section>
    <!-- end Register section -->

</div>
<!-- end wrapper -->

<!-- Footer
================================================== -->
<footer>
    <div class="up-footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 col-sm-6">

                    <div class="widget footer-widget text-widget">
                        <h4>About Ement</h4>
                        <p>Dantes remained confused and silent by this explanation of the thoughts which had unconsciously been working in his mind, or rather soul; for there are two distinct sorts of ideas. Dantes remained confused and silent by this explanation.</p>
                    </div> <!-- end footer-widget -->

                    <div class="widget footer-widget clearfix widget-newsletter">
                        <form id="widget-subscribe-form" method="post" class="form-inline">
                            <p><strong>Subscribe</strong> to Our Newsletter to get Important News, Amazing Offers & Inside Scoops:</p>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                                <input type="email" aria-required="true" name="widget-subscribe-form-email" id="subscriberemail" class="form-control required email" placeholder="Enter your Email">
                                <span class="input-group-btn">
                    <a id="widget-subscribe-submit-button" class="btn btn-primary">Subscribe</a>
                  </span>
                            </div>
                        </form>
                    </div>

                </div> <!-- end col-md-3 -->

                <div class="col-md-4 col-sm-6">
                    <div class="widget footer-widget recent-widget">
                        <h4>Recent Posts</h4>
                        <ul>
                            <li>
                                <h5><a href="single-post.html">Aenean sed justo tincidunt, vulputate nisi</a></h5>
                                <span>12 April 2016</span>
                            </li>
                            <li>
                                <h5><a href="single-post.html">Aenean sed justo tincidunt, vulputate nisi</a></h5>
                                <span>12 April 2016</span>
                            </li>
                            <li>
                                <h5><a href="single-post.html">Aenean sed justo tincidunt, vulputate nisi</a></h5>
                                <span>12 April 2016</span>
                            </li>
                        </ul>
                    </div> <!-- end recent-widget -->
                </div> <!-- end col-md-3 -->

                <div class="clearfix visible-sm-block"></div>

                <div class="col-md-4 col-sm-6">

                    <div class="widget footer-widget widget-contact-info">
                        <h4>Contact us</h4>
                        <ul class="widget-contact-list">
                            <li><i class="fa fa-map-marker"></i>
                                <strong>Address:</strong> 795 Folsom Ave, Suite 600
                                <br>San Francisco, CA 94107</li>
                            <li><i class="fa fa-phone"></i><strong>Phone:</strong> (123) 456-7890 </li>
                            <li><i class="fa fa-envelope"></i><strong>Email:</strong> <a href="mailto:first.last@example.com">first.last@example.com</a>
                            </li>
                            <li><i class="fa fa-clock-o"></i>Monday - Friday: <strong>08:00 - 22:00</strong>
                                <br>Saturday, Sunday: <strong>Closed</strong>
                            </li>
                        </ul>
                    </div> <!-- end widget-contact-info -->

                    <div class="widget footer-widget follow-widget">
                        <h4>Follow us</h4>
                        <ul class="social-list">
                            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                            <li><a class="google" href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a class="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                        </ul>
                    </div>
                </div> <!-- end col-md-3 -->
            </div> <!-- end row -->
        </div> <!-- end container -->
    </div>

    <div class="footer-line">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p>Ement @2016 by <span>Clas-design</span>. All Rights Reserved</p>
                </div>
                <div class="col-md-6">
                    <ul class="footer-menu text-right">
                        <li><a href="#.html">Home</a></li>
                        <li><a href="#.html">About</a></li>
                        <li><a href="#.html">Services</a></li>
                        <li><a href="#.html">Portfolio</a></li>
                        <li><a href="#.html">Blog</a></li>
                        <li><a href="#.html">Contact</a></li>
                    </ul>
                </div>  <!-- end col-md-6   -->
            </div> <!-- end row      -->
        </div> <!-- end container -->
    </div> <!-- end footer-line -->

</footer>
<!-- End footer -->

<!-- Back-to-top
================================================== -->
<div class="back-to-top">
    <i class="fa fa-angle-up fa-3x"></i>
</div> <!-- end back-to-top -->

<!-- JS libraries and scripts -->
<script src="webresources/assets/js/jquery-1.11.3.min.js"></script>
<script src="webresources/assets/js/bootstrap.min.js"></script>
<script src="webresources/assets/js/jquery.easing.1.3.js"></script>
<script src="webresources/assets/js/jquery.smoothscroll.js"></script>
<script src="webresources/assets/js/jquery.stellar.min.js"></script>
<script src="webresources/assets/js/jquery.countTo.js"></script>
<script src="webresources/assets/js/jquery.waypoints.js"></script>
<script src="webresources/assets/js/jquery.imagesloaded.min.js"></script>
<script src="webresources/assets/js/jquery.appear.min.js"></script>
<script src="webresources/assets/js/jquery.bxslider.min.js"></script>
<script src="webresources/assets/js/jquery.touchSwipe.min.js"></script>
<script src="webresources/assets/js/jquery.isotope.js"></script>
<script src="webresources/assets/js/jquery.placeholder.js"></script>
<script src="webresources/assets/js/jquery.ajaxchimp.min.js"></script>
<script src="webresources/assets/js/jquery.fitvids.js"></script>
<script src="webresources/assets/js/jquery.magnific-popup.min.js"></script>
<script src="webresources/assets/js/jquery.mb.YTPlayer.min.js"></script>
<script src="webresources/assets/js/jquery.owl.carousel.min.js"></script>
<script src="webresources/assets/js/jquery.superslides.min.js"></script>
<script src="webresources/assets/js/jquery.morphext.min.js"></script>
<script src="webresources/assets/js/jquery.nouislider.min.js"></script>
<script src="webresources/assets/js/jquery.flexslider-min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src="webresources/assets/js/jquery.gmaps.js"></script>
<script src="webresources/assets/js/main.js"></script>

</body>
</html>
