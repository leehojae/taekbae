<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
												class="btn btn-default" value="1212">Submit</button></td>
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
			<div id="grid" style="width: 100%; height: 250px;"></div>
			<script type="text/javascript" src="js/excelGrid.js"></script>
							<script type="text/javascript">
							$(document).ready(function(){
								$('.btn').click(function(){
									update(this);
									alert("전송완료");
									location.reload();
								});
								
								function update(obj) {
									var index = obj.parentNode.parentNode.rowIndex;
									var row = document.getElementById("tableData").rows[index-1];
									$.post('excel/divide.do', {
										id:row.cells[0].innerHTML,
										receiverAddrRoad:row.cells[3].innerHTML
									});
								}
							});
							</script> 
			<div id="map" style="width: 100%; height: 768px;"></div>
		</div>
	</div>
</body>
</html>