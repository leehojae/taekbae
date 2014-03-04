<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SDMS</title>

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="//w2ui.com/src/w2ui-1.3.min.css" />

<!-- Bootstrap -->
<link href="css/bootstrap/bootstrap.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="css/w2ui-1.3.1.min.css" /> -->
<link href="css/starter-template.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- 맵 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
$('.collapse').collapse('hide');
});
</script>
<!-- <script src="js/jquery/jquery-1.11.0.js"></script>  -->
<script type="text/javascript" src="//w2ui.com/src/w2ui-1.3.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://api.ktgis.com:10080/v3/olleh/mapAPI.js?key=T2xsZWhNYXBBUEkwMDA0OnZUMVM0TnFWZGk="></script>
<script type="text/javascript" src="js/map.js"></script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- <script type="text/javascript" src="member.js"></script> -->
</head>
<body onload="init()">
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
			   <h1>SDMS(Smart Delivery Management System)</h1>
				<ul class="nav navbar-nav">
					<li>
					<a href="#about">${loginUser.name}님</a>
					</li>
					<li>
					<a	href="${pageContext.request.contextPath}/auth/logout.do">로그아웃</a>
					</li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	
	<div class="container">

		<div class="starter-template">
			<br>
			<form enctype="multipart/form-data" action="excel/add.do"
				method="POST" id="upload_form">
				<input type="file" id="excelFile" name="excelFile" /> <input
					type="submit" value="파일 전송" />
			</form>
			
			<script type="text/javascript" src="js/excelUpload.js"></script>
			<script type="text/javascript" src="js/toolbar.js"></script>
			<br>
<!-- 			<script type="text/javascript">
			$(function() {
				var mems = null;
				var cars = null;
				var areas = null;
				var table = null;
				var tr = null;
				var html = null;
				
 				list();
				
				function list() {
					$.getJSON("member/ajax/list.do", function(data) {
						console.log(data);
						mems = data.jsonResult.data;
					});
					$.getJSON("car/ajax/list.do", function(data) {
						console.log(data);
						cars = data.jsonResult.data;
					});
					$.getJSON("area/ajax/list.do", function(data) {
						console.log(data);
						areas = data.jsonResult.data;
					});
					
					table = $('listTable');
					console.log(mems);
 					for (int i = 0; mems.length; i++){
						m = mems[i];
						c = cars[i];
						a = areas[i];
						
						tr = document.createElement('tr');
						
						html = '';
						html += '<td>1</td>';
						
						tr.innerHTML = html;
						table.appendChild(tr);
						
					}
					
				}
			});
			</script> -->
			<br>
			<div id="toolbar"
				style="padding: 4px; border: 1px solid silver; border-radius: 3px"></div>
			<br>
      
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
								<tbody>
 									<tr>
										<td>1</td>
										<td>홍길동</td>
										<td>1111</td>
										<td>강남대로</td>
										<td><button type="submit" class="btn btn-default">Submit</button></td>
									</tr>
									<tr>
										<td>2</td>
										<td>고등어</td>
										<td>2222</td>
										<td>서초대로</td>
										<td><button type="submit" class="btn btn-default">Submit</button></td>
									</tr>
									<tr>
										<td>3</td>
										<td>꽁치</td>
										<td>3333</td>
										<td>남부대로</td>
										<td><button type="submit" class="btn btn-default">Submit</button></td>
									</tr>
								</tbody>
							</table> 
						</div>
					</div>
				</div>
			</div>
			<div id="grid" style="width: 100%; height: 250px;"></div>
			<script type="text/javascript" src="js/excelGrid.js"></script>
			<div id="map" style="width: 100%; height: 768px;"></div>
		</div>
	</div>
<script type="text/javascript">
</script>
</body>
</html>