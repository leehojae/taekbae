<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="1;url=list.do">
<title>회원등록결과</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
    
<h1>회원등록결과</h1>
<p>${message}</p>

<jsp:include page="/tail.jsp"/>
</body>
</html>