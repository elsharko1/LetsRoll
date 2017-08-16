<%@ page import="com.jrmn8.GoogleOAUTH" %><%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 7/21/2017
  Time: 11:04 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<html>
<head>
    <title>Let's Roll!</title>
</head>

<div class="oauthDemo">
    <%
        GoogleOAUTH.buildGoogleOAUTH();
        if (request.getParameter("code") == null || request.getParameter("state") == null) {
            out.println("<a href='" + GoogleOAUTH.buildLoginUrl() + "'>log in with google</a>");
            session.setAttribute("state", GoogleOAUTH.getStateToken());
        } else if (request.getParameter("code") != null && request.getParameter("state") != null && request.getParameter("state").equals(session.getAttribute("state"))) {
            session.removeAttribute("state");
        }
    %>
</div>

</body>
</html>--%>

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
<!-- Hero    ================================================== -->
<section>
    <div id="hero-slider-section">
        <div id="slides" class="height-full">
            <ul class="slides-container">

                <!-- slide -->
                <li style="background-image:url('/webresources/assets/images/banners/bike-race.jpg');">
                    <div class="overlay-slider"></div>
                    <div class="hero-slider-content">
                        <div class="c-vertical">
                            <div class="container">
                                <div class="hero-text">
                                    <h1 class="animated out" data-animation="slideInDown"
                                                    data-delay="0.5">Let's<span> Roll!</span></h1>
                                    <p class="animated out" data-animation="slideInLeft" data-delay="0.5">Find
                                        your favorite events that are wheelchair accessible here!</p>
                                    <div class="call-to-action animated out" data-animation="slideInUp"
                                         data-delay="0.7">
                                        <div class="header-top-line">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-5">
                                                        <div class="right-align">
                                                            <ul>
                                                                <div class="oauthDemo">
                                                                    <%
                                                                        GoogleOAUTH.buildGoogleOAUTH();
                                                                        if (request.getParameter("code") == null || request.getParameter("state") == null) {
                                                                            out.println("<a href='" + GoogleOAUTH.buildLoginUrl() + "' class=\"section-scroll btn btn-md btn-primary\">log in with google</a>");
                                                                            session.setAttribute("state", GoogleOAUTH.getStateToken());
                                                                        } else if (request.getParameter("code") != null && request.getParameter("state") != null && request.getParameter("state").equals(session.getAttribute("state"))) {
                                                                            session.removeAttribute("state");
                                                                        }
                                                                    %>
                                                                </div>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- end col-md-6 -->
                            </div> <!-- End container -->
                        </div> <!-- end c-vertical -->
                    </div>
                </li>
            </ul>
            <!-- nav -->
            <nav class="slides-navigation">
                <a href="#" class="next"><i class="fa fa-angle-right"></i></a>
                <a href="#" class="prev"><i class="fa fa-angle-left"></i></a>
            </nav>
        </div> <!-- end slides -->
</section>
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
