var addr;
var apiAddr = "http://apis.daum.net/local/geo/addr2coord?apikey=";
var apiKey = "28cfce6944a0730f400b070b2da4abbe05010b0f";
var lat;
var lng;
var lats;
var lngs;
var addrs;
var encodeAddrs = [];
var temp;
var temps = [];
var markLatLngs = [];

function MarkLatLng(lats, lngs) {
  this.lats = lats;
  this.lngs = lngs;
}

$(function() {
  $.getJSON('excel/ajax/list.do', function(data) {
    addr = data.jsonResult.data;
    encodeAddr = addr;
      encodeAddr.receiverAddr = encodeURIComponent(addr.receiverAddr);
      test(encodeAddr.receiverAddr);
 }, false);
  
});

var test = function(temp) {
  $.getJSON(
      apiAddr + apiKey + "&q=" + temp + "&output=json&callback=?",
      function(data) {
        lat = data.channel.item[0].lat;
        lng = data.channel.item[0].lng;
      }, false);
};
/* function test(temp) {
}; */

var mapOpts;
var map;
var clusterer;
var marker;
  function init() {
    mapOpts = {
      zoom : 8,
      //center : new olleh.maps.UTMK(953755.70, 1949715.52),
      center : new olleh.maps.LatLng(37.483297771883926, 127.00316128181164),
      mapTypeId : 'ROADMAP'
    };
    map = new olleh.maps.Map(document.getElementById('map'), mapOpts);

    clusterer = new olleh.maps.overlay.MarkerClusterer({
      gap : 100
    });
    /* marker = new olleh.maps.overlay.Marker({
      position : new olleh.maps.LatLng(lat,lng)
    });
    clusterer.add(marker);
    clusterer.setMap(map); */
  }
/*   function addMark() {
    for (var i = 0; i < 1000; i++) {
      marker = new olleh.maps.overlay.Marker({
        position : new olleh.maps.LatLng(lat,lng)
      });
      clusterer.add(marker);
    }
    clusterer.setMap(map);
  } */
  function addMark(){
  for (var i = 0; i < 1000; i++) {
    var marker = new olleh.maps.overlay.Marker({
    	position : new olleh.maps.LatLng(lat,lng)
    });
    clusterer.add(marker);
  }
  clusterer.setMap(map);
}
