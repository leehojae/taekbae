<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPMS 시작화면</title>
<style type="text/css">
div {
  border:1px solid red;
}
table {
  width:900px; 
  border:1px solid blue;
}
td {
  border:1px dotted green;
}
#sidebar {
  width:150px; 
  vertical-align:top;
}
#contents {
  vertical-align:top;
}
#feedbar {
  width:200px; 
  vertical-align:top;
}
</style>
</head>
<body>
<div>
SPMS(Simple Project Management System)
</div>
<table>
<tr>
<td id="sidebar">
<jsp:include page="auth/loginUser.do"/>
</td>
<td id="contents">2</td>
<td id="feedbar">3</td>
</tr>
</table>

</body>
</html>










