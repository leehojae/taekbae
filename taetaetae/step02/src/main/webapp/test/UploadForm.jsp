<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 올리기</title>
</head>
<body>
<form action="Upload.jsp" method="post" 
    enctype="multipart/form-data">
이름: <input type="text" name="name"><br>
나이: <input type="text" name="age"><br>
파일1: <input type="file" name="file1"><br>
파일2: <input type="file" name="file2"><br>
<input type="submit" value="등록">
</form>
</body>
</html>