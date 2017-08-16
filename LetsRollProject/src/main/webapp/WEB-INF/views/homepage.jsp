<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 3:32 PM
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home page</title>
</head>
<body>
<a href="/createevent">Create Event</a><br>
<a href="/profile">Edit Profile</a><br>
<a href="/feedbackpage">Feedback</a><br>
<form action="/searchresults" method="get">
    <input type="text" name = "keywords" required>
    <input type="submit" value="Search By Keywords">
</form>
<a href="/searchresults">search results</a><br>
<a href="/yourevents">See your events</a><br>
<a href="/logout">Log Out</a><br>
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
                <a class="navbar-brand" href="index.html"><img alt="" src="webresources/images/logoJRMN8.jpg" style="height:95px;width:125px"></a>
                <a class="navbar-brand" href="index.html"><img alt="" src="webresources/images/logoLetsRoll.jpg" style="height:95px;width:150px"></a>
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
                        <%--<a href="#" class="open-search"><i class="fa fa-search"></i></a>
                        <form class="form-search">
                            <div class="container">
                                <input type="search" placeholder="Type to Search"/>
                                <a href="#" class="close-search">x</a>
                            </div>
                        </form>--%>
                        <a href="#" class="open-search"><i class="fa fa-search"></i></a>
                        <form class="form-search" action="/searchresults" method="get">
                            <div class="container">
                                <input type="text" name = "keywords" required>
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

<div id="wrapper">

    <!-- Hero
    ================================================== -->
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
                                    <div class="row">
                                        <div class="col-md-8 col-lg-8">
                                            <div class="hero-text">
                                                <h1 class="animated out" data-animation="slideInDown" data-delay="0.5">Let's<span> Roll!</span></h1>
                                                <p class="animated out" data-animation="slideInLeft" data-delay="0.5">Find your favorite events that are wheelchair accessible here!</p>
                                                <div class="call-to-action animated out" data-animation="slideInUp" data-delay="0.7">
                                                    <a href="#contact-section" class="section-scroll btn btn-md btn-clean">Sign Up</a>
                                                    <a href="#contact-section" class="section-scroll btn btn-md btn-primary">Login</a>
                                                </div>
                                            </div> <!-- End hero-text -->
                                        </div> <!-- end col-md-6 -->
                                    </div> <!-- end row -->
                                </div> <!-- End container -->
                            </div> <!-- end c-vertical -->
                        </div> <!-- End hero-content -->
                    </li>

                    <!-- slide -->
                    <li style="background-image:url('webresources/assets/images/banners/bike-72009.jpeg');">
                        <div class="overlay-slider"></div>
                        <div class="hero-slider-content">
                            <div class="c-vertical">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-8 col-lg-8">
                                            <div class="hero-text">
                                                <h1 class="animated out" data-animation="rotateInDownLeft" data-delay="0.5">Let's <span>Roll!</span></h1>
                                                <p class="animated out" data-animation="rotateIn" data-delay="0">Attend. Volunteer. Create an Event.</p>
                                                <div class="call-to-action animated out" data-animation="slideInLeft" data-delay="0.7">
                                                    <a href="#contact-section" class="section-scroll btn btn-md btn-primary">Explore more</a>
                                                </div>
                                            </div> <!-- End hero-text -->
                                        </div> <!-- end col-md-6 -->
                                    </div> <!-- end row -->
                                </div> <!-- End container -->
                            </div> <!-- end c-vertical -->
                        </div> <!-- End hero-content -->
                    </li>

                    <!-- slide -->
                    <li style="background-image:url('/webresources/assets/images/banners/Museum-detroit.jpg');">
                        <div class="overlay-slider"></div>
                        <div class="hero-slider-content">
                            <div class="c-vertical">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-8 col-lg-8">
                                            <div class="hero-text">
                                                <h1 class="animated out" data-animation="rotateInDownLeft" data-delay="0.5">Let's Roll!</h1>
                                                <p class="animated out" data-animation="rotateIn" data-delay="0">Designed to help the disabled find a precise, clear, avenue to the venue and gain access to the event. </p>
                                                <div class="call-to-action animated out" data-animation="slideInLeft" data-delay="0.7">
                                                    <a href="#contact-section" class="section-scroll btn btn-md btn-clean">Volunteer at your favorite event here!</a>
                                                </div>
                                            </div> <!-- End hero-text -->
                                        </div> <!-- end col-md-6 -->
                                    </div> <!-- end row -->
                                </div> <!-- End container -->
                            </div> <!-- end c-vertical -->
                        </div> <!-- End hero-content -->
                    </li>
                </ul>
                <!-- nav -->
                <nav class="slides-navigation">
                    <a href="#" class="next"><i class="fa fa-angle-right"></i></a>
                    <a href="#" class="prev"><i class="fa fa-angle-left"></i></a>
                </nav>
            </div> <!-- end slides -->
        </div> <!-- End hero-section -->
    </section>
    <!-- End hero section -->

    <%--<!-- Work process--%>
    <%--================================================== -->--%>
    <!-- Team section
    ================================================== -->
    <section>
        <div class="page section pad-sec-60">

            <div class="title-section">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2">
                            <h2>Our Team</h2>
                            <hr>
                            <p>We are four Java Bootcamp classmates at Grand Circus - Detroit. It was fate that brought us together,
                                now we call ourselves JRMN8. Our initials and 8 weeks of bootcamp. Our group name is pronounced GERMINATE and our meaning is:
                                Come into existence and develop.</p>
                        </div> <!-- end col-sm-8 -->
                    </div> <!-- End row -->
                </div> <!-- end container -->
            </div> <!-- end title-section -->

            <div class="team-box2">
                <div class="container">
                    <div class="row">

                        <div class="col-sm-3">
                            <div class="team-post">
                                <img alt="" src="webresources/assets/images/team/team-member1.jpg">
                                <div class="team-content">
                                    <h2>Jenny St. Peters</h2>
                                    <span>Software Designer</span>
                                    <p>Software developer and detail oriented professional engineer with more than 10 years of professional experience looking to utilize my proven ability to learn and adapt quickly to provide high quality, systematic solutions.</p>
                                    <ul class="team-social">
                                        <!--<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                        <!--<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                        <!--<li><a class="dribble" href="#"><i class="fa fa-dribbble"></i></a></li> -->
                                        <li><a class="linkedin" href="https://www.linkedin.com/in/jennystpeters/"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div><!--  end team-content -->
                            </div> <!-- end team-post -->
                        </div> <!-- end col-sm-4 -->

                        <div class="col-sm-3">
                            <div class="team-post">
                                <img alt="" src="webresources/assets/images/team/team-1-2.jpg">
                                <div class="team-content">
                                    <h2>Richard Ren</h2>
                                    <span>Software Designer</span>
                                    <p>Leaping into software development, one language at a time!</p>
                                    <ul class="team-social">
                                        <!-- <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                         <!--<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                         <!--<li><a class="dribble" href="#"><i class="fa fa-dribbble"></i></a></li> -->
                                        <li><a class="linkedin" href="https://www.linkedin.com/in/richard-ren/"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div><!--  end team-content -->
                            </div> <!-- end team-post -->
                        </div> <!-- end col-sm-4 -->

                        <div class="col-sm-3">
                            <div class="team-post">
                                <img alt="" src="webresources/assets/images/team/team-member3.jpg">
                                <div class="team-content">
                                    <h2>Mark Ritter</h2>
                                    <span>Software Designer</span>
                                    <p>Java Developer looking for a way to implement it into my golf game. </p>
                                    <ul class="team-social">
                                        <!--<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                        <!--<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                        <!--<li><a class="dribble" href="#"><i class="fa fa-dribbble"></i></a></li> -->
                                        <li><a class="linkedin" href="https://www.linkedin.com/in/markritter423/"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div><!--  end team-content -->
                            </div> <!-- end team-post -->
                        </div> <!-- end col-sm-4 -->

                        <div class="col-sm-3">
                            <div class="team-post">
                                <img alt="" src="webresources/assets/images/team/team-1-4.jpg">
                                <div class="team-content">
                                    <h2>Ny Derry</h2>
                                    <span>Software Designer</span>
                                    <p>Using technical skills in collaborating with a diverse group of people in accomplishing a common goal. </p>
                                    <ul class="team-social">
                                        <!--<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                        <!-- <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                        <!-- <li><a class="dribble" href="#"><i class="fa fa-dribbble"></i></a></li> -->
                                        <li><a class="linkedin" href="https://www.linkedin.com/in/nyderry/"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div><!--  end team-content -->
                            </div> <!-- end team-post -->
                        </div> <!-- end col-sm-4 -->

                    </div> <!-- end row -->
                </div> <!-- end container -->
            </div> <!-- end team-box2 -->
        </div>
    </section>
    <!-- end Team section -->

    <section>
        <div class="sep-section"></div>
    </section>

    <!-- Contact info
    ================================================== -->
    <section>
        <div class="parallax-section contact-info" data-stellar-background-ratio="1">
            <!-- <img alt="" src="webresources/assets/images/slides/slide-1.jpg" style="height:300px;width:300px">  -->
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="text-center">
                            <div class="large-info"><i class="fa fa-phone"></i>310-111-0000</div>
                            <div class="email-info">
                                <i class="fa fa-envelope"></i>
                                <a href="mailto:a.axminenko@gmail.com">a.axminenko@gmail.com</a>
                            </div>
                            <div class="adress-info">
                                <i class="fa fa-map-marker"></i>
                                <a href="#google-map">5 Park Avenue, New York, NY 10016</a>
                            </div>
                        </div> <!-- end text-center -->
                    </div> <!-- end col-md-8 -->
                </div> <!-- end row -->
            </div> <!-- end container -->
        </div>
    </section>
    <!-- end contact-info -->

    <!-- Contact-section
    ================================================== -->
    <section>
        <div id="contact-section" class="pad-sec-80">

            <div class="container">

                <div class="title-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <h2>Get in touch</h2>
                                <hr>
                                <p>Sed ac mattis justo. Vestibulum facilisis at arcu ac porta. Vivamus at ipsum at quam hendrerit gravida</p>
                            </div> <!-- end col-sm-8 -->
                        </div> <!-- End row -->
                    </div> <!-- end container -->
                </div> <!-- end title-section -->

                <div class="location-section">
                    <div class="row">

                        <div class="col-sm-4">
                            <div class="location-item text-center">
                                <div class="icon">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <h5 class="text-uppercase">Location</h5>
                                <div class="loc-desc">
                                    1400 Defense Pentagon, Arlington County
                                    <br>
                                    Virginia, United States
                                </div>
                            </div> <!-- end location-item  -->
                        </div> <!-- end col-sm-4 -->

                        <div class="col-sm-4">
                            <div class="location-item text-center">
                                <div class="icon">
                                    <i class="fa fa-mobile"></i>
                                </div>
                                <h5 class="text-uppercase">Call us 24/7</h5>
                                <div class="loc-desc">
                                    +1065289799 <br> +1065289712
                                </div>
                            </div> <!-- end location-item  -->
                        </div> <!-- end col-sm-4 -->

                        <div class="col-sm-4">
                            <div class="location-item text-center">
                                <div class="icon">
                                    <i class="fa fa-envelope-o"></i>
                                </div>
                                <h5 class="text-uppercase">Mail us</h5>
                                <div class="loc-desc">
                                    clas-design@hot.com <br> email@hot.com
                                </div>
                            </div> <!-- end location-item  -->
                        </div> <!-- end col-sm-4 -->
                    </div> <!-- end row -->
                </div> <!-- end location-section -->

                <div class="form-wrapper">
                    <div class="row">
                        <div class="col-md-12">

                            <!-- form fields -->
                            <form action="webresources/assets/php/contact.php" method="post" name="contactform" id="contactform" class=" animated out" data-animation="fadeInUp" data-delay="0">

                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <input class="form-control" type="text" name="name" id="name" placeholder="Name">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <input class="form-control" type="email" name="email" id="email" placeholder="Email">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <input class="form-control" type="text" name="subject" id="subject" placeholder="Subject">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <textarea class="form-control" name="message" id="message" placeholder="Message..."></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <!-- submit button -->
                                <div class="form-group">
                                    <input type="submit" name="submit" value="Send message" id="submit" class="btn btn-sm btn-primary">
                                </div>

                                <div id="alert"></div>

                            </form>

                        </div> <!-- end col-md-8 -->
                    </div> <!-- end row -->
                </div>  <!-- end form-wrapper -->

            </div> <!-- end container -->
        </div> <!-- End contact-section -->
    </section>
    <!-- end Contact-section -->

</div> <!-- End wrapper -->

<!-- Footer
================================================== -->
<footer>
    <div class="up-footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 col-sm-6">

                    <div class="widget footer-widget text-widget">
                        <h4>About JRMN8</h4>
                        <p>We are four Java Bootcamp classmates at Grand Circus - Detroit. It was fate that brought us together,
                            now we call ourselves JRMN8. Our initials and 8 weeks of bootcamp. Our group name is pronounced GERMINATE and our meaning is:
                            Come into existence and develop.</p>
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
                    <p>JRMN8 @2017 by <span>Clas-design</span>. All Rights Reserved</p>
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
