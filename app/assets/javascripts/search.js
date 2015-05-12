  var b = [];
  var name = [];
  var view;
  var map;
     var initialize = function() {

        var mapOptions = {
            zoom: 8,
            center: new google.maps.LatLng(37.51, -122.27)
        };
        map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);

    }

    google.maps.event.addDomListener(window, 'load', initialize);
  var loc = location.search.split("&")[1]
  $.get('/search.json?'5loc, function(d){
    console.log("WORKS");
    for(var i = 0; i < d.businesses.length;i++) {
          var marker = new google.maps.Marker({
            position: new google.maps.LatLng(d.businesses[i].location.coordinate.latitude, d.businesses[i].location.coordinate.longitude),
            map: map,
            title: d.businesses[i].name
         });
    }
    map.setCenter(new google.maps.LatLng(d.region.center.latitude,d.region.center.longitude));
  });
