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
      
      
      
       #navcontainer { /* none needed */ } 
 ul#navlist { margin: 900; padding: 50; list-style-type: none; white-space: nowrap; } 
 ul#navlist li { float: left; font-family: verdana, arial, sans-serif; font-size: 9px; font-weight: bold; margin: 0; padding: 5px 0 4px 0; background-color: #666; border-top: 1px solid #e0ede9; border-bottom: 1px solid #e0ede9; } 
 #navlist a, #navlist a:link { margin: 0; padding: 5px 9px 4px 9px; color: #fff; border-right: 1px solid #d1e3db; text-decoration: none; }
  ul#navlist li#active { color: #95bbae; background-color: #d1e3db; }
   #navlist a:hover { color: #fff; background-color: #FE9C54; } 
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
	
	$(window.document).ready(function() {
		
		$("#m1").click( function() {
			setOfficeZone( 1) ;
			
		});
		$("#m2").click( function() {
			setOfficeZone(2) ;
			
		});
		
});
	
	

	
</script>
<style type="text/css">
<!--
#tabs {
	border-bottom: .5em solid #7CCE76;
	margin: 50;
	padding: 100;
	width:650px;
}
#tabs li { 
	display:inline; 
	border-top: .1em solid #7CCE76;
	
}
#tabs li a {
	text-decoration: none;
	padding: 0.25em 1em;
	color: #000;
}
#page1 #tabs li#tab1 a, #page2 #tabs li#tab2 a, #page3 #tabs li#tab3 a, .page4 li#tab1 a {
	padding: 0.25em 1em;
	background-color: #7CCE76;
	color: #fff;
}
-->
</style>

  <body onload="init()">
  
  
  
  
<div class="navbar navbar-inverse navbar-fixed-top">
         <%@ include file="../common/header.jsp"%>
        </div><!--/span-->
        
       <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <%@ include file="../common/myOfficeLeftMenu.jsp"%>
        </div><!--/span-->
<div class="span9">


        


<iframe src="officeList.do"  name=ce width=1200 height=600 style="border-width:0px; border-color:#7CCE76; border-style:solid;"></iframe>


</div><!--/row-->

      <hr>

      <footer>
        <p>&copy; 비트 2014</p>
      </footer>

    </div><!--/.fluid-container-->


  </body>
  
  
</html>