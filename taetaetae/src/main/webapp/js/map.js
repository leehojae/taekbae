function init() {
	var mapOpts;
	var map;
	var clusterer;
	var marker;
	var addr;
	var lat;
	var lng;

	mapOpts = {
		zoom : 8,
		center : new olleh.maps.LatLng(37.490086196657664, 127.01953478052013),
		mapTypeId : 'ROADMAP'
	};
	map = new olleh.maps.Map(document.getElementById('map'), mapOpts);

	clusterer = new olleh.maps.overlay.MarkerClusterer({
		gap : 100,
		clusterOpts : {
			clickToZoom : false,
			clickToExpand : false
		}
	});
	$.getJSON('excel/ajax/list.do', function(data) {
		addr = data.jsonResult.data;
		for (var i = 0; i < addr.length; i++) {
			marker = new olleh.maps.overlay.Marker({
				position : new olleh.maps.LatLng(addr[i].lat, addr[i].lng)
			});
			clusterer.add(marker);
		}
		clusterer.setMap(map);
		console.log(marker);
		console.log(clusterer);
		clusterer.onEvent = marker.onEvent;
		clusterer.onEvent('click', function (event, payload) {
			alert("12");
		});
	}, true);
//	marker.onEvent('click', function (event, payload) {
//		 map.zoomIn();
//	 });
}
