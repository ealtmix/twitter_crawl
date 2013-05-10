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
      
      var cities = document.getElementById("cities").innerHTML
      cities = cities.split("\", \"")
      for(var i = 0; i < cities.length; i++)
      {
        setMarker(cities.pop())
      }
    }

    //define the set marker function
    setMarker = function(city){
      var geocoder = new google.maps.Geocoder();
			geocoder.geocode( {'address': city}, function(results,status) {
				var lat = results[0].geometry.location.lat();
				var lng = results[0].geometry.location.lng(); 

        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(lat, lng),
          map: map,
          title: city
        });

        createInfoWindow(marker,city)
        markers.push(marker);
      });
    }

    createInfoWindow = function(marker,city){
      var infoWindow = new google.maps.InfoWindow({
        content: "<div id='" + city + " window' ></div>"
      });
      
      google.maps.event.addListener(marker, 'click', function() {
        if(infoWindow)
						infoWindow.close();
    
        //update the content of the window
        updateWindow(city); 
        
        //opne the info window
        infoWindow.open(map,marker);
      });
    }

    updateWindow = function(city){
      document.getElementById(city + " window").innerHTML = document.getElementById(city + " tweet_info");
    }

    //call the initialization function
    init()
  }
);
