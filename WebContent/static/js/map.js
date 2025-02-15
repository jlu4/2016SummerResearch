/*
 * 5 ways to customize the infowindow
 * 2015 - en.marnoto.com
*/

// map center
var center = new google.maps.LatLng(40.589500, -8.683542);

// marker position
var factory = new google.maps.LatLng(40.589500, -8.683542);

function initMap() {
  var mapOptions = {
    center: center,
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById("map"),mapOptions);
  google.maps.event.addDomListener(window, "resize", function() {
    
     google.maps.event.trigger(map, "resize");
  
    });
  var geocoder = new google.maps.Geocoder();
  var infowindow = new google.maps.InfoWindow({       
          maxWidth: 250,
          maxHeight: 250         
        });


  // InfoWindow content

  /*var content = '<div id="iw-container">' +
                    '<div class="iw-title">Porcelain Factory of Vista Alegre</div>' +
                    '<div class="iw-content">' +
                      '<div class="iw-subTitle">History</div>' +
                      '<img src="images/vistalegre.jpg" alt="Porcelain Factory of Vista Alegre" height="115" width="83">' +
                      '<p>Founded in 1824, the Porcelain Factory of Vista Alegre was the first industrial unit dedicated to porcelain production in Portugal. For the foundation and success of this risky industrial development was crucial the spirit of persistence of its founder, José Ferreira Pinto Basto. Leading figure in Portuguese society of the nineteenth century farm owner, daring dealer, wisely incorporated the liberal ideas of the century, having become "the first example of free enterprise" in Portugal.</p>' +
                      '<div class="iw-subTitle">Contacts</div>' +
                      '<p>VISTA ALEGRE ATLANTIS, SA<br>3830-292 Ílhavo - Portugal<br>'+
                      '<br>Phone. +351 234 320 600<br>e-mail: geral@vaa.pt<br>www: www.myvistaalegre.com</p>'+
                    '</div>' +
                    '<div class="iw-bottom-gradient"></div>' +
                  '</div>';


  // A new Info Window is created and set content
  var infowindow = new google.maps.InfoWindow({
    content: content,

    // Assign a maximum value for the width of the infowindow allows
    // greater control over the various content elements
    maxWidth: 350
  });
   
  // marker options
  var marker = new google.maps.Marker({
    position: factory,
    map: map,
    title:"Fábrica de Porcelana da Vista Alegre"
  });

  // This event expects a click on a marker
  // When this event is fired the Info Window is opened.
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });

  // Event that closes the Info Window with a click on the map
  google.maps.event.addListener(map, 'click', function() {
    infowindow.close();
  });*/

  // *
  // START INFOWINDOW CUSTOMIZE.
  // The google.maps.event.addListener() event expects
  // the creation of the infowindow HTML structure 'domready'
  // and before the opening of the infowindow, defined styles are applied.
  // *
  //google.maps.event.addListener(infowindow, 'domready', function() {

    // Reference to the DIV that wraps the bottom of infowindow
    //var iwOuter = $('.gm-style-iw');

    /* Since this div is in a position prior to .gm-div style-iw.
     * We use jQuery and create a iwBackground variable,
     * and took advantage of the existing reference .gm-style-iw for the previous div with .prev().
    */
    /*var iwBackground = iwOuter.prev();

    // Removes background shadow DIV
    iwBackground.children(':nth-child(2)').css({'display' : 'none'});

    // Removes white background DIV
    iwBackground.children(':nth-child(4)').css({'display' : 'none'});

    // Moves the infowindow 115px to the right.
    iwOuter.parent().parent().css({left: '115px'});

    // Moves the shadow of the arrow 76px to the left margin.
    iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

    // Moves the arrow 76px to the left margin.
    iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

    // Changes the desired tail shadow color.
    iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px', 'z-index' : '1'});

    // Reference to the div that groups the close button elements.
    var iwCloseBtn = iwOuter.next();

    // Apply the desired effect to the close button
    iwCloseBtn.css({opacity: '1', right: '38px', top: '3px', border: '7px solid #48b5e9', 'border-radius': '13px', 'box-shadow': '0 0 5px #3990B9'});

    // If the content of infowindow not exceed the set maximum height, then the gradient is removed.
    if($('.iw-content').height() < 140){
      $('.iw-bottom-gradient').css({display: 'none'});
    }

    // The API automatically applies 0.7 opacity to the button after the mouseout event. This function reverses this event to the desired value.
    iwCloseBtn.mouseout(function(){
      $(this).css({opacity: '1'});
    });
  });*/

  geocoder.geocode({'address':"1"+" "+"Castle"+" "+"Point"+" "+"Terrace"+","+" "+"Hoboken"+" "+"NJ"}, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);       
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
  for (var e=0; e<Info.length; e++)
    {   
    (function (e) {
      geocoder.geocode({'address': address[e]}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            
            //map.setCenter(results[0].geometry.location);
              marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location,
              dataId:e
              
            });
            
            
              google.maps.event.addListener(marker,'click', function() {
                infowindow.close();
                infowindow.setContent('<div id="iw-container">'+'<div class="iw-title">How are you</div>'+'<div class="iw-content">'+'<div class="iw-subTtile"></div>'+'<img src="/static/Uploads/image2.jpg" height="115" width="83">'+'<p>'+Info[e]+'</p>'+'<div class="iw-subTtile">Contacts</div>'+'<p>'+'<br>Phone. +551 254 4727<br>E-mail:yzhan65@stevens.edu<br>'+'</p>'+'</div>'+'<div class="iw-bottom-gradiant"></div>'+'</div>');
                  infowindow.open(map, this);
                 console.log(e);
              });
              google.maps.event.addListener(infowindow, function() {
                var iwOuter = $('.gm-style-iw');
                var iwBackground = iwOuter.prev();
                iwBackground.children(':nth-child(2)').css({'display' : 'none'});
                iwBackground.children(':nth-child(4)').css({'display' : 'none'});
                iwOuter.parent().parent().css({left: '115px'});

                // Moves the shadow of the arrow 76px to the left margin.
                iwBackground.children(':nth-child(1)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

                // Moves the arrow 76px to the left margin.
                iwBackground.children(':nth-child(3)').attr('style', function(i,s){ return s + 'left: 76px !important;'});

                // Changes the desired tail shadow color.
                iwBackground.children(':nth-child(3)').find('div').children().css({'box-shadow': 'rgba(72, 181, 233, 0.6) 0px 1px 6px', 'z-index' : '1'});

                // Reference to the div that groups the close button elements.
                var iwCloseBtn = iwOuter.next();

                // Apply the desired effect to the close button
                iwCloseBtn.css({opacity: '1', right: '38px', top: '3px', border: '7px solid #48b5e9', 'border-radius': '13px', 'box-shadow': '0 0 5px #3990B9'});

                // If the content of infowindow not exceed the set maximum height, then the gradient is removed.
                if($('.iw-content').height() < 140){
                  $('.iw-bottom-gradient').css({display: 'none'});
                }

                // The API automatically applies 0.7 opacity to the button after the mouseout event. This function reverses this event to the desired value.
                iwCloseBtn.mouseout(function(){
                  $(this).css({opacity: '1'});
                });

              });
    
          }
        });
    }).call(this, e);
  }









}
