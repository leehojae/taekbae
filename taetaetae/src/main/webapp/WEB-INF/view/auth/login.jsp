<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>

<script type="text/javascript">

function openPopup () {
  $().w2form({
      name: 'foo',
      style: 'border: 0px; background-color: transparent;',
      formHTML: 
          '<div class="w2ui-page page-0">'+
          '   <div class="w2ui-label">ID:</div>'+
          '   <div class="w2ui-field">'+
          '       <input name="id" type="text" size="35"/>'+
          '   </div>'+
          '   <div class="w2ui-label">Password:</div>'+
          '   <div class="w2ui-field">'+
          '       <input name="password" type="text" size="35"/>'+
          '   </div>'+
          '<div class="w2ui-buttons">'+
          '   <input type="button" value="Reset" name="reset">'+
          '   <input type="button" value="Login" name="login">'+
          '</div>',
      fields: [
          { name: 'id', type: 'text', required: true },
          { name: 'password', type: 'text', required: true },
          
      ],
              actions: {
          "login": function () { this.validate(); },
          "reset": function () { this.clear(); },
      }
  });
  $().w2popup('open', {
      title   : '로그인하기',
      body    : '<div id="form" style="width: 100%; height: 100%;"></div>',
      style   : 'padding: 15px 0px 0px 0px',
      width   : 500,
      height  : 300, 
      showMax : true,
      onMin   : function (event) {
          $(w2ui.foo.box).hide();
          event.onComplete = function () {
              $(w2ui.foo.box).show();
              w2ui.foo.resize();
          }
      },
      onMax   : function (event) {
          $(w2ui.foo.box).hide();
          event.onComplete = function () {
              $(w2ui.foo.box).show();
              w2ui.foo.resize();
          }
      },
      onOpen  : function (event) {
          event.onComplete = function () {
              $('#w2ui-popup #form').w2render('foo');
          }
      }
  });
}
</script>



</head>
<body>

<h1>SDMS(Smart Delivery Management System)</h1>
<jsp:include page="/header.jsp"></jsp:include>

<form action="login.do" method="post">
<br>
<input type="button" value="로그인하기" onclick="openPopup()">
<br><br><br>

<%-- 이메일:<input type="text" name="id" value="${id}"><br> --%>
<!-- 암  호:<input type="password" name="password"><br>     -->
<!-- <input type="text" name="fname" placeholder="E-mail"><br> -->
<!-- <input type="text" name="fname" placeholder="Password"><br> -->

<input type="checkbox" name="saveID" ${checkSaveID}>이메일 저장<br>
<input type="submit" value="로그인">


</form>

<jsp:include page="/tail.jsp"/>
</body>
</html>
