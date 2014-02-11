<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트목록</title>
</head>
<body>
<jsp:include page="/header.jsp"/>

<h1>프로젝트 목록</h1>
<form action="list.do" method="get">
<a href='add.do'>[새프로젝트]</a>
<select name='search'>
  <option value="all">전체</option>
  <option value="title">프로젝트명</option>
  <option value="description">내용</option>
</select>
<input type="text" name="keyword">
<input type="submit" value="검색">
</form>
<table border='1'>
<tr>
<th>번호</th>
<th>프로젝트명</th>
<th>시작일</th>
<th>종료일</th>
<th>상태</th>
</tr>
<c:forEach var="p" items="${projects}">
<tr>
<td>${p.no}</td>
<td><a href='read.do?no=${p.no}'>${p.title}</a></td>
<td><fmt:formatDate value="${p.startDate}" pattern="yyyy-MM-dd"/></td>
<td><fmt:formatDate value="${p.endDate}" pattern="yyyy-MM-dd"/></td>
<td>${p.state}</td>
</tr>
</c:forEach>

</table>
    
<jsp:include page="/tail.jsp"/>
</body>
</html>
    
    
    
    
    