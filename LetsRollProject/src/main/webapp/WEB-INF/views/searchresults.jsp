<%--  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 3:37 PM--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Search results page</title>
</head>
<body>
<h1>Search Results...</h1>

<%--<img src="${imageData}" width="128" height="128"><br>--%>
<%--${type.key} : ${type.value} <br>--%>
<table border="1">
    <tr>
        <th>Event ID</th>
        <th>Title</th>
        <th>Creator</th>
        <th>Location (Venue Name / Address)</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
        <th>Skills Needed</th>
        <th>Attend</th>
        <th>Volunteer</th>
    </tr>
    <c:forEach var="data" items="${searchresults}">
        <tr>
            <td>${data.eventID}</td>
            <td>${data.title}</td>
            <td>${data.creator}</td>
            <td>${data.location}</td>
            <td>${data.description}</td>
            <td>${data.date}</td>
            <td>${data.skillsneeded}</td>
            <td>
                <a href="/addAttendee?id=${data.eventID}">
                    <button value="Attend">Attend</button>
                </a>
            </td>
            <td>
                <a href="addVolunteer?id=${data.eventID}">
                    <button value="Volunteer">Volunteer</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/homepage">Home page</a><br>
</body>
</html>
<%--

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- REMEMBER to add WEBRESOURCES before assests/images -->

    <!-- Basic page information -->
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Clas-design">
    <title></title>

    <!-- Fav Icon -->
    <link rel="shortcut icon" href="webresources/assets/images/favicon.ico">

    <!-- Custom Google fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600,600italic,700,700italic,300italic,300'
          rel='stylesheet' type='text/css'>
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

                                <a href="/logout" class="section-scroll btn btn-md btn-primary">Logout</a>

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
                <a class="navbar-brand" href="index.html"><img alt="" src="webresources/images/logoJRMN8.jpg"
                                                               style="height:95px;width:125px"></a>
                <a class="navbar-brand" href="index.html"><img alt="" src="webresources/images/logoLetsRoll.jpg"
                                                               style="height:95px;width:150px"></a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">

                    <li class="drop"><a href="/createevent">Create Event</a>
                    </li>

                    <li class="drop"><a href="/profile">Edit Profile</a>
                    </li>

                    <li class="drop"><a href="/feedbackpage">Feedback</a>
                    </li>

                    <li class="drop"><a href="/yourevents">Your Events</a>
                    </li>

                    <li class="drop"><a href="#contact-section">Contact</a>
                    </li>

                    <li>
                        &lt;%&ndash;<a href="#" class="open-search"><i class="fa fa-search"></i></a>
                        <form class="form-search">
                            <div class="container">
                                <input type="search" placeholder="Type to Search"/>
                                <a href="#" class="close-search">x</a>
                            </div>
                        </form>&ndash;%&gt;
                        <a href="#" class="open-search"><i class="fa fa-search"></i></a>
                        <form class="form-search" action="/searchresults" method="get">
                            <div class="container">
                                <input type="text" name="keywords" required>
                                <input type="submit" value="Search By Keywords">
                            </div>
                        </form>
                    </li>
                </ul>
            </div> <!-- end navbar-collapse -->
        </div>
    </nav>
</header>
<!-- End Header -->

&lt;%&ndash;<div id="wrapper">&ndash;%&gt;
    &lt;%&ndash;<!-- Event section
    ================================================== -->
    <section>
        <div class="shop-section pad-top-80 pad-bt-80">
            <div class="container">
                <div class="row">
                    <div class="products">

                        <div class="row">

                            <div class="col-md-12 col-xs-6">

                                <div class="product-post">

                                    &lt;%&ndash;<td></td>
                                    <td>${data.creator}</td>
                                    <td>${data.location}</td>
                                    <td>${data.description}</td>
                                    <td>${data.date}</td>
                                    <td>${data.skillsneeded}</td>
                                    <td>
                                        <a href="/addAttendee?id=${data.eventID}">
                                            <button value="Attend">Attend</button>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="addVolunteer?id=${data.eventID}">
                                            <button value="Volunteer">Volunteer</button>
                                        </a>
                                    </td>
                                    </tr>&ndash;%&gt;


                                    <c:forEach var="data" items="${searchresults}">

                                        <div class="row">

                                            <div class="col-sm-4">
                                                <div class="product-image">
                                                    <a href="shop-single-product.html"><img alt="Shop product image!"
                                                                                            src="assets/images/shop/products/2.jpg"></a>
                                                    <a href="shop-single-product.html"><img alt="Shop product image!"
                                                                                            src="assets/images/shop/products/1.jpg"></a>
                                                    <div class="product-hover">
                                                        <ul class="clearfix hover-stock-details">
                                                            <li class="stock"><a href="#">In stock:</a></li>
                                                            <li><a href="#">S</a></li>
                                                            <li><a href="#">M</a></li>
                                                            <li><a href="#">XL</a></li>
                                                        </ul>
                                                    </div> <!-- end product-hover -->
                                                </div> <!-- end product-image -->
                                            </div> <!-- end col-sm-4 -->

                                            <div class="col-sm-8">
                                                <div class="product-title">
                                                    <h5><a href="shop-single-product.html">${data.eventID}</a></h5>
                                                    <h5><a href="shop-single-product.html">${data.title}</a></h5>
                                                </div>
                                                <div class="clearfix">
                                                    <div class="product-price">
                                                        $59.99
                                                    </div>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                                <p class="hidden-xs">Phasellus rutrum convallis tortor vel sagittis. Ut
                                                    pulvinar neque non orci feugiat hendrerit. Etiam vel placerat arcu.
                                                    Integer semper ipsum a lacus consectetur rutrum. Quisque molestie
                                                    euismod odio, sed hendrerit metus adipiscing ultricies. Aliquam sed
                                                    magna id augue porta mattis. Mauris nec erat eros. Fusce gravida
                                                    blandit
                                                    odio, eget egestas dui auctor posuere. Sed dignissim quam libero,
                                                    eget
                                                    ornare nisi tempor ac. Proin hendrerit volutpat neque at iaculis.
                                                    Aliquam vitae lacinia metus. In consequat porta eleifend. In mauris
                                                    eros, feugiat vel ante eget, faucibus pretium eros.</p>
                                                <a class="btn btn-xs btn-primary" href="#.html">Add to cart</a>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div> <!-- end product-post -->
                            </div> <!-- end col-md-12 -->

                        </div> <!-- end row -->

                    </div> <!-- end products -->

                </div> <!-- end row -->

            </div> <!-- end container -->
        </div> <!-- end shop-section -->
    </section>
    <!-- end Event section -->&ndash;%&gt;

    &lt;%&ndash;    <!-- Event details section
        ================================================== -->
        <section>
            <div class="shop-details grey-bg pad-top-40">
                <div class="container">
                    <div class="row">

                        <div class="col-md-4">
                            <div class="services-post-1">
                                <span><i class="fa fa-gift"></i></span>
                                <div class="services-content">
                                    <h3>Free shipping on orders $60+</h3>
                                    <p>Order more than 60$ and you will get free shippining Worldwide. More info.</p>
                                </div> <!-- end services-content -->
                            </div> <!-- end services-post-1 -->
                        </div> <!-- end col-md-4 -->

                        <div class="col-md-4">
                            <div class="services-post-1">
                                <span><i class="fa fa-plane"></i></span>
                                <div class="services-content">
                                    <h3>Worldwide delivery</h3>
                                    <p>We deliver to the following countries: USA, Canada, Europe, Australia</p>
                                </div> <!-- end services-content -->
                            </div> <!-- end services-post-1 -->
                        </div> <!-- end col-md-4 -->

                        <div class="col-md-4">
                            <div class="services-post-1">
                                <span><i class="fa fa-history"></i></span>
                                <div class="services-content">
                                    <h3>60 days money back guranty!</h3>
                                    <p>Not happy with our product, feel free to return it, we will refund 100% your money!</p>
                                </div> <!-- end services-content -->
                            </div> <!-- end services-post-1 -->
                        </div> <!-- end col-md-4 -->

                    </div> <!-- end row -->
                </div> <!-- end container -->
            </div> <!-- end shop-details -->
        </section>
        <!-- end Shop details section -->

    </div> <!-- End wrapper -->&ndash;%&gt;

    <!-- Footer
    ================================================== -->
    <footer>
        <div class="up-footer">
            <div class="container">
                <div class="row">

                    <div class="col-md-4 col-sm-6">

                        <div class="widget footer-widget text-widget">
                            <h4>About Ement</h4>
                            <p>Dantes remained confused and silent by this explanation of the thoughts which had
                                unconsciously been working in his mind, or rather soul; for there are two distinct sorts
                                of ideas. Dantes remained confused and silent by this explanation.</p>
                        </div> <!-- end footer-widget -->

                        <div class="widget footer-widget clearfix widget-newsletter">
                            <form id="widget-subscribe-form" method="post" class="form-inline">
                                <p><strong>Subscribe</strong> to Our Newsletter to get Important News, Amazing Offers &
                                    Inside Scoops:</p>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
                                    <input type="email" aria-required="true" name="widget-subscribe-form-email"
                                           id="subscriberemail" class="form-control required email"
                                           placeholder="Enter your Email">
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
                                    <br>San Francisco, CA 94107
                                </li>
                                <li><i class="fa fa-phone"></i><strong>Phone:</strong> (123) 456-7890</li>
                                <li><i class="fa fa-envelope"></i><strong>Email:</strong> <a
                                        href="mailto:first.last@example.com">first.last@example.com</a>
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
    <script src="assets/js/jquery-1.11.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.easing.1.3.js"></script>
    <script src="assets/js/jquery.smoothscroll.js"></script>
    <script src="assets/js/jquery.stellar.min.js"></script>
    <script src="assets/js/jquery.countTo.js"></script>
    <script src="assets/js/jquery.waypoints.js"></script>
    <script src="assets/js/jquery.imagesloaded.min.js"></script>
    <script src="assets/js/jquery.appear.min.js"></script>
    <script src="assets/js/jquery.bxslider.min.js"></script>
    <script src="assets/js/jquery.touchSwipe.min.js"></script>
    <script src="assets/js/jquery.isotope.js"></script>
    <script src="assets/js/jquery.placeholder.js"></script>
    <script src="assets/js/jquery.ajaxchimp.min.js"></script>
    <script src="assets/js/jquery.fitvids.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/jquery.mb.YTPlayer.min.js"></script>
    <script src="assets/js/jquery.owl.carousel.min.js"></script>
    <script src="assets/js/jquery.superslides.min.js"></script>
    <script src="assets/js/jquery.morphext.min.js"></script>
    <script src="assets/js/jquery.nouislider.min.js"></script>
    <script src="assets/js/jquery.flexslider-min.js"></script>
    <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="assets/js/jquery.gmaps.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>
--%>
