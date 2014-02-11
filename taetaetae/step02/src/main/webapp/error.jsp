<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실행오류!</title>
</head>
<body>
<p>시스템 접속이 많습니다. 잠시 후 다시 시도해 주세요<br>
계속 같은 오류가 발생한다면 관리자(사내번호:120)에게 연락주세요.</p>
<pre>
<%
Exception e = (Exception)request.getAttribute("error");
e.printStackTrace(new PrintWriter(out));
%>
</pre>
</body>
</html>