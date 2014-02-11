<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<div id="projectMembers" class="portlet">
<h1>참여자</h1>
<ul>
<c:forEach var="m" items="${members}">
<li>
<img src="${pageContext.request.contextPath}/files/${m.photo}"><br>
<span>${m.name}</span>
</li>
</c:forEach>
</ul>
</div>    
    
    
    