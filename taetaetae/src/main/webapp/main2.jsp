<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SDMS 시작화면</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main2.css">
</head>
<body>
<div>
SDMS(Smart Delivery Management System)
<a href="${pageContext.request.contextPath}/auth/logout.do">[로그아웃]</a>
</div>
<div id="main">
</div>
<div id="sidebar" class="section">
<%-- <jsp:include page="auth/loginUser.do"/>
<jsp:include page="project/myProjects.do"/>
<jsp:include page="task/myTasks.do"/> --%>
</div>
<div id="contents" class="section" >
<!-- <textarea rows="25" cols="90">excel이나 디비 저장파일 불러옴(배달이나 반품받을 주소리스트)</textarea> -->
<iframe  width="650" height="510" src="list.html"></iframe>
<iframe src="delivery/map.html" width="650" height="510"></iframe>
</div>
<div id="feedbar" class="section">
</div>
</body>
</html>










