<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<div id="myProjects" class="portlet">
<h1>내 프로젝트</h1>
<ul>
<c:forEach var="p" items="${projects}">
<li><a href="${pageContext.request.contextPath
      }/project/read.do?no=${p.projectNo}">${p.title
      } ${(p.role == 9) ? '(M)' : ''}</a></li>
</c:forEach>
</ul>
</div>    
    
    
    