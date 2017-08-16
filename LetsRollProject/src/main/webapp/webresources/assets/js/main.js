/*jshint jquery:true */
/*global $:true */

var $ = jQuery.noConflict();

$(document).ready(function($) {
    "use strict";

    /* global google: false */

    /* ==============================================
        Full height home-section
    =============================================== */
    
	    var windowHeight = $(window).height(),
            headerHeight = $(".navbar").outerHeight(),
            calculatedHeight = windowHeight - headerHeight,
	    	topSection = $('#hero-section, .full-h-slider');
	        topSection.css('height', calculatedHeight);
            topSection.css({ 'margin-top': headerHeight });
    
    	$(window).resize(function(){
    	    var windowHeight = $(window).height(),
            headerHeight = $(".navbar").outerHeight(),
            calculatedHeight = windowHeight - headerHeight;
            topSection.css('height', calculatedHeight);
            topSection.css({ 'margin-top': headerHeight }); 
	    });


    /* ==============================================
    Full height hero-slider
    =============================================== */

        $('.full-h-slider').bxSlider({
          controls: true,
          auto: true
        });

    /* ==============================================
    Blog post slider
    =============================================== */
        $('.blog-gal-slider').bxSlider({
          controls: true,
          auto: true,
          pager: false
        });

    /* ==============================================
        Scrollspy
    =============================================== */

        $('body').scrollspy({
           target: '.one-page-nav',
           offset: 140      //px/
        });


    /* ==============================================
        Parallax
    =============================================== */
    
        $.stellar({
            responsive: true,
            horizontalScrolling: false,
            verticalOffset: 0
        });

    /* ==============================================
        Smooth Scroll on anchors
    =============================================== */  

        $(".one-page-nav").find('a').addClass("section-scroll");

        $('.section-scroll').on('click', function(e) {
            var anchor = $(this);

            $('html, body').stop().animate({
                scrollTop: $($(this).attr('href')).offset().top -62
            }, 1000);

            e.preventDefault();
        });


    /* =============================================== 
        Header animate after scroll
    =============================================== */

    (function() {

        var docElem = document.documentElement,
            didScroll = false,
            changeHeaderOn = 50;
            document.querySelector( 'header' );
            
        function init() {
            window.addEventListener( 'scroll', function() {
                if( !didScroll ) {
                    didScroll = true;
                    setTimeout( scrollPage, 100 );
                }
            }, false );
        }
        
        function scrollPage() {
            var sy = scrollY();
            if ( sy >= changeHeaderOn ) {
                $( 'header' ).addClass('active');
            }
            else {
                $( 'header' ).removeClass('active');
            }
            didScroll = false;
        }
        
        function scrollY() {
            return window.pageYOffset || docElem.scrollTop;
        }
        
        init();
        
    })();

    /* =============================================== 
        Search toogle
    =============================================== */

    var openSearch = $('.open-search'),
        SearchForm = $('.form-search'),
        closeSearch = $('.close-search');

        openSearch.on('click', function(event){
            event.preventDefault();
            
            if (!SearchForm.hasClass('active')) {

                SearchForm.fadeIn(300, function(){
                    SearchForm.addClass('active');
                });
            }
        });

        closeSearch.on('click', function(event){
            event.preventDefault();

            SearchForm.fadeOut(300, function(){
                SearchForm.removeClass('active');
                $(this).find('input').val('');
            });
        });

    /* ==============================================
        Hero slider
    =============================================== */  

        $('#slides').superslides({
            play: 10000,
            animation_speed: 800,
            pagination: true,
        });

    /* ==============================================
    superslider swipe on mobile devices
    =============================================== */

        $('#slides').swipe( {
            swipeLeft:function() {
                $(this).superslides('animate', 'next');
            },

            swiperight:function() {
                $(this).superslides('animate', 'prev');
            }
        });

    /* ==============================================
        Morphext - text rotator
    =============================================== */

        $("#text-rotator").Morphext({
            // The [in] animation type. Refer to Animate.css for a list of available animations.
            animation: "fadeInDown",
            // An array of phrases to rotate are created based on this separator. Change it if you wish to separate the phrases differently (e.g. So Simple | Very Doge | Much Wow | Such Cool).
            separator: ",",
            // The delay between the changing of each phrase in milliseconds.
            speed: 5000
        });

    /* ==============================================
        BxSlider About us
    =============================================== */ 

        $(".about-slider").bxSlider({
            auto: true,          // Boolean:  (true/false)
            pause: 5000,         // Milliseconds before progressing to next slide automatically. Use a falsey value to disable.
            adaptiveHeight: true,
            mode: 'fade',
            controls: false,
            useCSS: false        // Boolean:  (true/false)
        });

        $(".light-slider").bxSlider({
            auto: true,          // Boolean:  (true/false)
            pause: 4000,         // Milliseconds before progressing to next slide automatically. Use a falsey value to disable.
            adaptiveHeight: true,
            mode: 'fade',
            controls: false,
            useCSS: false        // Boolean:  (true/false)
        });

    /* ==============================================
     BX-Slider Banner
    =============================================== */

        $('.banner-slider').bxSlider({
          controls: false,
          auto: true
        });

    /* ==============================================
        BxSlider Testimonial
    =============================================== */ 

        $(".testimonials-slider").bxSlider({
            auto: true,          // Boolean:  (true/false)
            pause: 5000,         // Milliseconds before progressing to next slide automatically. Use a falsey value to disable.
            adaptiveHeight: true,
            controls: false,
            useCSS: false        // Boolean:  (true/false)
        });

    /* ==============================================
     BX-Slider Tweet
    =============================================== */

        $('.tweet-slider').bxSlider({
          adaptiveHeight: true,
          controls: false,
          auto: true
        });

    /* ==============================================
     fade slider
    =============================================== */

        $('.simple-slider').bxSlider({
          mode: 'fade',
          pager: false,
          adaptiveHeight: true,
          auto: true
        });

        $('.simple-slider-2').bxSlider({
          pager: false,
          adaptiveHeight: true,
          captions: true,
          auto: true
        });

    /* ==============================================
     featured-box-slider
    =============================================== */

        $('.featured-box-slider').bxSlider({
          pager: false,
          adaptiveHeight: true,
          auto: true
        });

    /* ==============================================
        slider with thumbs
    =============================================== */

        $('.slider-thumb').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });

    /*-------------------------------------------------*/
    /* =  flexslider
    /*-------------------------------------------------*/

        $('#nav-project-slider').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            itemWidth: 190,
            itemMargin: 0,
            asNavFor: '#single-project-slider'
        });

        $('#single-project-slider').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            sync: "#nav-project-slider"
        });

    /* ==============================================
        Collapse menu on click
    =============================================== */

        $('.navbar-collapse a:not(.dropdown-toggle)').click(function(){
            if($(window).width() < 768 )
                $('.navbar-collapse').collapse('hide');
        });


    /* ==============================================
     accordion
    =============================================== */

        var allPanels = $(".accordion > dd").hide();

        allPanels.first().slideDown("easeOutExpo");

        $(".accordion").each(function () {
            $(this).find("dt > a").first().addClass("active").parent().next().css({display: "block"});
        });

        $(".accordion > dt > a").click(function () {

            var current = $(this).parent().next("dd");
            $(this).parents(".accordion").find("dt > a").removeClass("active");
            $(this).addClass("active");
            $(this).parents(".accordion").find("dd").slideUp("easeInExpo");
            $(this).parent().next().slideDown("easeOutExpo");

            return false;

        });

    /* ==============================================
     toggle accordion
    =============================================== */

        var allToggles = $(".toggle > dd").hide();

        $(".toggle > dt > a").click(function () {

            if ($(this).hasClass("active")) {

                $(this).parent().next().slideUp("easeOutExpo");
                $(this).removeClass("active");

            }

            else {
                var current = $(this).parent().next("dd");
                $(this).addClass("active");
                $(this).parent().next().slideDown("easeOutExpo");
            }

            return false;
        });

        

    /* ---------------------------------------------------------------------------
     * TABS
     * --------------------------------------------------------------------------- */
     
        var $tabNavigation = $(".tabs-navigation a");
            $tabNavigation.on("click", function (e) {
                $(this).tab("show"), e.preventDefault();
                return false;
            });

    /* ==============================================
     Bootstrap Tooltip
    =============================================== */

        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });


    /* ==============================================
        Animated content
    =============================================== */

        $('.animated').appear(function(){
            var el = $(this);
            var anim = el.data('animation');
            var animDelay = el.data('delay');
            if (animDelay) {

                setTimeout(function(){
                    el.addClass( anim + " in" );
                    el.removeClass('out');
                }, animDelay);

            }
            else {
                el.addClass( anim + " in" );
                el.removeClass('out');
            }    
        },{accY: -150});  


    /* ==============================================
        Counter increment
    =============================================== */

        function countUp() {   
            var dataperc;   
            $('.statistic-percent').each(function(){
                dataperc = $(this).attr('data-perc'),
                $(this).find('.percentfactor').delay(6000).countTo({
                    from: 0,                 // number to begin counting
                    to: dataperc,      
                    speed: 1000,             // ms
                    refreshInterval: 10,
                });  
            });
        }   
        
        $('.statistic-percent').waypoint(function() {
            countUp();
        },
        {
            offset: '95%',                 
            triggerOnce: true
        });


    /* ==============================================
        Skills bar
    =============================================== */

        $('.progress-bar').each(function(i) {
            $(this).appear(function() {
                var percent = $(this).attr('aria-valuenow');
                $(this).animate({'width' : percent + '%'});
            });
        });


    /* ==============================================
        Placeholder
    =============================================== */ 

    $('input, textarea').placeholder();


    /* ==============================================
        MailChip
    =============================================== */

    $('.mailchimp').ajaxChimp({
        callback: mailchimpCallback,
        url: "http://clas-design.us10.list-manage.com/subscribe/post?u=5ca5eb87ff7cef4f18d05e127&amp;id=9c23c46672" //Replace this with your own mailchimp post URL. Don't remove the "". Just paste the url inside "".  
    });

    function mailchimpCallback(resp) {
         if (resp.result === 'success') {
            $('.subscription-success').html('<span class="icon-happy"></span><br/>' + resp.msg).fadeIn(1000);
            $('.subscription-error').fadeOut(500);
        
        } else if(resp.result === 'error') {
            $('.subscription-error').html('<span class="icon-sad"></span><br/>' + resp.msg).fadeIn(1000);
            $('.subscription-success').fadeOut(500);
        }  
    }


    /* ==============================================
        Google Map
    =============================================== */

        var mapLocation = new google.maps.LatLng(34.031428,-118.2071542,17);
        var $mapis = $('#map');
        if ($mapis.length > 0) {
            var map;
            map = new GMaps({
                streetViewControl : true,
                overviewMapControl: true,
                mapTypeControl: true,
                zoomControl : true,
                panControl : true,
                scrollwheel: false,
                center: mapLocation,
                el: '#map',
                zoom: 16,
                styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
            });
            var image = new google.maps.MarkerImage('assets/images/map-icon.png');
            map.addMarker({
                position: mapLocation,
                icon: image,
                title: 'Vortex',
                infoWindow: {
                    content: '<p><strong>Vortex</strong><br/>121 Somewhere Ave, Suite 123<br/>P: (123) 456-7890<br/>Australia</p>'
                }
            });
        }

    /* ==============================================
        featured box carousel
    =============================================== */

        $("#featured-box-carousel").owlCarousel({
 
            autoPlay: 3000, //Set AutoPlay to 3 seconds
            items : 4,
            pagination: false,
            navigation:true,
            navigationText: [
                  "<i class='fa fa-chevron-left'></i>",
                  "<i class='fa fa-chevron-right'></i>"
                  ],
            itemsDesktop : [1199,3], //number of items displayed on resolution less then 1199px
            itemsDesktopSmall : [979,3], //number of items displayed on resolution less then 979px
            itemsTablet : [768, 2]
 
        });

        $("#featured-estate-carousel").owlCarousel({
 
            autoPlay: 3000, //Set AutoPlay to 3 seconds
            items : 3,
            pagination: false,
            navigation:true,
            navigationText: [
                  "<i class='fa fa-chevron-left'></i>",
                  "<i class='fa fa-chevron-right'></i>"
                  ],
            itemsDesktop : [1199,3], //number of items displayed on resolution less then 1199px
            itemsDesktopSmall : [979,3], //number of items displayed on resolution less then 979px
            itemsTablet : [768, 2]
 
        });

    /* ==============================================
        clients carousel
    =============================================== */

        $("#clients-carousel").owlCarousel({
 
            autoPlay: 3000, //Set AutoPlay to 3 seconds
            items : 7,
            pagination: false,
            navigation:true,
            navigationText: [
                  "<i class='fa fa-chevron-left'></i>",
                  "<i class='fa fa-chevron-right'></i>"
                  ],
            itemsDesktop : [1199,3], //number of items displayed on resolution less then 1199px
            itemsDesktopSmall : [979,5], //number of items displayed on resolution less then 979px
            itemsTablet : [768, 3]
 
        });

    /* ==============================================
        Contact Form
    =============================================== */

    $('#contactform').submit(function(){

        var action = $(this).attr('action');

        $("#alert").slideUp(750,function() {
            $('#alert').hide();

        $('#submit')
            .after('<img src="assets/images/ajax-loader.GIF" class="contactloader" />')
            .attr('disabled','disabled');

        $.post(action, {
            name: $('#name').val(),
            email: $('#email').val(),
            message: $('#message').val()
        },
            function(data){
                document.getElementById('alert').innerHTML = data;
                $('#alert').slideDown('slow');
                $('#contactform img.contactloader').fadeOut('slow',function(){$(this).remove();});
                $('#submit').removeAttr('disabled');
                if(data.match('success') !== null) {
                    $('#name').val('');
                    $('#email').val('');
                    $('#message').val('');
                }
            }
        );

        });

        return false;

    });


    /* ==============================================
        Responsive video
    =============================================== */
    
        $(".project-video, .responsive-vid").fitVids();


    /* ==============================================
        MagnificPopup - lightbox effect
    =============================================== */
    
        // Example with multiple objects
        $('.zoom-lightbox').magnificPopup({
            type: 'image',
             mainClass: 'mfp-with-zoom', // this class is for CSS animation below
               zoom: {
                 enabled: true, // By default it's false, so don't forget to enable it
                 duration: 300, // duration of the effect, in milliseconds
                 easing: 'ease-in-out', // CSS transition easing function
                 opener: function(openerElement) {
                   return openerElement.is('img') ? openerElement : openerElement.find('img');
                 }
               }
        });

        $('.video-pop-up').magnificPopup({
            type: 'iframe',
        });

        // Example with multiple objects
        $('.zoom-gallery').magnificPopup({
            type: 'image',
            gallery: {
                enabled: true
            },
             mainClass: 'mfp-with-zoom', // this class is for CSS animation below
               zoom: {
                 enabled: true, // By default it's false, so don't forget to enable it
                 duration: 300, // duration of the effect, in milliseconds
                 easing: 'ease-in-out', // CSS transition easing function
                 opener: function(openerElement) {
                   return openerElement.is('img') ? openerElement : openerElement.find('img');
                 }
               }
        });

        // Example with multiple objects
        $('.zoom').magnificPopup({
            type: 'image',
            gallery: {
                enabled: true
            },

        });

    /* ==============================================
        Masonry lightbox
    =============================================== */ 

        var $mason = $('.masonry-lightbox, .masonry-projects, .masonry-blog');
        // initialize Masonry after all images have loaded  
        $mason.imagesLoaded( function() {
            $mason.masonry({
                itemSelector: ".grid-item",
                columnWidth: ".grid-sizer",
                transitionDuration: "1s", 
                percentPosition: true  
            });
        });


    /* ==============================================
        YTPlayer for video backgrounds
    =============================================== */ 

        $(".player").YTPlayer();

    /* ==============================================
        Shop Hero slider
    =============================================== */  

        $("#owl-demo").owlCarousel({
            autoPlay: 3000, //Set AutoPlay to 3 seconds
            slideSpeed: 300,
            paginationSpeed: 400,
            singleItem: true,
        });

    /* ==============================================
        price range code
    =============================================== */ 

        // Initialise noUiSlider
        $('.noUiSlider').noUiSlider({
            range: [0,1000],
            start: [150,700],
            handles: 2,
            connect: true,
            step: 1,
            serialization: {
                to: [ $('#start-val'),
                    $('#end-val') ],
                resolution: 1
            }
        });

        // Initialise noUiSlider
        $('.estate-price').noUiSlider({
            range: [15000,600000],
            start: [25000,250000],
            handles: 2,
            connect: true,
            step: 1,
            serialization: {
                to: [ $('#start-val'),
                    $('#end-val') ],
                resolution: 1
            }
        });
        
    /* ==============================================
        product increase
    =============================================== */ 
    
    var fieldNum = $('.product-details input[type="text"], .products-table input[type="text"]'),
        btnIncrease = $('button.increase'),
        btnDecrease = $('button.decrease');

        btnIncrease.on('click', function(){
            var fieldVal = fieldNum.val();
            var nextVal = parseFloat(fieldVal) + 1;
            fieldNum.val(nextVal);
        });

        btnDecrease.on('click', function(){
            var fieldVal = fieldNum.val();
            var nextVal = parseFloat(fieldVal) - 1;

            if (fieldVal > 0) {
                fieldNum.val(nextVal);
            } 

            else {
                fieldNum.val(0);
            }
        });



    /* ==============================================
        Sould out product carousel
    =============================================== */

        var owlsold = $("#sold-products-carousel");
        owlsold.owlCarousel({
            autoPlay: 8000,
            items : 4,
            itemsDesktop : [1199,4],
            itemsDesktopSmall : [979,3], //number of items displayed on resolution less then 979px
            itemsTablet : [768, 2]
        });

        // Custom Navigation Events
        $(".owl-sold-arrows .next-link").click(function(event){
            event.preventDefault();
            owlsold.trigger('owl.next');
        });
        $(".owl-sold-arrows .prev-link").click(function(event){
            event.preventDefault();
            owlsold.trigger('owl.prev');
        });

    /* ==============================================
        New product carousel
    =============================================== */

        var owlnew = $("#new-products-carousel");
        owlnew.owlCarousel({
            autoPlay: 8000,
            items : 5,
            itemsDesktop : [1199,4],
            itemsDesktopSmall : [979,3], //number of items displayed on resolution less then 979px
            itemsTablet : [768, 2]
        });

        // Custom Navigation Events
        $(".new-owl-arrows .next-link").click(function(event){
            event.preventDefault();
            owlnew.trigger('owl.next');
        });

        $(".new-owl-arrows .prev-link").click(function(event){
            event.preventDefault();
            owlnew.trigger('owl.prev');
        });

    /* ==============================================
        Related product carousel
    =============================================== */

        var owl = $("#related-products-carousel");
        owl.owlCarousel({
            autoPlay: 8000,
            items : 4,
            itemsDesktop : [1199,4],
            itemsDesktopSmall : [979,3], //number of items displayed on resolution less then 979px
            itemsTablet : [768, 2]
        });

        // Custom Navigation Events
        $(".new-owl-arrows .next-link").click(function(event){
            event.preventDefault();
            owl.trigger('owl.next');
        });

        $(".new-owl-arrows .prev-link").click(function(event){
            event.preventDefault();
            owl.trigger('owl.prev');
        });

    /* ==============================================
        Single Product slider carousel
    =============================================== */

        $('.post-slider-thumb').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });

    /* ==============================================
        owl-related-portfolio
    =============================================== */

        $(".owl-related-portfolio").owlCarousel({
 
            autoPlay: 10000, //Set AutoPlay to 3 seconds
            items : 4,
            itemsDesktop : [1199,3], //number of items displayed on resolution less then 1199px
            itemsDesktopSmall : [979,3] //number of items displayed on resolution less then 979px
 
        });

    /* ==============================================
     Bootstrap Popover
    =============================================== */

     $(function () {
        $('[data-toggle="popover"]').popover()
     });

    /* ==============================================
        OWL Carousel (initialize screenshot carousel)
    =============================================== */
    
    $(".screenshots-carousel").owlCarousel({
 
        autoPlay: 3000, //Set AutoPlay to 3 seconds
 
        items : 4,
        itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,3]
 
    });

    /* ==============================================
    Fade In .back-to-top
    =============================================== */

    $(window).scroll(function () {

        if (

            $(this).scrollTop() > 500) 

        {
            $('.back-to-top').fadeIn();
        } 

        else {
            $('.back-to-top').fadeOut();
        }
    });

    // scroll body to 0px on click
    $('.back-to-top').click(function () {
        $('html, body').animate({
            scrollTop: 0,
            easing: 'swing'
        }, 750);
        return false;
    });

});

$(window).load(function(){
    "use strict";

    /* ==============================================
    Preloader
    =============================================== */

    // will first fade out the loading animation
    $("#loading-animation").fadeOut();
    // will fade out the whole DIV that covers the website.
    $("#preloader").delay(600).fadeOut("slow");
    
    /* ==============================================
    Isotope
    =============================================== */

        // FIlter
        if( $("#filter").length>0 ) {
            var container = $('#filter');
            container.isotope({
                itemSelector: '.gallery-item',
                transitionDuration: '0.8s'
            });
            $(".filter").click(function(){
                $(".filter.active").removeClass("active");
                $(this).addClass("active");
                var selector = $(this).attr('data-filter');
                container.isotope({ 
                    filter: selector
                });
                return false;
            });

            $(window).resize(function(){
                setTimeout(function(){
                    container.isotope();
                },1000);
            }).trigger('resize');
        }

            if ( $('#type-masory').length ) {

            var $container = $('#type-masory');

            $container.imagesLoaded( function(){
              $container.fadeIn(1000).isotope({
                itemSelector : '.masonry-item'
              });
            });
        }
});