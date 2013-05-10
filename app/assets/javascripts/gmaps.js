$(document).ready(
  function () {
    var map;
    var markers = new Array();
    var infoWindow;

    //define the initialization function
    init = function(){
      var mapOptions = {
        center: new google.maps.LatLng(37, -100),
        zoom: 4,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      map = new google.maps.Map(document.getElementById("mapDiv"),
          mapOptions);
      
      setMarker("Chicago","red");
      setMarker("New York","red");
    }

    //define the set marker function
    setMarker = function(city, color){
      var geocoder = new google.maps.Geocoder();
			geocoder.geocode( {'address': city}, function(results,status) {
				var lat = results[0].geometry.location.lat();
				var lng = results[0].geometry.location.lng(); 

        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(lat, lng),
          map: map,
          title: city,
          icon: '/assets/' + color + '_MarkerA.png'
        });

        createInfoWindow(marker,city)
        markers.push(marker);
      });
    }

    createInfoWindow = function(marker,city){
      city = city.replace(/ /g,"_");
      var infoWindow = new google.maps.InfoWindow({
        content: "<div id='" + city + "_window' ></div>"
      });
      
      google.maps.event.addListener(marker, 'click', function() {  
        //opne the info window
        
        infoWindow.setContent(document.getElementById(city + "_tweet_info").innerHTML);
        infoWindow.open(map,marker);

      });
    }

    //call the initialization function
    init()
  }
);
