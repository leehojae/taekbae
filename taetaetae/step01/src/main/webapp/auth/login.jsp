<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>${pageTitle}</h1>
<form action="login.do" method="post">
이메일: <input type="text" name="email" value="${email}"><br>
암호: <input type="password" name="password"><br>
<input type="checkbox" name="saveEmail" ${checkSaveEmail}>이메일 저장<br>
<input type="submit" value="로그인">
</form>
