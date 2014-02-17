<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엑셀목록</title>
</head>
<body>
<jsp:include page="/header.jsp"/>

<h1>회원 목록</h1>
<a href='add.do'>[새회원]</a><br>
<table border='1'>
<tr>
<th>번호</th>
<th>이름</th>
<th>이메일</th>
<th>전화</th>
</tr>
<c:forEach var="e" items="${excels}">
<tr>
<td>${e.num}</td>
<td><a href='read.do?no=${e.num}'>${e.sender}</a></td>
<td>${e.receiver}</td>
<td>${e.date}</td>
</tr>
</c:forEach>

</table>
    
<jsp:include page="/tail.jsp"/>
</body>
</html>
    
    
    
    
    