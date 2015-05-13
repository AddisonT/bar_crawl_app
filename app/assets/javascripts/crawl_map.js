$(function(){


	var initialize = function() {

		var mapOptions = {
			zoom: 8,
			center: new google.maps.LatLng(37.51, -122.27)
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
			mapOptions);

	}
	google.maps.event.addDomListener(window, 'load', initialize);

//var ran = false;
	var path = location.pathname;
	console.log(path);
	//if (!ran) {
	$.getJSON(path, function(d){
		//ran = !ran;
		//console.log("THIS IS RAND "+ran);
 		console.log(d);
	for(var i = 0; i < d.length;i++) {
		(function(k){
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(d[k].lat, d[k].lng),
				map: map,
				title: d[i].name
			});
			attachSecretMessage(marker, d[k].name);
		})(i);
	}

	map.setCenter(new google.maps.LatLng(d[0].lat, d[0].lng));
	map.setZoom(17);

	  function attachSecretMessage(marker, msg) {
    var infowindow = new google.maps.InfoWindow({
      content: msg
    });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(marker.get('map'), marker);
    });
  }
	// console.log(d); 
});
//}
});