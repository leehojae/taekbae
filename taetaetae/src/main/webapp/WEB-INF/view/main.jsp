<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>

<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">

<script type="text/javascript" src="js/bit.js"></script>
<script type="text/javascript" src="js/main.js"></script>

<link rel="stylesheet" type="text/css" href="//w2ui.com/src/w2ui-1.3.min.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="//w2ui.com/src/w2ui-1.3.min.js"></script>

</head>
<body>

<jsp:include page="/header.jsp"/>

<div id="grid" style="width: 100%; height: 250px;"></div>
<br>
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
    columns: [        
      { field: 'fname', caption: '운송장번호', size: '1.2%' },
      { field: 'lname', caption: 'Last Name', size: '30%' },
      { field: 'email', caption: 'Email', size: '40%' },
      { field: 'sdate', caption: 'Start Date', size: '120px' },
    ],
    searches: [
      { type: 'int',  field: 'recid', caption: 'ID' },
      { type: 'text', field: 'fname', caption: 'First Name' },
      { type: 'text', field: 'lname', caption: 'Last Name' },
      { type: 'date', field: 'sdate', caption: 'Start Date' }
    ],
    onExpand: function (event) {
      $('#'+event.box_id).html('<div style="padding: 10px">Expanded content</div>').animate({ 'height': 100 }, 100);
    }
  }); 
});
</script>
<iframe src="delivery/map.html" width="650" height="510"></iframe>
<jsp:include page="/tail.jsp"/>
</body>
</html>
