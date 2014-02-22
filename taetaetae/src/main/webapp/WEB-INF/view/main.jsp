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
          <li><a href="${pageContext.request.contextPath}/auth/logout.do">로그아웃</a></li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
  </div>

  <div class="container">

    <div class="starter-template">
    <br>
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
      console.log('Target: '+ event.target, event);
    }
  });
});
</script>

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
</script>
      <iframe src="delivery/map.html" width="1000" height="510"></iframe>
    </div>

  </div>
  <!-- /.container -->

</body>
</html>