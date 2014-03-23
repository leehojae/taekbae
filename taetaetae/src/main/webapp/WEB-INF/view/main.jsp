<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>SDMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- 스타일 -->
    <link href="assets/css/bootstrap-ko.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
      
#introLoading {
 position: absolute;
 width: 300px;
 height: 150px;
 margin: -150px 0 0 -75px;
 top: 50%;
 left: 50%;
}
      
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- IE6~8에서 HTML5 태그를 지원하기위한 HTML5 shim -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- 파비콘과 앱 아이콘 -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
                                   
    <link rel="stylesheet" type="text/css" href="//w2ui.com/src/w2ui-1.3.min.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script type="text/javascript" src="//w2ui.com/src/w2ui-1.3.min.js"></script>
<script type="text/javascript">
		var datas = new Array();
	$(function() {
		$('.collapse').collapse('hide');
	});
$(document).ready(function(){
	   $('#introLoading').hide();
});
function testMethod() {
	$('#introLoading').show();
  /* location.reload(); */
};
</script>
<script type="text/javascript"
  src="http://api.ktgis.com:10080/v3/olleh/mapAPI.js?key=T2xsZWhNYXBBUEkwMDA0OnZUMVM0TnFWZGk="></script>
<script type="text/javascript" src="js/map.js"></script>

</head>

  <body onload="init()">
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">SDMS(Smart Delivery Management System)</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              <a href="#" class="navbar-link">${loginUser.name}</a>으로 로그인됨
            </p>

          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          
           <div class="well sidebar-nav">
            <ul class="nav nav-list">
             <li><a href="office/list.do">사업소목록</a></li>
              <li><a href="member/list.do">직원목록</a></li>
              <li><a href="car/list.do">차량목록</a></li>
              <li><a href="area/list.do">배송구역목록</a></li>
            </ul>
          </div><!--/.well -->
          
        </div><!--/span-->
        <div class="span9">
					<form role="form" enctype="multipart/form-data" action="excel/add.do"
          method="POST" id="upload_form">
						<div class="form-group">
						<img id=introLoading src='images/loading.gif' />
<!-- 							<label for="exampleInputFile">File input</label> -->
							 <input type="file" id="excelFile" name="excelFile" />
							<button type="submit" class="btn btn-default">파일 전송</button>
<!-- 							<p class="help-block">Example block-level help text here.</p> -->
						</div>
					</form>
							<button type="button" class="test" onclick="testMethod()" >테스트</button>
				<script type="text/javascript" src="js/excelUpload.js"></script>
				<hr>
				<!-- 				<div class="hero-unit">
				</div> -->
				
				<div class="panel-group" id="accordion">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" data-parent="#accordion"
                href="#collapseOne">
                배송직원 리스트
              </a>
            </h4>
          </div>
          <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-body">
              <table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>이름</th>
                    <th>차량</th>
                    <th>담당구역</th>
                    <th>전송</th>
                  </tr>
                </thead>
                <tbody id="tableData">
                  <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                      String jdbcDriver = "jdbc:mysql://localhost/spmsdb?useUnicode=true&amp;characterEncoding=UTF-8";
                      String dbUser = "spms";
                      String dbPwd = "spms";
                      conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);

                      pstmt = conn
                          .prepareStatement("SELECT a.MNAME, b.CAR_NUM, c.TASK_AREA FROM MEMBERS a, CARS b, AREAS c WHERE a.MNO = b.MNO AND a.MNO=c.MNO");
                      rs = pstmt.executeQuery();
                      int count = 0;
                      while (rs.next()) {
                        count++;
                  %>
                  <tr>
                    <td><%=count%></td>
                    <td><%=rs.getString("mname")%></td>
                    <td><%=rs.getString("car_num")%></td>
                    <td><%=rs.getString("task_area")%></td>
                    <td><button id="<%=rs.getString("car_num")%>" type="submit"
                        class="btn btn-default" onclick="testMethod()")>Submit</button></td>
                  </tr>
                  <%
                    }
                    } catch (SQLException se) {
                      se.printStackTrace();
                    } finally {
                      if (rs != null)
                        rs.close();
                      if (pstmt != null)
                        pstmt.close();
                      if (conn != null)
                        conn.close();
                    }
                  %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
				<script type="text/javascript">
				
					$(document).ready(function() {
						$('.btn').click(function() {
							$('#introLoading').show();
							update(this);
							/* location.reload(); */
						});

						function update(obj) {
							var index = obj.parentNode.parentNode.rowIndex;
							var row = document.getElementById("tableData").rows[index - 1];
							var params = null;
							var loopCount = null;
							
			        function timeTable (trcno, delayTime, index, lat, lng){
			         this.trcno = trcno;
			         this.delayTime = delayTime;
			         this.index = index;
			         this.lat = lat;
			         this.lng = lng;
			        }; 
							
							$.ajax({
								type:"POST",
								url: "excel/divide.do",
								async: false, 
								global : true, 
								data : {id : row.cells[0].innerHTML,
								receiverAddrRoad : row.cells[3].innerHTML},
								beforeSend : function () {
									$('#introLoading').show();							  
								},
								success : function(data){
									testMethod();
									console.log(data);
									console.log(data.excelList[0].lat);
									console.log(data.excelList.length);
									loopCount = data.excelList.length;
									
								  function delayTime(data) {
									 for (var i = 0 ,item; item = data.excelList[i]; i++){
									
									  params = null;
									  params = "version=1&reqCoordType=WGS84GEO"; 
								    params += "&startX=127.02801704406481&startY=37.494539069596186"; 
								    params += "&endX="+ item.lng+"&endY="+item.lat+"&appKey=6a18b782-3680-3c86-98b6-73887bafb90e"; 
								  
								    $.ajax({ 
								     type : "POST", 
								     url : "https://apis.skplanetx.com/tmap/routes", 
								     async: false, 
								     global : true, 
								     data : params, 
								     dataType:"JSON", 
								     success : function(timeData) {
								  	
								  	  console.log(item.trcno);
								  	
                      datas[i] = new timeTable(item.trcno, timeData.features[0].properties.totalTime, i, item.lat, item.lng);
								     }, 
								     error : function(xhr, status, error) { 
								      alert(error) 
								     } 
								      }); 
									  };
									    return datas;
								  };
								
                function delayTime2(data, lat, lng) {
                  for (var i = 0 ,item; item = data.excelList[i]; i++){
                	    if(item.lat == lat && item.lng == lng){
                	    	params = null;
                            params = "version=1&reqCoordType=WGS84GEO"; 
                            params += "&startX="+ (lng+0.00000000000001) +"&startY=" + (lat+0.00000000000001); 
                            params += "&endX="+ item.lng+"&endY="+item.lat+"&appKey=6a18b782-3680-3c86-98b6-73887bafb90e";
                	    }
                	 params = null;
                   params = "version=1&reqCoordType=WGS84GEO"; 
                   params += "&startX="+ lng +"&startY=" + lat; 
                   params += "&endX="+ item.lng+"&endY="+item.lat+"&appKey=6a18b782-3680-3c86-98b6-73887bafb90e"; 
                 
                   $.ajax({ 
                    type : "POST", 
                    url : "https://apis.skplanetx.com/tmap/routes", 
                    async: false, 
                    global : true, 
                    data : params, 
                    dataType:"JSON", 
                    success : function(timeData) {
                   
                     console.log(item.trcno);
                   
                     datas[i] = new timeTable(item.trcno, timeData.features[0].properties.totalTime, i, item.lat, item.lng);
                    }, 
                    error : function(xhr, status, error) { 
                     alert(error) 
                    } 
                   }); 
                  };
                 return datas;
               };
								
                function delayTime3(data, lat, lng) {
                 console.log("3");
                 console.log(data);
                   params = null;
                   params = "version=1&reqCoordType=WGS84GEO"; 
                   params += "&startX="+ lng +"&startY=" + lat; 
                   params += "&endX="+ data.excelList[0].lng+"&endY="+data.excelList[0].lat+"&appKey=6a18b782-3680-3c86-98b6-73887bafb90e"; 
                 
                   $.ajax({ 
                    type : "POST", 
                    url : "https://apis.skplanetx.com/tmap/routes", 
                    async: false, 
                    global : true, 
                    data : params, 
                    dataType:"JSON", 
                    success : function(timeData) {
                    console.log("success");
                    console.log(timeData);
                     datas = new timeTable(data.excelList[0].trcno, timeData.features[0].properties.totalTime, 0, data.excelList[0].lat, data.excelList[0].lng);
                    }, 
                    error : function(xhr, status, error) { 
                     alert(error) 
                    } 
                   }); 
                   console.log("datasuccess");
                   console.log(datas);
                 return datas;
               };
               
								function minTimeUpdate(datas, count){
										 var min = datas[0].delayTime;
										 for (var ii = 0, item; item = datas[ii]; ii++){
											 if(min >= item.delayTime){
												 min = item;
											 }
											   
											 }
										  $.ajaxSettings.traditional = true;
  									  $.ajax({
										    type   : "POST",
										    url    : "excel/insertTime.do",
										    async  : false, 
										    global : true, 
										    data   : {trcno     : min.trcno, 
										              delayTime : min.delayTime,  
										              stateNum  : count + 1}, 
										    dataType : "JSON", 
										    success  : function(timeData) {
									  	  
										    },
										    error : function(xhr, status, error) {
										    	
										    }
										  });
  									  return min;
  							};
               
								function lastTimeUpdate(datas, count){
											min = datas;
										  $.ajaxSettings.traditional = true;
  									  $.ajax({
										    type   : "POST",
										    url    : "excel/insertTime.do",
										    async  : false, 
										    global : true, 
										    data   : {trcno     : min.trcno, 
										              delayTime : min.delayTime,  
										              stateNum  : count + 1}, 
										    dataType : "JSON", 
										    success  : function(timeData) {
									  	  
										    },
										    error : function(xhr, status, error) {
										    	
										    }
										  });
  							};
  							
  						  datas = delayTime(data);
									
								min = minTimeUpdate(datas, 0);
								 
								data.excelList.splice(min.index,1);
								  
								for (var iii = 0; iii < loopCount-1; iii++){
//								  for (var iii = 0, item; item = data.excelList[iii]; iii++){
								    
								 if (iii != loopCount-2) {
								  	
								  datas = delayTime2(data, min.lat, min.lng);
								  
								  min = minTimeUpdate(datas, iii+1);
								  
								  data.excelList.splice(min.index,1);
								    
								 }
								  console.log(data);
								 if (iii == loopCount-2) {
								    	
								  console.log(data);
								    
    							datas = delayTime3(data, min.lat, min.lng);
				 				  
					    		lastTimeUpdate(datas, iii+1);

								 }
								 
                 }
								},
								error : function(e){
									console.log(e+"error");
								},
								complete : function() {
							     $('#introLoading').hide();
						      alert("전송완료");
							  }
							});
						};
					});
				</script>
				<hr>
      <div id="grid" style="width: 100%; height: 250px;"></div>
      <script type="text/javascript" src="js/excelGrid.js"></script>
      <hr>
      <div id="map" style="width: 100%; height: 768px;"></div>
				<div class="row-fluid">
          </div><!--/row-->
        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; 비트 2014</p>
      </footer>

    </div><!--/.fluid-container-->

    <!-- 자바스크립트
    ================================================== -->
    <!-- 페이지를 빨리 읽어들이도록 문서 마지막에 배치 -->
<!--     <script src="assets/js/jquery.js"></script> -->
    <script src="assets/js/bootstrap-transition.js"></script>
    <script src="assets/js/bootstrap-alert.js"></script>
    <script src="assets/js/bootstrap-modal.js"></script>
    <script src="assets/js/bootstrap-dropdown.js"></script>
    <script src="assets/js/bootstrap-scrollspy.js"></script>
    <script src="assets/js/bootstrap-tab.js"></script>
    <script src="assets/js/bootstrap-tooltip.js"></script>
    <script src="assets/js/bootstrap-popover.js"></script>
    <script src="assets/js/bootstrap-button.js"></script>
    <script src="assets/js/bootstrap-collapse.js"></script>
    <script src="assets/js/bootstrap-carousel.js"></script>
    <script src="assets/js/bootstrap-typeahead.js"></script>

  </body>
</html>