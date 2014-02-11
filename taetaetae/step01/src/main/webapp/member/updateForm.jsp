<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>회원 정보</h1>
<form action='update.do' method='post'>
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






