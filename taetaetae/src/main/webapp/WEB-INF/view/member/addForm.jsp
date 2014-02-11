<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록폼</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
    
<h1>회원등록폼</h1>
<form action="add.do" method="post"
  enctype="multipart/form-data">
이름: <input type="text" name="name"><br>
이메일: <input type="text" name="email"><br>
전화: <input type="tel" name="tel"><br>
나이: <input type="text" name="age"><br>
사진: <input type="file" name="photoFile"><br>
<input type="submit" value="등록">
</form>

<jsp:include page="/tail.jsp"/>
</body>
</html>








