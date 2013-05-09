  GMAP {
    setup: function() {
      var mapOptions = {
        center: new google.maps.LatLng(0, 0),
        zoom: 0,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map($('#mapDiv')[0], mapOptions);

      //setMarkers();
    },
    setMarkers: function() {
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(0, 0),
        map: map,
        title:"Hello World!"
      });

      createInfoWindow(marker)
    },
    createInfoWindow: function() {
      var infoWindow = new google.maps.InfoWindow({
        content: 'this is a info about'
      });
      
      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.open(map,marker);
      });
    }
  }
  $(GMAP.setup);
