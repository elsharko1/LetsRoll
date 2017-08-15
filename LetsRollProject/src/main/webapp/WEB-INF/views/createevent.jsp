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
        <link rel="stylesheet" type="text/css" media="screen" href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
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
        #pac-input {
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
        }
    </style>
</head>
<body>
<br>
<form method="post" action = "/eventcreated">
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
    <script type="text/javascript" src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript" src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
    <script type="text/javascript">
        $('#datetimepicker').datetimepicker({setDate: new Date(), startDate: new Date(), pickSeconds: false, pick12HourFormat: true, format: "MM/dd/yyyy HH:mm PP" }).val();
    </script>
    <br>
    <%--<select name="repeat">--%>
        <%--<option value="doesnotrepeat "> -- does not repeat -- </option>--%>
        <%--<option value="daily">Repeats Daily</option>--%>
        <%--<option value="weekly">Repeats Weekly</option>--%>
        <%--<option value="monthly">Repeats Monthly</option>--%>
    <%--</select>--%>
    <%--<br>--%>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvA4Qjj6E2adhJsz-WlmViKWKhs6HQ68M&libraries=places"></script>

        <div id="pac-container">
            <input id="pac-input" type="text" placeholder="Enter event location" name="where">
        </div>
    </div>
    <div id="map"></div>
    <div id="infowindow-content">
        <img src="" width="16" height="16" id="place-icon">
        <span id="place-name"  class="title"></span><br>
        <span id="place-address"></span>
    </div>

    <script>
        function initMap() {

            var map = new google.maps.Map(document.getElementById('map'), {center: {lat: 42.3293, lng: -83.0398}, zoom: 13});
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

            autocomplete.addListener('place_changed', function() {
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
                radioButton.addEventListener('click', function() {
                    autocomplete.setTypes(types);
                });
            }
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvA4Qjj6E2adhJsz-WlmViKWKhs6HQ68M&libraries=places&callback=initMap"></script>

    <br>
    Description: <br>
    <textarea rows = "5" cols = "50" name = "description">
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
        <option value="Other">Mystery</option> <br>
    </select>
    <br>
    WheelChair Accessible:
    <select name="wheelchair">
        <option value="1">Yes</option>
        <option value="0">No</option>
        <%--<option value= "comedy">Comedy Events</option>--%>
        <%--<option value= "education">Education</option>--%>
        <%--<option value= "famFrendly">Kids & Family</option>--%>
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
    <%--<input type="checkbox" name="accessW" value="1">Wheel Chair<br>--%>
    <%--<input type="checkbox" name="accessF" value="1">Family Friendly<br>--%>
    <%--<input type="checkbox" name="accessS" value="1">Service Dog Friendly<br>--%>
    <%--<input type="checkbox" name="accessB" value="1">Blind Friendly<br>--%>
    <input type="submit" value="Register">
</form>
<br>
<a href="/homepage">Home page</a>
</body>
</html>
