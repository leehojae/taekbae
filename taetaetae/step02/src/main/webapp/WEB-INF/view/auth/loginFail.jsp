<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" 
  content="1;${pageContext.request.contextPath}/auth/login.do"/>
<title>로그인결과</title>
</head>
<body>
<jsp:include page="/header.jsp"/>

<h1>로그인 결과</h1>
로그인 실패하였습니다. 이메일 또는 암호가 일치하지 않습니다.

<jsp:include page="/tail.jsp"/>
</body>
</html>