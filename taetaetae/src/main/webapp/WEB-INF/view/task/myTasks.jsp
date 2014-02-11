<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<div id="myTasks" class="portlet">
<h1>내 작업</h1>
<ul>
<c:forEach var="t" items="${tasks}">
<li><a href="${pageContext.request.contextPath
      }/task/read.do?no=${t.no}">${t.title
      }</a></li>
</c:forEach>
</ul>
</div>    
    
    
    