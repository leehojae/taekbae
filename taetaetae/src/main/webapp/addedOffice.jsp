<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<% 
String no = request.getParameter("no"); 
//String ceo= request.getParameter("ceo");   

String ceo = new String(request.getParameter("ceo").getBytes("8859_1"),"euc-kr");




%> 


<html>
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


 <li>name : <%= no %></li>   
 <li>ceo : <%= ceo %></li>   

<!--    <META HTTP-EQUIV="Refresh" CONTENT="3; URL=member/add.do"> -->
<!--    사업소 관리 등록이 완료되었습니다. -->
  </body>
</html>
