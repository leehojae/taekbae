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
      
      .btn-5 {
	background: #823aa0;
	color: #fff;
	height: 30px;
	min-width: 80px;
	line-height: 24px;
	font-size: 12px;
/* 	overflow: hidden; */
/* 	-webkit-backface-visibility: hidden; */
/* 	-moz-backface-visibility: hidden; */
/* 	backface-visibility: hidden; */
}
    
    
    
    <button class="btn btn-5 btn-5b icon-cog"><span>Settings</span></button>  
      
    </style>
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
    	<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/loginMain.css"/> 
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/member.css"/> 
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/table/table.css"/> 

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
          <a class="brand" href="../main.do">SDMS(Smart Delivery Management System)</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
            </p>

          </div><!--/.nav-collapse -->
        </div>
      </div>
        </div><!--/span-->
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
<%--           <%@ include file="../common/leftMenu.jsp"%> --%>
        </div><!--/span-->
        <div class="span9">

<form method="post" action="ajax/addMember.do"    enctype="multipart/form-data">
<input type='hidden'   id ='photo' name='photo' >
   	<TABLE  id="mytable"    class="boardList">
   	 <caption class="table_caption"><h1>SDMS 직원 가입 신청</h1></caption>
<TR>


<th rowspan=8 bgcolor=#F6F6F6>     

<div id ="photoZone">
<img id="mPhoto"     name="mPhoto"   src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>
</div>
<input id="updateBtn" type="button"  class="btn btn-5 btn-5a icon-cog"  value="사진등록" onclick="photoUploadPopup()" />
	<input id="delBtn" type="button" value="삭제"  onclick="initPhoto()" />
</th>
</tr>
<tr>
<TD WIDTH="20%" bgcolor=#E4F7BA>소속
<TD WIDTH="53%"  bgcolor=#FFFF6C><input id="id" name="id" class="a" type="text" value="" maxlength="100">
<input id="updateBtn" type="button"  class="btn btn-5 btn-5a icon-cog"  value="사진등록" onclick="photoUploadPopup()" /></TD>
              					</tr>

<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>직위<br></TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C><select id="rank" name="rank" >
              						<option value="" selected="selected">소속</option>
              						<option value=" 1">양재택배</option>
              					</select></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>아이디</TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C><input id="id" name="id" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>비밀번호</TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C><input id="password" name="password" class="a" type="password" value="" maxlength="100"><br></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>이름</TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C><input id="name" name="name" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>생년월일</TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C>
 <input type="date"    id="personalNumber"   name="personalNumber">
</TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>전화번호</TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C><input id="tel" name="tel" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>
<TR>


<th colspan=3><br><input type='submit' value='직원 등록 신청'>&nbsp;&nbsp;<input type='reset' value='취소'>
</TR>

</TABLE>
   	
   </form>	

        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; 비트 2014</p>
      </footer>

    </div><!--/.fluid-container-->

  </body>
  
  
  
        <script>
      
      function photoUploadPopup()
      {
      	 myWin = window.open('addImage.do', 'popwindow', 'width=300,height=300');
      	 
      	 photoZone = document.getElementById('photoZone');
        
      }

      
      
      

function initPhoto() {
	photoZone.innerHTML = '<img id="mPhoto"   name="mPhoto" src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>';
}
</script>
</html>