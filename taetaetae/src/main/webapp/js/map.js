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
		map.onEvent('click', function (event, payload) {
			
			var positions = [];
			var positionLats = new Array();
			var positionLngs = new Array();
			var src = event.getSource();
			console.log(src.getAllMarkers());
			var coords = src.getAllMarkers();
			
			if(confirm("문자를 전송하시겠습니까?")){
				for (var i = 0; i < coords.length; i++){
							positions[i] = new olleh.maps.LatLng.valueOf(coords[i].getPosition()).x;
//							positions.push({lat: new olleh.maps.LatLng.valueOf(coords[i].getPosition()).y,
//								lng: new olleh.maps.LatLng.valueOf(coords[i].getPosition()).x});
				}
						positions = removeArrayDuplicate(positions);
						console.log(positions);
						$.ajaxSettings.traditional = true;
			 			$.post('excel/lngsSmsSend.do', {lngs: positions});
						function removeArrayDuplicate(array) {
							var a = {};
							for (var i = 0; i < array.length; i++) {
								if (typeof a[array[i]] == "undefined")
									a[array[i]] = 1;
							}
							array.length = 0;
							for ( var i in a)
								array[array.length] = i;
							return array;
						}
					}
				});
	}, true);
}
