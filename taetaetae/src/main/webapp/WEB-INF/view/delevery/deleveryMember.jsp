<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>배송목록</title>

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="//w2ui.com/src/w2ui-1.3.min.css" />

<!-- Bootstrap -->
<link href="../css/bootstrap/bootstrap.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="css/w2ui-1.3.1.min.css" /> -->
<link href="../css/starter-template.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- 맵 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="//w2ui.com/src/w2ui-1.3.min.js"></script>
<script src="../js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://api.ktgis.com:10080/v3/olleh/mapAPI.js?key=T2xsZWhNYXBBUEkwMDA0OnZUMVM0TnFWZGk="></script>
<script type="text/javascript" src="../js/map.js"></script>



<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"> -->
<!--   <script src="//code.jquery.com/jquery-1.9.1.js"></script> -->
<!--   <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->
  <style type="text/css">
  	header{
    width: 100%;
    background: yellow;
    position: fixed; 
    top: 0;
    height: 25px !important;
    z-index:100;
}
  
  </style>
  <script>
  $(function() {
	
  // accordionOption();
	  load_list();
   alert("4444");
  }
 
  );
  
  //
  

  
  //
		
  function load_list() {
   $.getJSON('ajax/list.do', function(data) {
		var records = data.jsonResult.data;
		var contents = '<div id="accordion" class="ui-accordion ui-widget ui-helper-reset" role="tablist">';
		console.log("records : " + records);
		
		for (var i = 0; i < 10; i++){
		
		 $('#accordion').append(   '<div class="panel panel-default">'
					+'    <div class="panel-heading">'
					+'       <h4 class="panel-title">'
					+'         <a data-toggle="collapse" data-parent="#accordion" href="#'+records[i].receiverName+' ">'
					+' 	  '+records[i].receiverName+'      </a>'
					+' 	      </h4>'
					+' 	    </div>'
					+' 	    <div id="'+records[i].receiverName+'" class="panel-collapse collapse in">'
					+' 	      <div class="panel-body">'
					+'        '+records[i].receiverName+'   Collapsible Group Item #1'
					+'        '+records[i].member+'   Collapsible Group Item #1'
					+'        '+records[i].deliverEndDate+'   Collapsible Group Item #1'
					+'        '+records[i].senderName+'   Collapsible Group Item #1'
					+'        '+records[i].receiverAddrDo+'   Collapsible Group Item #1'
					+'        '+records[i].receiverAddrDo+'   Collapsible Group Item #1'
					+'       </div>'
					+' 	    </div>'
					+' 	  </div>'  
		 );
  }
			
   });
  }
  
	
  
  
  </script>
</head>
<body>

          <select>
      <option>배송중</option>
      <option>배송완료</option>
      <option>수취인불명</option>
      <option>주소 불확실</option>
    </select>
    <select>
            <option>도로명</option>
             <option>번지명</option>
      </select>
      <input type="button" name="버튼" value="배송처리" onclick="location.href='#"/>
      <input type="button" name="버튼" value="설정" onclick="location.href='map.html'"/>
<div class="panel-group" id="accordion">
  

</div>
 
</body>
</html>