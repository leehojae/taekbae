<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SDMS 시작</title>
</head>
<body>

<h1>SPMS 홈페이지</h1>
<p>SPMS 시스템에 오신걸 환영합니다.</p>

<a href="${pageContext.request.contextPath}/auth/login.do">[로그인]</a>
<a href="member/app.html">[회원가입]</a>
<a href="member/app.html">[점소등록]</a>
<jsp:include page="/tail.jsp"/>
</body>
</html>









