// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function(){

	  // grab the `search-res`
  // var $searchRes = $("#search-res");

  $("#inquiry").submit( function(results) {
  	s.preventDefault();
  	results.forEach(function (result) {
  		$searchRes.append("<div>" + result.content + "</div>");
   	});
  });

  // $.get("/search.json")
  // 	.done(function (results) {
  // 		results.forEach(function (result) {
  // 			$searchRes.append("<div>" + result.content + "</div>");
  // 		});
  // 	});

// // Provide your access token
// L.mapbox.accessToken = 'pk.eyJ1IjoiYWRkaXNvbnRhbSIsImEiOiJxeG5aX0xVIn0.JnYhW92yIgJvBZzvxQYPWw';
// // Create a map in the div #map
// L.mapbox.map('map', 'addisontam.m4ienfig');

});
