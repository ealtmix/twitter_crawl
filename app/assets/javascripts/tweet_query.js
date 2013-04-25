$(document).ready(
  function () {
    var map;
    var markers = new Array();
    //define the initialization function
    init = function(){
      var mapOptions = {
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      map = new google.maps.Map(document.getElementById("mapDiv"),
          mapOptions);

      setMarkers();
    }

    //define the set marker function
    setMarkers = function(){
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(-34.397, 150.644),
        map: map,
        title:"Hello World!"
      });

      createInfoWindow(marker)
      markers.push(marker);
    }

    createInfoWindow = function(marker){
      var infoWindow = new google.maps.InfoWindow({
        content: 'this is a info about'
      });
      
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
      });
    }

    //call the initialization function
    init()
  }
);
