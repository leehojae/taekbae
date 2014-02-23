<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SDMS</title>

<!-- Bootstrap -->
<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
  href="//w2ui.com/src/w2ui-1.3.min.css" />
<link href="css/starter-template.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery/jquery-1.11.0.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//w2ui.com/src/w2ui-1.3.min.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="//w2ui.com/src/w2ui-1.3.min.js"></script>
</head>
<body>
  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
          data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span> <span
            class="icon-bar"></span> <span class="icon-bar"></span> <span
            class="icon-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="#about"><h1>SDMS(Smart Delivery Management System)</h1></a></li>
          <li><a href="#about">${loginUser.name}님</a></li>
          <li><a href="#contact">로그아웃</a></li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
  </div>

  <div class="container">

    <div class="starter-template">
    <br>
    <form enctype="multipart/form-data" action="excel/add.do" method="POST" id="upload_form">
      <input type="file" id="excelFile" name="excelFile" />
      <input type="submit" value="파일 전송" />
</form>
    <script>
    var fileInput = document.getElementById("upload_file");
    var file = fileInput.files[0];
    var formData = new FormData();
    formData.append("excelFile" , file);

    var xhr = new XMLHttpRequest();
    xhr.open("POST" , "excel/add.do" , true);
    xhr.send(formData);
</script>

    <script type="text/javascript">
$(function () { 
  $('#toolbar').w2toolbar({
    name: 'toolbar',
    items: [
      { type: 'button',  id: 'item1',  caption: '엑셀등록', img: 'icon-page', hint: 'Hint for item 1' },
      { type: 'button',  id: 'item2',  caption: '디비초기화', img: 'icon-page', hint: 'Hint for item 2' },
      { type: 'button',  id: 'item3',  caption: '회원등록', img: 'icon-page', hint: 'Hint for item 3' },
      { type: 'button',  id: 'item4',  caption: '점소등록', img: 'icon-page', hint: 'Hint for item 4' },
      { type: 'button',  id: 'item5',  caption: '차량등록', img: 'icon-page', hint: 'Hint for item 5' },
      { type: 'button',  id: 'item5',  caption: '배송구역등록', img: 'icon-page', hint: 'Hint for item 5' },
      { type: 'spacer' },
      { type: 'html',  id: 'item6',
      html: '<div style="padding: 3px 10px;">'+
            '<a href="#">${loginUser.name}</a>'+
            '<a href="${pageContext.request.contextPath}/auth/logout.do">[로그아웃]</a>'+
            '</div>' 
      },
    ],
    onClick: function (event) {
    	switch (event.target) {
    	case 'item1':
    	  console.log('success');
    	  openPopup();
    		break;
    	}
      console.log('Target: '+ event.target, event);
    }
  });
});
</script>



<!-- <script>
$(function () {
  $('#excelFile').w2field({ type: 'upload', hint: w2utils.lang('파일넣으세요') });
});
</script>
<script type="text/javascript">
function openPopup () {
  $().w2form({
    name: 'foo',
    style: 'border: 0px; background-color: transparent;',
    formHTML: 
      '<div class="w2ui-page page-0">'+
      ' <div class="w2ui-label">엑셀파일:</div>'+
      ' <div class="w2ui-field">'+
      '   <input id="excelFile" name="excelFile" type="upload" size="35" style="height: 60px;"/>'+
      ' </div>'+
      '</div>'+
      '<div class="w2ui-buttons">'+
      ' <input type="button" value="Reset" name="reset">'+
      ' <input type="button" value="Save" name="save">'+
      '</div>',
    fields: [
      { name: 'excelFile', type: 'upload', required: true }
    ],
    options : {
      hint            : w2utils.lang('파일넣으세요'),
      max             : 0,        // max number of files, 0 - unlim
      maxSize         : 0,        // max size of all files, 0 - unlim
      maxFileSize     : 0        // max size of a single file, 0 -unlim
    },
    actions: {
      "save": function () { this.validate(); },
      "reset": function () { this.clear(); },
    }
  });

  $().w2popup('open', {
    title : '엑셀등록',
    body  : '<div id="form" style="width: 100%; height: 100%;"></div>',
    style : 'padding: 15px 0px 0px 0px',
    width : 500,
    height  : 300, 
    showMax : true,
    onMin : function (event) {
      $(w2ui.foo.box).hide();
      event.onComplete = function () {
        $(w2ui.foo.box).show();
        w2ui.foo.resize();
      }
    },
    onMax : function (event) {
      $(w2ui.foo.box).hide();
      event.onComplete = function () {
        $(w2ui.foo.box).show();
        w2ui.foo.resize();
      }
    },
    onOpen  : function (event) {
      event.onComplete = function () {
        $('#w2ui-popup #form').w2render('foo');
      }
    }
  });
}
</script> -->

<div id="toolbar" style="padding: 4px; border: 1px solid silver; border-radius: 3px"></div>
      <br>
  <div id="grid" style="width: 100%; height: 250px;"></div>
  <script type="text/javascript">
$(function () {
  $('#grid').w2grid({ 
    name: 'grid', 
    header: '금일 작업리스트',
    //url: 'data/list.json',
    show: {
      header    : true,
      toolbar   : true,
      footer    : true,
      lineNumbers : true,
      selectColumn: true,
      expandColumn: true
    },
    searches: [
               { type: 'int',  field: 'trcno', caption: '운송장번호' },
               { type: 'int', field: 'orderNo', caption: '주문번호' },
               { type: 'text', field: 'office', caption: '배송사' },
               { type: 'date', field: 'receiveDate', caption: '접수일' }
             ],
    columns: [        
      { field: 'trcno', caption: '운송장번호', size: '30%' },
      { field: 'orderNo', caption: '주문번호', size: '30%' },
      { field: 'office', caption: '배송사', size: '40%' },
      { field: 'receiveDate', caption: '접수일', size: '30%' },
      { field: 'deliverDate', caption: '배달예정일', size: '30%' },
      { field: 'senderName', caption: '보내는분', size: '30%' },
      { field: 'senderAddr', caption: '보내는분주소', size: '30%' },
      { field: 'senderTel1', caption: '보내는분전화1', size: '30%' },
      { field: 'senderTel2', caption: '보내는분전화2', size: '30%' },
      { field: 'receiverName', caption: '받는분', size: '30%' },
      { field: 'receiverAddr', caption: '받는분주소', size: '30%' },
      { field: 'receiverTel1', caption: '받는분전화1', size: '30%' },
      { field: 'receiverTel2', caption: '받는분전화2', size: '30%' },
      { field: 'sendPoint', caption: '발송점', size: '30%' },
      { field: 'receivePoint', caption: '도착점', size: '30%' },
      { field: 'packing', caption: '취급구분', size: '30%' },
      { field: 'productName', caption: '품명', size: '30%' },
      { field: 'count', caption: '수량', size: '30%' },
      { field: 'size', caption: '크기', size: '30%' },
      { field: 'weight', caption: '중량', size: '30%' },
      { field: 'payment', caption: '운임구분', size: '30%' },
      { field: 'pay', caption: '운임결제', size: '30%' },
      { field: 'returnBox', caption: '반품', size: '30%' }
    ],
    onExpand: function (event) {
      $('#'+event.box_id).html('<div style="padding: 10px">Expanded content</div>').animate({ 'height': 100 }, 100);
    }
  }); 
});
$(function(){
  $.getJSON('excel/ajax/list.do', function(data){
    var records = data.jsonResult.data;
    for (var i = 0; i < records.length; i++){
      records[i].recid = records[i].trcno;
    }
    
    console.log(records);
    w2ui.grid.records = records;
    w2ui.grid.refresh();
  });
});
</script>
<script type="text/javascript">
var addr;
var apiAddr = "http://apis.daum.net/local/geo/addr2coord?apikey=";
var apiKey = "28cfce6944a0730f400b070b2da4abbe05010b0f";
$(function(){
	$.getJSON('excel/ajax/list.do', function(data){
		addr = data.jsonResult.data[0].receiverAddr;
		
		console.log(addr);
		
		addr = encodeURI(addr);
		
		console.log(addr);
		
		test();
	});
});
function test(){
	$.getJSON(apiAddr + apiKey +"&q="+addr+"&output=json&callback=?", function(data){
		console.log(data);
		var lat = data.channel.item[0].lat;
		var lng = data.channel.item[0].lng;
		console.log(lat+" "+lng);
	});
};
</script>

      <!--   <iframe src="delivery/map.html" width="1000" height="510"></iframe>-->
    </div>

  </div>
  <!-- /.container -->

</body>
</html>