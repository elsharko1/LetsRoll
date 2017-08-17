<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 3:36 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create event page</title>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
          href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        #map {
            height: 500px;
            width: 500px;
        }

        #infowindow-content .title {
            font-weight: bold;
        }

        #infowindow-content {
            display: none;
        }

        #map #infowindow-content {
            display: inline;
        }

        #pac-container {
            padding-bottom: 12px;
            margin-right: 12px;
        }

        .pac-controls label {
            font-family: Roboto;
            font-size: 13px;
            font-weight: 300;
        }

        /*        #pac-input {
                    background-color: #fff;
                    font-family: Roboto;
                    font-size: 15px;
                    font-weight: 300;
                    margin-left: 12px;
                    padding: 0 11px 0 13px;
                    text-overflow: ellipsis;
                    width: 400px;
                }

                #pac-input:focus {
                    border-color: #4d90fe;
                }*/
        .form-control {
            min-height:42px;
            padding:5px 0;
            margin:2px 0 0;
            font-size:14px;
        }
    </style>
    <%--</head>
    <body>
    <br>
    <form method="post" action="/eventcreated">
        Title: <input type="text" name="title">
        <br>
        <div id="datetimepicker" class="input-append date">
            <input type="text" name="date">Date: </input>
            <span class="add-on">
            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
          </span>
        </div>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
        </script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
        </script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
        </script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
        </script>
        <script type="text/javascript">
            $('#datetimepicker').datetimepicker({
                setDate: new Date(),
                startDate: new Date(),
                pickSeconds: false,
                pick12HourFormat: true,
                format: "MM/dd/yyyy HH:mm PP"
            }).val();
        </script>
        <br>
        <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvA4Qjj6E2adhJsz-WlmViKWKhs6HQ68M&libraries=places"></script>

        <div id="pac-container">
            <input id="pac-input" type="text" placeholder="Enter event location" name="where">
        </div>
        </div>
        <div id="map"></div>
        <div id="infowindow-content">
            <img src="" width="16" height="16" id="place-icon">
            <span id="place-name" class="title"></span><br>
            <span id="place-address"></span>
        </div>

        <script>
            function initMap() {

                var map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 42.3293, lng: -83.0398},
                    zoom: 13
                });
                var card = document.getElementById('pac-card');
                var input = document.getElementById('pac-input');
                var types = document.getElementById('type-selector');

                map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

                var autocomplete = new google.maps.places.Autocomplete(input);

                // Bind the map's bounds (viewport) property to the autocomplete object,
                // so that the autocomplete requests use the current map bounds for the
                // bounds option in the request.
                autocomplete.bindTo('bounds', map);

                var infowindow = new google.maps.InfoWindow();
                var infowindowContent = document.getElementById('infowindow-content');
                infowindow.setContent(infowindowContent);
                var marker = new google.maps.Marker({
                    map: map,
                    anchorPoint: new google.maps.Point(0, -29)
                });

                autocomplete.addListener('place_changed', function () {
                    infowindow.close();
                    marker.setVisible(false);
                    var place = autocomplete.getPlace();
                    if (!place.geometry) {
                        // User entered the name of a Place that was not suggested and
                        // pressed the Enter key, or the Place Details request failed.
                        window.alert("No details available for input: '" + place.name + "'");
                        return;
                    }

                    // If the place has a geometry, then present it on a map.
                    if (place.geometry.viewport) {
                        map.fitBounds(place.geometry.viewport);
                    } else {
                        map.setCenter(place.geometry.location);
                        map.setZoom(17);  // Why 17? Because it looks good.
                    }
                    marker.setPosition(place.geometry.location);
                    marker.setVisible(true);

                    var address = '';
                    if (place.address_components) {
                        address = [
                            (place.address_components[0] && place.address_components[0].short_name || ''),
                            (place.address_components[1] && place.address_components[1].short_name || ''),
                            (place.address_components[2] && place.address_components[2].short_name || '')
                        ].join(' ');
                    }

                    infowindowContent.children['place-icon'].src = place.icon;
                    infowindowContent.children['place-name'].textContent = place.name;
                    infowindowContent.children['place-address'].textContent = address;
                    infowindow.open(map, marker);
                });

                // Sets a listener on a radio button to change the filter type on Places
                // Autocomplete.
                function setupClickListener(id, types) {
                    var radioButton = document.getElementById(id);
                    radioButton.addEventListener('click', function () {
                        autocomplete.setTypes(types);
                    });
                }
            }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvA4Qjj6E2adhJsz-WlmViKWKhs6HQ68M&libraries=places&callback=initMap"></script>


    <br>
    Description: <br>
    <textarea rows="5" cols="50" name="description"></textarea>
    <br>
    Skills Needed: <br>
    <select multiple name="skillsneeded" required>
        <option value="Disabled">Disabled</option>
        <option value="Children">Children</option>
        <option value="People">People</option>
        <option value="Animal">Animal</option>
        <option value="Administrative">Adminstrative</option>
        <option value="Technical">Technical</option>

        <br>
        Description: <br>
        <textarea rows="5" cols="50" name="description">
        </textarea>
        <br>
        Skills Needed: <br>
        <select multiple name="skillsneeded">
            <option value="Disabled">Disabled</option>
            <option value="Children">Children</option>
            <option value="People">People</option>
            <option value="Animal">Animal</option>
            <option value="Administrative">Adminstrative</option>
            <option value="Technical">Technical</option>
            <br>
        </select>
        <br>
        WheelChair Accessible:
        <select name="wheelchair">
            <option value="1">Yes</option>
            <option value="0">No</option>
            &lt;%&ndash;<option value= "comedy">Comedy Events</option>&ndash;%&gt;
            &lt;%&ndash;<option value= "education">Education</option>&ndash;%&gt;
            &lt;%&ndash;<option value= "famFrendly">Kids & Family</option>&ndash;%&gt;
        </select>
        <br>
        Family Friendly:
        <select name="family">
            <option value="1">Yes</option>
            <option value="0">No</option>
        </select>
        <br>
        Service Dog Friendly:
        <select name="servicedog">
            <option value="1">Yes</option>
            <option value="0">No</option>
        </select>
        <br>
        Blind Friendly:
        <select name="blind">
            <option value="1">Yes</option>
            <option value="0">No</option>
        </select>
        <br>
        &lt;%&ndash;<input type="checkbox" name="accessW" value="1">Wheel Chair<br>&ndash;%&gt;
        &lt;%&ndash;<input type="checkbox" name="accessF" value="1">Family Friendly<br>&ndash;%&gt;
        &lt;%&ndash;<input type="checkbox" name="accessS" value="1">Service Dog Friendly<br>&ndash;%&gt;
        &lt;%&ndash;<input type="checkbox" name="accessB" value="1">Blind Friendly<br>&ndash;%&gt;
        <input type="submit" value="Register">
    </form>
    <br>
    <a href="/homepage">Home page</a>
    </body>
    </html>

    <!DOCTYPE html>
    <html lang="en">
    <head>--%>

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
                <div class="row">
                    <div class="col-lg-7">
                        <img alt="" src="webresources/images/LogoBanner.JPG">
                        <%--<a class="navbar-brand" href="index.html"><img alt="" src="webresources/images/logoJRMN8.jpg" style="height:95px;width:125px"></a>
                        <a class="navbar-brand" href="index.html"><img alt="" src="webresources/images/logoLetsRoll.jpg" style="height:95px;width:150px"></a>--%>
                    </div>
                    <div class="col-lg-5">

                        <div class="navbar-collapse collapse">

                            <ul class="nav navbar-nav navbar-right">

                                <li class="drop"><a href="/homepage">Homepage</a>
                                </li>
                                <li class="drop"><a href="/profile">Edit Profile</a>
                                </li>
                                <li class="drop"><a href="/yourevents">Your Events</a>
                                </li>
                                <li>
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
                </div>
            </div>
        </div>
    </nav>
</header>
<!-- End Header -->

<div id="wrapper">


    <!-- Contact info
    ================================================== -->
    <section>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="parallax-section contact-info" data-stellar-background-ratio="1" style="height:240px; vertical-align:bottom">
            <!-- <img alt="" src="webresources/assets/images/slides/slide-1.jpg" style="height:300px;width:300px">  -->
            <%--<li style="background-image:url('webresources/assets/images/banners/bike-72009.jpeg');">--%>
            <div class="overlay-slider"></div>
            <div class="hero-slider-content">
                <div class="c-vertical">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                <div class="text-center">
                                    <div class="hero-text">
                                        <h1 class="animated out" data-animation="rotateInDownLeft"
                                            data-delay="0.5">Create <span>Your </span>Next <span>Accessible </span>Event
                                        </h1>

                                        <%--                            <div class="large-info"><i class="fa fa-phone"></i>310-111-0000</div>
                                                                    <div class="email-info">
                                                                        <i class="fa fa-envelope"></i>
                                                                        <a href="mailto:a.axminenko@gmail.com">a.axminenko@gmail.com</a>
                                                                    </div>
                                                                    <div class="adress-info">
                                                                        <i class="fa fa-map-marker"></i>
                                                                        <a href="#google-map">5 Park Avenue, New York, NY 10016</a>
                                                                    </div>--%>
                                    </div> <!-- end text-center -->
                                </div> <!-- end col-md-8 -->
                            </div> <!-- end row -->
                        </div> <!-- end container -->
                    </div>
                </div> <!-- end c-vertical -->
            </div> <!-- End hero-content -->
        </div>
    </section>
    <!-- end contact-info -->

    <!-- Contact-section
    ================================================== -->
    <section>
        <div id="contact-section" class="pad-sec-80">

            <div class="container">
                <div class="form-wrapper">
                    <div class="row">
                        <div class="col-md-12">

                            <!-- form fields -->
                            <form method="post" action="/eventcreated" class=" animated out" data-animation="fadeInUp"
                                  data-delay="0">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        Event Title: <br>
                                                        <input class="form-control" type="text" name="title" id="title"
                                                               placeholder="Title" required>
                                                    </div>
                                                    <div class="form-group">
                                                        Description: <br>
                                                        <textarea class="form-control" name="description"
                                                                  id="description"
                                                                  placeholder="Description..." style="height:120px" required></textarea>
                                                    </div>
                                                    <div id="datetimepicker" class="input-append date" class="form-control">
                                                        Date: <br>
                                                        <input type="text" name="date" class="form-control" placeholder="Event Date and Time" required>
                                                        <span class="add-on"><i data-time-icon="icon-time", data-date-icon="icon-calendar"></i></span>
                                                    </div>
                                                    <div id="pac-container" class="form-group">
                                                        Location: <br>
                                                        <input id="pac-input" type="text"
                                                               placeholder="Enter event location" name="where"
                                                               class="form-control" required>
                                                    </div>
                                                    <div id="map"></div>
                                                    <div id="infowindow-content">
                                                        <img src="" width="16" height="16" id="place-icon">
                                                        <span id="place-name" class="title"></span><br>
                                                        <span id="place-address"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                Need Skills Relevant to: <br>
                                                <select multiple name="skillsneeded" class="form-control" style="height:120px" required>
                                                    <option value="Disabled">Disabled</option>
                                                    <option value="Children">Children</option>
                                                    <option value="People">People</option>
                                                    <option value="Animal">Animal</option>
                                                    <option value="Administrative">Adminstrative</option>
                                                    <option value="Technical">Technical</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                WheelChair Accessible: <br>
                                                <select name="wheelchair" class="form-control">
                                                    <option value="1">Yes</option>
                                                    <option value="0">No</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                Family Friendly: <br>
                                                <select name="family" class="form-control">
                                                    <option value="1">Yes</option>
                                                    <option value="0">No</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                Service Dog Friendly: <br>
                                                <select name="servicedog" class="form-control">
                                                    <option value="1">Yes</option>
                                                    <option value="0">No</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                Accommodations for Visually Impaired: <br>
                                                <select name="blind" class="form-control">
                                                    <option value="1">Yes</option>
                                                    <option value="0">No</option>
                                                </select>
                                            </div>
                                            <!-- submit button -->
                                            <div class="form-group">
                                                <input type="submit" name="submit" value="Register" id="submit"
                                                       class="btn btn-sm btn-primary">
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Footer
================================================== -->
<footer>
    <div class="up-footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 col-sm-6">

                    <div class="widget footer-widget text-widget">
                        <h4>About JRMN8</h4>
                        <p>We are four Java Bootcamp classmates at Grand Circus - Detroit.
                            It was fate that brought us together,now we call ourselves JRMN8.
                            Our initials and 8 weeks of bootcamp. Our group name is pronounced
                            GERMINATE and our meaning is: Come into existence and develop.</p>
                    </div> <!-- end footer-widget -->



                </div> <!-- end col-md-3 -->

                <div class="col-md-4 col-sm-6">
                    <div class="widget footer-widget recent-widget">
                        <h4>Our Team!</h4>

                        <div class="team-post">
                            <img alt="" src="webresources/assets/images/team/jrmn8teampic.JPG"style="height:300px;width:240px">
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
                                <br>Detroit, MI 48226</li>
                            <li><i class="fa fa-phone"></i><strong>Phone:</strong> (313) 888-ROLL </li>
                            <li><i class="fa fa-envelope"></i><strong>Email:</strong> <a href="mailto:first.last@example.com">jrmn8@gmail.com</a>
                            </li>
                            <li><i class="fa fa-clock-o"></i>Monday - Friday: <strong>9:00AM - 5:00PM</strong>
                                <br>Saturday, Sunday: <strong>Closed</strong>
                            </li>
                        </ul>

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
<script src="webresources/assets/js/main.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js"></script>
<script src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js"></script>
<script>
    $('#datetimepicker').datetimepicker({
        setDate: new Date(),
        startDate: new Date(),
        pickSeconds: false,
        pick12HourFormat: true,
        format: "MM/dd/yyyy HH:mm PP",
        sideBySide: "true",
        autoclose: true,
        keepOpen: false
    }).val();
    $('datetimepicker').on('changeDate', function(ev){
        $(this).datepicker('hide');
    });
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvA4Qjj6E2adhJsz-WlmViKWKhs6HQ68M&libraries=places"></script>
<script>
    function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 42.3293, lng: -83.0398},
            zoom: 13
        });
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        var types = document.getElementById('type-selector');

        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

        var autocomplete = new google.maps.places.Autocomplete(input);

        // Bind the map's bounds (viewport) property to the autocomplete object,
        // so that the autocomplete requests use the current map bounds for the
        // bounds option in the request.
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
            map: map,
            anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function () {
            infowindow.close();
            marker.setVisible(false);
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                // User entered the name of a Place that was not suggested and
                // pressed the Enter key, or the Place Details request failed.
                window.alert("No details available for input: '" + place.name + "'");
                return;
            }

            // If the place has a geometry, then present it on a map.
            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);  // Why 17? Because it looks good.
            }
            marker.setPosition(place.geometry.location);
            marker.setVisible(true);

            var address = '';
            if (place.address_components) {
                address = [
                    (place.address_components[0] && place.address_components[0].short_name || ''),
                    (place.address_components[1] && place.address_components[1].short_name || ''),
                    (place.address_components[2] && place.address_components[2].short_name || '')
                ].join(' ');
            }

            infowindowContent.children['place-icon'].src = place.icon;
            infowindowContent.children['place-name'].textContent = place.name;
            infowindowContent.children['place-address'].textContent = address;
            infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
            var radioButton = document.getElementById(id);
            radioButton.addEventListener('click', function () {
                autocomplete.setTypes(types);
            });
        }
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvA4Qjj6E2adhJsz-WlmViKWKhs6HQ68M&libraries=places&callback=initMap"></script>

</body>
</html>




