var map;
var timeoutId = window.setTimeout(function(){

//  var map;
var initialize = function() {

  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(37.51, -122.27)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);

}
google.maps.event.addDomListener(window, 'load', initialize);
}, 0);

var loc = location.search.split("&")[1]
$.get('/search.json?'+loc, function(d){
  console.log("WORKS");
  for(var i = 0; i < d.businesses.length;i++) {
    (function(k){
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(d.businesses[k].location.coordinate.latitude, d.businesses[k].location.coordinate.longitude),
        map: map,
        title: ""+k+""
      });
      attachSecretMessage(marker, d.businesses[k].name);
    })(i);
  }

  map.setCenter(new google.maps.LatLng(d.region.center.latitude, d.region.center.longitude));
  map.setZoom(15);

  function attachSecretMessage(marker, msg) {
    var infowindow = new google.maps.InfoWindow({
      content: msg
    });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(marker.get('map'), marker);
      var check =  $('#'+marker.title).find('input').prop('checked');
      $('#'+marker.title).find('input').prop('checked',!check);
      // console.log(marker.title);
    });
  }
});





