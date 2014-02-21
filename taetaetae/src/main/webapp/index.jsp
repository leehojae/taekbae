<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="icon/favicon.png">

    <title>SDMS로그인</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">택배조회</h2>
        <input type="text" class="form-control" placeholder="운송장번호입력" autofocus>
        <button class="btn btn-lg btn-primary btn-block" type="submit">입력</button>
      </form>
      <form class="form-signin" action="auth/login.do" method="post">
        <h2 class="form-signin-heading">사용자 로그인</h2>
        <input type="text" class="form-control" placeholder="아이디" autofocus >
        <input type="password" class="form-control" placeholder="암호">
        <label class="checkbox">
          <input type="checkbox" value="아이디기억" ${checkSaveEmail}>아이디기억
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
