<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 8/8/2017
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>
<head>
    <title>Your events page</title>
</head>
<body>
<h1>Attending</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Creator</th>
        <th>Location (Venue Name / Address)</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
        <th>Feedback</th>
    </tr>
    <c:forEach var="data" items="${attendee}">
        <tr>
            <td>${data.title}</td>
            <td>${data.creator}</td>
            <td>${data.location}</td>
            <td>${data.description}</td>
            <td>${data.date}</td>
            <td>
            <a href="/feedbackpage?id=${data.eventID}">
                <button value="Feedback">Feedback</button>
            </a>
            </td>
        </tr>
    </c:forEach>
</table>
<h1>Volunteer</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Creator</th>
        <th>Location (Venue Name / Address)</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
        <th>Feedback</th>
    </tr>
    <c:forEach var="data" items="${volunteer}">
        <tr>
            <td>${data.title}</td>
            <td>${data.creator}</td>
            <td>${data.location}</td>
            <td>${data.description}</td>
            <td>${data.date}</td>
            <td>
                <a href="/feedbackpage?id=${data.eventID}">
                    <button value="Feedback">Feedback</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<h1>Created</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Creator</th>
        <th>Location (Venue Name / Address)</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
    </tr>
    <c:forEach var="data" items="${created}">
        <tr>
            <td>${data.title}</td>
            <td>${data.creator}</td>
            <td>${data.location}</td>
            <td>${data.description}</td>
            <td>${data.date}</td>
        </tr>
    </c:forEach>
</table>
<a href="/homepage">Home page</a>
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

<!-- Navbar
================================================== -->
<header class="clearfix">
    <!-- Static navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="header-top-line">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-7">
                        <span><i class="fa fa-phone"></i> 1 (313) 888-ROLL</span>
                        <span><i class="fa fa-envelope"></i> jrmn8@gmail.com</span>
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

                    <!--           <li class="drop"><a href="/feedbackpage">Feedback</a>
                               </li> -->

                    <li class="drop"><a href="/yourevents">Your Events</a>
                    </li>

                    <!--       <li class="drop"><a href="#contact-section">Contact</a>
                           </li> -->

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
                                <input type="text" name="keywords" required>
                                <input type="submit" value="Event Search By Keywords">
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
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <!-- Attend Event section
    ================================================== -->
    <section>
        <div class="shop-section pad-top-80 pad-bt-80">
            <div class="container">
                <div class="row">
                    <div class="products">

                        <div class="row">

                            <div class="col-md-12 col-xs-6">

                                <div class="product-post">

                                    <%--<td></td>
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
                                    </tr>--%>
                                    <h1>Attending...</h1>
                                    <c:forEach var="data" items="${attendee}">
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <div class="product-image">
                                                    <div class="row">
                                                        <a class="btn btn-xs btn-primary"
                                                           href="/feedbackpage?id=${data.eventID}">Feedback</a>
                                                            <%-- <div class="product-hover">
                                                                                                                                <ul class="clearfix hover-stock-details">
                                                                                                                                    <p class="stock">(Note: The Event Coordinator
                                                                                                                                        is looking for volunteers with skills relevant
                                                                                                                                        to ${data.skillsneeded})</p>
                                                                                                                                        &lt;%&ndash;<li><a href="#">S</a></li>
                                                                                                                                        <li><a href="#">M</a></li>
                                                                                                                                        <li><a href="#">XL</a></li>&ndash;%&gt;
                                                                                                                                </ul>
                                                                                                                            </div> <!-- end product-hover -->--%>
                                                    </div>
                                                        <%--<a href="shop-single-product.html"><img alt="Shop product image!"
                                                                                            src="assets/images/shop/products/2.jpg"></a>
                                                    <a href="shop-single-product.html"><img alt="Shop product image!"
                                                                                            src="assets/images/shop/products/1.jpg"></a>--%>
                                                </div> <!-- end product-image -->
                                            </div> <!-- end col-sm-4 -->

                                            <div class="col-lg-10">
                                                <div class="product-title">
                                                    <h2>${data.title}</h2>
                                                    <p>(${data.eventID})</p>
                                                        <%--<h5>(Note: The Event Coordinator is looking for volunteers with
                                                            skills relevant to ${data.skillsneeded})</h5>--%>

                                                        <%--<h4>Event Coordinator: ${data.creator}</h4>--%>
                                                    <c:choose>
                                                        <c:when test="${data.date!=null}">
                                                            <p><b>Date: ${data.date}</b></p>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${data.location!=null}">
                                                            <p><b>Location: ${data.location}</b></p>
                                                        </c:when>
                                                    </c:choose>
                                                        <%--<h4><a href="shop-single-product.html">${data.title}</a></h4>
                                                        <h5><a href="shop-single-product.html">(${data.eventID})</a></h5>--%>
                                                </div>
                                                    <%--<div class="clearfix">
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
                                                                                                    </div>--%>
                                                <c:choose>
                                                    <c:when test="${data.description!='null'}">
                                                        <p class="hidden-xs">${data.description}</p>
                                                    </c:when>
                                                </c:choose>
                                                    <%--<p class="hidden-xs">${data.description}</p>--%>
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
    <!-- end Attend Event section -->
    <!-- Volunteer Event section
    ================================================== -->
    <section>
        <div class="shop-section pad-top-80 pad-bt-80">
            <div class="container">
                <div class="row">
                    <div class="products">

                        <div class="row">

                            <div class="col-md-12 col-xs-6">

                                <div class="product-post">

                                    <%--<td></td>
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
                                    </tr>--%>
                                    <h1>Volunteering...</h1>
                                    <c:forEach var="data" items="${volunteer}">
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <div class="product-image">
                                                    <div class="row">
                                                        <a class="btn btn-xs btn-primary"
                                                           href="/feedbackpage?id=${data.eventID}">Feedback</a>
                                                            <%-- <div class="product-hover">
                                                                                                                                <ul class="clearfix hover-stock-details">
                                                                                                                                    <p class="stock">(Note: The Event Coordinator
                                                                                                                                        is looking for volunteers with skills relevant
                                                                                                                                        to ${data.skillsneeded})</p>
                                                                                                                                        &lt;%&ndash;<li><a href="#">S</a></li>
                                                                                                                                        <li><a href="#">M</a></li>
                                                                                                                                        <li><a href="#">XL</a></li>&ndash;%&gt;
                                                                                                                                </ul>
                                                                                                                            </div> <!-- end product-hover -->--%>
                                                    </div>
                                                        <%--<a href="shop-single-product.html"><img alt="Shop product image!"
                                                                                            src="assets/images/shop/products/2.jpg"></a>
                                                    <a href="shop-single-product.html"><img alt="Shop product image!"
                                                                                            src="assets/images/shop/products/1.jpg"></a>--%>
                                                </div> <!-- end product-image -->
                                            </div> <!-- end col-sm-4 -->

                                            <div class="col-lg-10">
                                                <div class="product-title">
                                                    <h2>${data.title}</h2>
                                                    <p>(${data.eventID})</p>
                                                        <%--<h5>(Note: The Event Coordinator is looking for volunteers with
                                                            skills relevant to ${data.skillsneeded})</h5>--%>

                                                        <%--<h4>Event Coordinator: ${data.creator}</h4>--%>
                                                    <c:choose>
                                                        <c:when test="${data.date!=null}">
                                                            <p><b>Date: ${data.date}</b></p>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${data.location!=null}">
                                                            <p><b>Location: ${data.location}</b></p>
                                                        </c:when>
                                                    </c:choose>
                                                        <%--<h4><a href="shop-single-product.html">${data.title}</a></h4>
                                                        <h5><a href="shop-single-product.html">(${data.eventID})</a></h5>--%>
                                                </div>
                                                    <%--<div class="clearfix">
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
                                                                                                    </div>--%>
                                                <c:choose>
                                                    <c:when test="${data.description!='null'}">
                                                        <p class="hidden-xs">${data.description}</p>
                                                    </c:when>
                                                </c:choose>
                                                    <%--<p class="hidden-xs">${data.description}</p>--%>
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
    <!-- end Volunteer Event section -->

    <!-- Coordinate Event section
================================================== -->
    <section>
        <div class="shop-section pad-top-80 pad-bt-80">
            <div class="container">
                <div class="row">
                    <div class="products">

                        <div class="row">

                            <div class="col-md-12 col-xs-6">

                                <div class="product-post">

                                    <%--<td></td>
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
                                    </tr>--%>
                                    <h1>Created...</h1>
                                    <c:forEach var="data" items="${created}">
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <div class="product-image">
                                                    <div class="row">
                                                        <a class="btn btn-xs btn-primary"
                                                           href="/feedbackpage?id=${data.eventID}">Feedback</a>
                                                            <%-- <div class="product-hover">
                                                                                                                                <ul class="clearfix hover-stock-details">
                                                                                                                                    <p class="stock">(Note: The Event Coordinator
                                                                                                                                        is looking for volunteers with skills relevant
                                                                                                                                        to ${data.skillsneeded})</p>
                                                                                                                                        &lt;%&ndash;<li><a href="#">S</a></li>
                                                                                                                                        <li><a href="#">M</a></li>
                                                                                                                                        <li><a href="#">XL</a></li>&ndash;%&gt;
                                                                                                                                </ul>
                                                                                                                            </div> <!-- end product-hover -->--%>
                                                    </div>
                                                        <%--<a href="shop-single-product.html"><img alt="Shop product image!"
                                                                                            src="assets/images/shop/products/2.jpg"></a>
                                                    <a href="shop-single-product.html"><img alt="Shop product image!"
                                                                                            src="assets/images/shop/products/1.jpg"></a>--%>
                                                </div> <!-- end product-image -->
                                            </div> <!-- end col-sm-4 -->

                                            <div class="col-lg-10">
                                                <div class="product-title">
                                                    <h2>${data.title}</h2>
                                                    <p>(${data.eventID})</p>
                                                        <%--<h5>(Note: The Event Coordinator is looking for volunteers with
                                                            skills relevant to ${data.skillsneeded})</h5>--%>

                                                        <%--<h4>Event Coordinator: ${data.creator}</h4>--%>
                                                    <c:choose>
                                                        <c:when test="${data.date!=null}">
                                                            <p><b>Date: ${data.date}</b></p>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${data.location!=null}">
                                                            <p><b>Location: ${data.location}</b></p>
                                                        </c:when>
                                                    </c:choose>
                                                        <%--<h4><a href="shop-single-product.html">${data.title}</a></h4>
                                                        <h5><a href="shop-single-product.html">(${data.eventID})</a></h5>--%>
                                                </div>
                                                    <%--<div class="clearfix">
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
                                                                                                    </div>--%>
                                                <c:choose>
                                                    <c:when test="${data.description!='null'}">
                                                        <p class="hidden-xs">${data.description}</p>
                                                    </c:when>
                                                </c:choose>
                                                    <%--<p class="hidden-xs">${data.description}</p>--%>
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
    <!-- end Coordinate Event section -->
    <!-- Event details section
<%--
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
                                <p>Not happy with our product, feel free to return it, we will refund 100% your
                                    money!</p>
                            </div> <!-- end services-content -->
                        </div> <!-- end services-post-1 -->
                    </div> <!-- end col-md-4 -->

                </div> <!-- end row -->
            </div> <!-- end container -->
        </div> <!-- end shop-details -->
    </section>
    <!-- end Shop details section -->

</div> <!-- End wrapper -->
--%>

<!-- Footer
================================================== -->
</div>
<footer>
    <div class="up-footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 col-sm-6">

                    <div class="widget footer-widget text-widget">
                        <h4>About JRMN8</h4>
                        <p>We are four Java Bootcamp classmates at Grand Circus - Detroit. It was fate that brought
                            us together,
                            now we call ourselves JRMN8. Our initials and 8 weeks of bootcamp. Our group name is
                            pronounced GERMINATE and our meaning is:
                            Come into existence and develop.</p>
                    </div> <!-- end footer-widget -->


                </div> <!-- end col-md-3 -->

                <div class="col-md-4 col-sm-6">
                    <div class="widget footer-widget recent-widget">
                        <h4>Our Team!</h4>

                        <div class="team-post">
                            <img alt="" src="webresources/assets/images/team/jrmn8teampic.JPG"
                                 style="height:300px;width:240px">
                        </div>


                        </ul>
                    </div> <!-- end recent-widget -->
                </div> <!-- end col-md-3 -->

                <div class="clearfix visible-sm-block"></div>

                <div class="col-md-4 col-sm-6">

                    <div class="widget footer-widget widget-contact-info">
                        <h4>Contact us</h4>
                        <ul class="widget-contact-list">
                            <li><i class="fa fa-map-marker"></i>
                                <strong>Address:</strong> 1570 Woodward Avenue, Level 3
                                <br>Detroit, MI 48226
                            </li>
                            <li><i class="fa fa-phone"></i><strong>Phone:</strong> (313) 888-ROLL</li>
                            <li><i class="fa fa-envelope"></i><strong>Email:</strong> <a
                                    href="mailto:first.last@example.com">jrmn8@gmail.com</a>
                            </li>
                            <li><i class="fa fa-clock-o"></i>Monday - Friday: <strong>9:00AM - 5:00PM</strong>
                                <br>Saturday, Sunday: <strong>Closed</strong>
                            </li>
                        </ul>
                    </div> <!-- end widget-contact-info -->

                    <!--         <div class="widget footer-widget follow-widget">
                                 <h4>Follow us</h4>
                                 <ul class="social-list">
                                     <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                     <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                     <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                                     <li><a class="google" href="#"><i class="fa fa-google-plus"></i></a></li>
                                     <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                                     <li><a class="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                                 </ul>
                             </div> -->
                </div> <!-- end col-md-3 -->
            </div> <!-- end row -->
        </div> <!-- end container -->
    </div>

    <div class="footer-line">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p>Let's Roll @2017 by <span>JRMN8</span>. All Rights Reserved</p>
                </div>
                <div class="col-md-6">
                    <ul class="footer-menu text-right">
                        <!--         <li><a href="#.html">Home</a></li>
                                 <li><a href="#.html">About</a></li>
                                 <li><a href="#.html">Services</a></li>
                                 <li><a href="#.html">Portfolio</a></li>
                                 <li><a href="#.html">Blog</a></li>
                                 <li><a href="#.html">Contact</a></li> -->
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