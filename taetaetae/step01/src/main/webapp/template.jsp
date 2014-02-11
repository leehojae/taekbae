<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>
</head>
<body>
<jsp:include page="/header.jsp"/>

<jsp:include page="${contentPage}"/>

<jsp:include page="/tail.jsp"/>
</body>
</html>