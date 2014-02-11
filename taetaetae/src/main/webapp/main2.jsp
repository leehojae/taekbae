<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPMS 시작화면</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main2.css">
</head>
<body>
<div>
SPMS(Simple Project Management System)
<a href="${pageContext.request.contextPath}/auth/logout.do">[로그아웃]</a>
</div>
<div id="main">

<div id="sidebar" class="section">
<jsp:include page="auth/loginUser.do"/>
<jsp:include page="project/myProjects.do"/>
<jsp:include page="task/myTasks.do"/>
</div>
<div id="contents" class="section">
<jsp:include page="project/desc.do?no=1"/>
<jsp:include page="member/projectMembers.do?no=1"/>
<jsp:include page="task/list.do?projectNo=1"/>
</div>
<div id="feedbar" class="section">
<jsp:include page="feed/add.do?projectNo=1"/>
</div>

</div>

</body>
</html>










