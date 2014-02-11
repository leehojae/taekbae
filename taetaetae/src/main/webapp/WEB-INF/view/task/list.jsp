<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<div id="projectTasks" class="portlet">
<h1>작업</h1>
<table>
<c:forEach var="t" items="${tasks}">
<tr>
<td>${t.no}</td>
<td>${t.title}</td>
<td>${t.worker.name}</td>
<td>${t.state}</td>
</tr>
</c:forEach>
</table>
</div>    
    
    
    