<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트등록폼</title>
</head>
<body>
<jsp:include page="/header.jsp"/>
    
<h1>프로젝트 등록폼</h1>
<form action="add.do" method="post">
제목: <input type='text' name='title'><br>
내용: <textarea name="description" rows="10" cols="50"></textarea><br>
시작일: <input type='date' name='startDate'><br>
종료일: <input type='date' name='endDate'><br>
상태: <select name='state'>
  <option value="0">준비</option>
  <option value="1">진행</option>
  <option value="2">완료</option>
  <option value="3">취소</option>
</select><br>
태그들: <input type='text' name='tags'><br>
<input type="submit" value="등록">
</form>

<jsp:include page="/tail.jsp"/>
</body>
</html>