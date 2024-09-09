
function initMap(propertyId, lat, lng, title) {
	const propertyLocation = { lat: lat, lng: lng };

	const map = new google.maps.Map(document.getElementById("map-" + propertyId), {
		center: propertyLocation,
		zoom: 15,
	});

	new google.maps.Marker({
		position: propertyLocation,
		map: map,
		title: title
	});
}

function toggleMap(propertyId, lat, lng, title) {
	const mapElement = document.getElementById("map-" + propertyId);
	if (mapElement.style.display === "none") {
		mapElement.style.display = "block";
		initMap(propertyId, lat, lng, title);
	} else {
		mapElement.style.display = "none";
	}
}