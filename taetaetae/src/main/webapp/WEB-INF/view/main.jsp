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

</head>
<body>
<jsp:include page="/header.jsp"/>

<h1>SDMS 홈페이지</h1>
<p>SDMS 시스템에 오신걸 환영합니다.</p>
<a href="main2.jsp">main2 테스트</a>

<div>
<h2>금일 작업리스트</h2>
<table border='1' id='listTable'>
<tr>
<th>번호</th>
<th>이름</th>
<th>이메일</th>
<th>전화</th>
</tr>
</table>
</div>

<jsp:include page="/tail.jsp"/>
</body>
</html>








