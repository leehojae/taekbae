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
<th>배송번호</th>
<th>운송장번호</th>
<th>접수일</th>
<th>배달예정일</th>
<th>보내는분</th>
<th>보내는분주소</th>
<th>보내는분전화1</th>
<th>보내는분전화2</th>
<th>받는분</th>
<th>받는분주소</th>
<th>받는분전화1</th>
<th>받는분전화2</th>
<th>발송점</th>
<th>도착점</th>
<th>취급구분</th>
<th>품명</th>
<th>수량</th>
<th>크기</th>
<th>중량</th>
<th>운임구분</th>
<th>날짜</th>
</tr>
</table>
</div>
<iframe src="delivery/map.html" width="650" height="510"></iframe>
<jsp:include page="/tail.jsp"/>
</body>
</html>
