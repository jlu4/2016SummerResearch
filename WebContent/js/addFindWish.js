document.addEventListener('DOMContentLoaded', function() {
	doRequestUsingPost();
}, false);

function IsValidJSON(test) {
	try {
		var obj = JSON.parse(test);
		if (obj && typeof obj === "object" && obj !== null) {
			return true;
		}
	} catch (e) {

	}
	return false;
}

var xmlHttp;
function createXMLHttpRequest() {

	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
}

function createQueryString() {
	var housetype = document.getElementById("house_type").value;
	var h_area = document.getElementById("h_area").value;
	var roomtype = document.getElementById("room_type").value;
	var sex = document.getElementById("sex").value;
	var maxprice = document.getElementById("maxprice").value;
	var minprice = document.getElementById("minprice").value;
	var queryString = "housetype=" + housetype + "&h_area=" + h_area
			+ "&roomtype=" + roomtype + "&sex=" + sex + "&maxprice=" + maxprice
			+ "&minprice=" + minprice;
	return queryString;
}

function doRequestUsingGET() {
	createXMLHttpRequest();
	var queryString = "./FindAllHouseCL?";
	queryString = queryString + createQueryString() + "&timeStamp="
			+ new Date().getTime();
	xmlHttp.onreadystatechange = handleStateChange;
	xmlHttp.open("GET", queryString, true);
	xmlHttp.send(null);
}

function doRequestUsingPost() {
	$('#demo').empty();
	createXMLHttpRequest();
	var url = "./FindAllHouseCL?timeStamp=" + new Date().getTime();
	var queryString = createQueryString();
	xmlHttp.open("POST", url, true);
	xmlHttp.onreadystatechange = handleStateChange;
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttp.send(queryString);
}

function handleStateChange() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {
			parseResults();

		}
	}
}

function parseResults() {

	var text = '{"housing":' + xmlHttp.responseText.toString() + "}";

	var response = JSON.parse(text);
	var Info = [];
	var address = [];
	var Coordinate = [];
	var image = [];
	var Img = [];
	for ( var x in response.housing) {
		image.push(response.housing[x].uimgpath);
		console.log(image[x].split("#")[0]);
		// console.log(image[x]);
		Info
				.push('<div>'
						+ '<div class="list-group-item list-group-item-info" style="border-radius:6px">'
						+ "<strong>" + "$" + " "
						+ response.housing[x].price
						+ "</strong>"
						+ "</div>"
						+ "<br>"
						+ '<p style="margin-left:20px">'
						+ response.housing[x].title
						+ '<img id="image" src="" style="text-aligh:right; width:80px; height:80px" class="pull-right">'
						+ "<br>"
						+ response.housing[x].h_area
						+ "<br>"
						+ response.housing[x].housetype
						+ "<br>"
						+ response.housing[x].roomtype
						+ "<br>"
						+ response.housing[x].h_location
						+ "<br>"
						+ response.housing[x].sex
						+ "<br>"
						+ response.housing[x].phonenumber
						+ "<br>"
						+ response.housing[x].id
						+ "<br>"
						+ response.housing[x].houseinfo + "</p>" + "</div>");
		
		address.push(response.housing[x].h_location + " "
				+ response.housing[x].h_area + "," + "NJ");
		if (response.housing[x].coordinate != null) {
			Coordinate.push(response.housing[x].coordinate);
		}
	}
	

	var Results = '<div>'
			+ '<div class="list-group-item list-group-item-success" style="border-radius:6px">'
			+ "<strong>" + "Rental Listings" + '</strong>'
			+ '<span class="pull-right">' + Info.length + " " + "results"
			+ '</span>' + '</div>' + '</div>' + '<br>';

	for (i = 0; i < Info.length; i++) {
		// frameCon += Info[i];
		Results += Info[i];

	}
	document.getElementById("Results").innerHTML = Results;
	//document.getElementById("image").src = image[0].split("#")[0].replace("/Users/Eric/Documents/Summerproject/webproject02/WebContent", "");
	document.getElementById("image").src = image[0].split("#")[0];	
	//document.getElementById("image").src = "/img/zhang/1.jpg";

	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 14,
		center : {
			lat : -34.397,
			lng : 150.644
		}
	});
	google.maps.event.addDomListener(window, "resize", function() {

		google.maps.event.trigger(map, "resize");

	});
	var geocoder = new google.maps.Geocoder();
	var infowindow = new google.maps.InfoWindow({
		maxWidth : 350,
		maxHeight : 250
	});
	geocoder.geocode({
		'address' : "1" + " " + "Castle" + " " + "Point" + " " + "Terrace"
				+ "," + " " + "Hoboken" + " " + "NJ"
	}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {
			map.setCenter(results[0].geometry.location);
		} else {
			alert('Geocode was not successful for the following reason: '
					+ status);
		}
	});
	for (var e = 0; e < Info.length; e++) {
		(function(e) {
			if (Coordinate[e] != null) {
				var Coord = Coordinate[e].split(",");
				var myLatlng = new google.maps.LatLng(Coord[0], Coord[1]);

				// geocoder.geocode({'address': address[e]}, function(results,
				// status) {
				// if (status === google.maps.GeocoderStatus.OK) {
				// var myLatLng = {lat: coordinate[e][0], lng:
				// coordinate[e][1]};
				// map.setCenter(results[0].geometry.location);
				marker = new google.maps.Marker({
					map : map,
					// position: results[0].geometry.location,
					position : myLatlng,
					dataId : e

				});
			}

			google.maps.event
					.addListener(
							marker,
							'click',
							function() {
								infowindow.close();
								infowindow
										.setContent('<div id="iw-container">'
												+ '<div class="iw-content">'
												+ '<div class="iw-subTtile"></div>'
												+ '<p>'
												+ Info[e]
												+ '</p>'
												+ '<div class="iw-subTtile">Contacts</div>'
												+ '<p>'
												+ '<br>Phone. +551 254 4727<br>E-mail:yzhan65@stevens.edu<br>'
												+ '</p>'
												+ '</div>'
												+ '<div class="iw-bottom-gradiant"></div>'
												+ '</div>');
								infowindow.open(map, this);

								console.log(e);
							});

			// }
			// });
		}).call(this, e);
	}
	

}
function SortLowToHigh() {

	var text = '{"housing":' + xmlHttp.responseText.toString() + "}";

	var response = JSON.parse(text);
	var Info = [];
	var image = [];
	var Img = [];
	var img = [];
	var associativePrice = {};
	for ( var x in response.housing) {
		image.push(response.housing[x].uimgpath);
		Info
				.push('<div>'
						+ '<div class="list-group-item list-group-item-info" style="border-radius:6px">'
						+ "<strong>" + "$" + " "
						+ response.housing[x].price
						+ "</strong>"
						+ "</div>"
						+ "<br>"
						+ '<p style="margin-left:20px">'
						+ response.housing[x].title
						+ '<img id="image" src="" style="text-aligh:right; width:80px; height:80px" class="pull-right">'
						+ "<br>"
						+ response.housing[x].h_area
						+ "<br>"
						+ response.housing[x].housetype
						+ "<br>"
						+ response.housing[x].roomtype
						+ "<br>"
						+ response.housing[x].h_location
						+ "<br>"
						+ response.housing[x].sex
						+ "<br>"
						+ response.housing[x].phonenumber
						+ "<br>"
						+ response.housing[x].id
						+ "<br>"
						+ response.housing[x].houseinfo + "</p>" + "</div>");

	}

	var keys = [];
	for (x in response.housing) {
		associativePrice[response.housing[x].price] = Info[x];
		keys.push(response.housing[x].price);
	}

	keys.sort(function(a, b) {
		return a - b
	});

	var Results1 = '<div>'
			+ '<div class="list-group-item list-group-item-success" style="border-radius:6px">'
			+ "<strong>" + "Rental Listings" + '</strong>'
			+ '<span class="pull-right">' + Info.length + " " + "results"
			+ '</span>' + '</div>' + '</div>' + '<br>';

	for (var i = 0; i < Info.length; i++) {

		Results1 += associativePrice[keys[i]];

	}
	document.getElementById("Results").innerHTML = Results1;
}

function SortHighToLow() {

	var text = '{"housing":' + xmlHttp.responseText.toString() + "}";

	var response = JSON.parse(text);
	var Info = [];
	var image = [];
	
	var associativePrice = {};
	for ( var x in response.housing) {
		image.push(response.housing[x].uimgpath);
		Info
				.push('<div>'
						+ '<div class="list-group-item list-group-item-info" style="border-radius:6px">'
						+ "<strong>" + "$" + " "
						+ response.housing[x].price
						+ "</strong>"
						+ "</div>"
						+ "<br>"
						+ '<p style="margin-left:20px">'
						+ response.housing[x].title
						+ '<img id="image" src="" style="text-aligh:right; width:80px; height:80px" class="pull-right">'
						+ "<br>"
						+ response.housing[x].h_area
						+ "<br>"
						+ response.housing[x].housetype
						+ "<br>"
						+ response.housing[x].roomtype
						+ "<br>"
						+ response.housing[x].h_location
						+ "<br>"
						+ response.housing[x].sex
						+ "<br>"
						+ response.housing[x].phonenumber
						+ "<br>"
						+ response.housing[x].id
						+ "<br>"
						+ response.housing[x].houseinfo + "</p>" + "</div>");

	}

	var keys = [];
	for (x in response.housing) {
		associativePrice[response.housing[x].price] = Info[x];
		keys.push(response.housing[x].price);
	}

	keys.sort(function(a, b) {
		return b - a
	});

	// associativePrice.sort();
	
	var Results1 = '<div>'
			+ '<div class="list-group-item list-group-item-success" style="border-radius:6px">'
			+ "<strong>" + "Rental Listings" + '</strong>'
			+ '<span class="pull-right">' + Info.length + " " + "results"
			+ '</span>' + '</div>' + '</div>' + '<br>';

	for (var i = 0; i < Info.length; i++) {
		//frameCon += Info[i];

		Results1 += associativePrice[keys[i]];
		//console.log(associativePrice[k].value);

	}
	document.getElementById("Results").innerHTML = Results1;
}
