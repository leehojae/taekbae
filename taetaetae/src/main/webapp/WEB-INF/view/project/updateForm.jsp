<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트정보</title>
</head>
<body>
<jsp:include page="/header.jsp"/>

<h1>프로젝트 정보</h1>
<form action='update.do' method='post'>
번호: <input readonly type='text' name='no' value='${project.no}'><br>
제목: <input type='text' name='title' value='${project.title}'><br>
내용: <textarea name="description" 
      rows="10" cols="50">${project.description}</textarea><br>
시작일: <input type="date" name='startDate' 
        value='${project.startDate}'><br>
종료일: <input type="date" name='endDate' value='${project.endDate}'><br>
상태: <select name='state'>
  <option value="0" ${project.state == 0 ? "selected" : ""}>준비</option>
  <option value="1" ${project.state == 1 ? "selected" : ""}>진행</option>
  <option value="2" ${project.state == 2 ? "selected" : ""}>완료</option>
  <option value="3" ${project.state == 3 ? "selected" : ""}>취소</option>
</select><br>
태그들: <input type='text' name='tags' value='${project.tags}'><br>
<input type='submit' value='변경'>
<a href='delete.do?no=${project.no}'>[삭제]</a><br>
</form>

<jsp:include page="/tail.jsp"/>
</body>
</html>
    




