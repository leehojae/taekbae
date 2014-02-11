<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<jsp:include page="/header.jsp"/>

<h1>회원 정보</h1>
<form action='update.do' method='post'
  enctype="multipart/form-data">
<img src="../files/${member.photo}" width="120" height="150">
<input type="file" name="photoFile"><br>
<input type="hidden" name="photo" value="${member.photo}">
번호: <input readonly type='text' name='no' 
  value='${requestScope.member.no}'><br>
이름: <input type='text' name='name' 
  value='${requestScope.member.name}'><br>
이메일: <input type='text' name='email' 
  value='${member.email}'><br>
전화: <input type='tel' name='tel' 
  value='${member.tel}'><br>
나이: <input type='text' name='age' 
  value='${member.age}'><br>
<input type='submit' value='변경'>
<a href='delete.do?no=${member.no}'>[삭제]</a><br>
</form>

<jsp:include page="/tail.jsp"/>
</body>
</html>
    




