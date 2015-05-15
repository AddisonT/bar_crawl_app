$(function(){
	// define center variable for making the map dynamic
	var center;
	//gets the current coords of the map
	function calculateCenter() {
		center = map.getCenter();
	}
	// initalize function to render google map
	var initialize = function() {

		var mapOptions = {
			zoom: 8,
			center: new google.maps.LatLng(37.51, -122.27)
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
			mapOptions);

	}
	google.maps.event.addDomListener(window, 'load', initialize);

// gets the path of current page
var path = location.pathname;
console.log(path);
	$.getJSON(path, function(d){
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
			//dom listener to show the bar name when marker is clicked
			google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(marker.get('map'), marker);
			});

			//dom listeners to reset the center of the map with window resizing
			google.maps.event.addDomListener(map, 'idle', function() {
				calculateCenter();
			});
			google.maps.event.addDomListener(window, 'resize', function() {
				map.setCenter(center);
			});
		}
	// console.log(d); 
	});
//}
});