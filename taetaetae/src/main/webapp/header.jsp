<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="border:1px red solid;background-color:lightgray;">
*SPMS
<a href="${pageContext.request.contextPath}/member/list.do">회원</a>
<a href="${pageContext.request.contextPath}/project/list.do">프로젝트</a>
<a href="${pageContext.request.contextPath}/task/list.do">작업</a>
<c:choose>
	<c:when test="${!empty loginUser}">
	<a href="#">${loginUser.name}</a>
	<a href="${pageContext.request.contextPath}/auth/logout.do">[로그아웃]</a>
	</c:when>
	
  <c:otherwise>
  <a href="${pageContext.request.contextPath}/auth/login.do">[로그인]</a>
  </c:otherwise>
</c:choose>
</div>