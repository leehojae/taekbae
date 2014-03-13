<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>SDMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- 스타일 -->
    <link href="../assets/css/bootstrap-ko.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- IE6~8에서 HTML5 태그를 지원하기위한 HTML5 shim -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- 파비콘과 앱 아이콘 -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
                                   
    <link rel="stylesheet" type="text/css" href="//w2ui.com/src/w2ui-1.3.min.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script type="text/javascript" src="//w2ui.com/src/w2ui-1.3.min.js"></script>
        <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script>
<script type="text/javascript">
	$(function() {
		$('.collapse').collapse('hide');
	});
</script>

</head>

  <body onload="init()">

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">SDMS(Smart Delivery Management System)</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              <a href="#" class="navbar-link">${loginUser.name}</a>으로 로그인됨
            </p>

          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">

        </div><!--/span-->
        <div class="span9">

<table border='0' width='550' align='center' bgcolor='#686868' cellspacing='1' cellpadding='0'>
<form method="post" action="ajax/addOffice.do">


	
      <table border='0' cellpadding='0' cellspacing='0' width='40%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'   style='text-align: center;'><h1>SDMS 기업 회원 가입 </h1></td>
         
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;사업자번호 <font color='red'><b>*</b></font></td>
         
          <td width='74%'><input type='text' name='officeNum' size='20' maxlength='20'>
          </td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;전화번호 <font color='red'><b>*</b></font></td>
         
          <td width='74%'><input type='text' name='officeTel' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;팩스 <font color='red'><b>*</b></font></td>
         
          <td width='74%'><input type='text' name='officeFax' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;상호명 <font color='red'><b>*</b></font></td>
         
          <td width='74%'><input type='text' name='officeName' size='20'></td>
        </tr>
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;우편번호</td>  
         <td width='74%'><input type='text' name='officePostNum' size='20'></td>
          </td>  
        </tr>  
      </table>
      <table border='0' cellpadding='0' cellspacing='0' width='100%'>
        <tr>  
          <td bgcolor='#f4f4f4' width='8%' height='30'>&nbsp;주소</td>  
         
          <td width='74%'><input type='text' name='officeAddr' size='50'>&nbsp; </td>  
        </tr>  
     </table>
      <table border='0' cellpadding='0' cellspacing='0' width='40%'>
        <tr>
          <td bgcolor='#f4f4f4' width='8%' height='30'   style='text-align: center;'>
          	 <input id="delBtn" type="submit" value="가입"  />
    			<input id="cancelBtn" type="reset" value="취소" />
          
          </td>
         
        </tr>
      </table>
      </form>

<%--   <%@ include file="officeList.jsp"%> --%>

        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; 비트 2014</p>
      </footer>

    </div><!--/.fluid-container-->

    <!-- 자바스크립트
    ================================================== -->
    <!-- 페이지를 빨리 읽어들이도록 문서 마지막에 배치 -->
<!--     <script src="assets/js/jquery.js"></script> -->


  </body>
</html>