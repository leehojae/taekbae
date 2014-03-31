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

    <!-- 아이콘 링크 css -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css" />

    <!--[if lte IE 8]>
      <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->

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
/*  overflow: hidden; */
/*  -webkit-backface-visibility: hidden; */
/*  -moz-backface-visibility: hidden; */
/*  backface-visibility: hidden; */
}
    
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
   <link rel="shortcut icon" href="../icon/favicon.png">
   <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">


<body>
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

          </div>
          
        </div>
      </div>
        </div>
       
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
    
    
    <form class="form-horizontal" method="post" action="ajax/addOffice.do">
      
      <div class="tab-content profile-edit-tab-content">
      <fieldset>
        <legend>Smart Delivery Management System 의 가입을 환영합니다. </legend>
      </fieldset>
<!--         <div id="edit-basic" class="tab-pane in active" > -->
        
        
        <h4 class="header blue bolder smaller">기업 기본가입란 </h4>
         <div class="row">
         <div class="span6">
         <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officenum">사업자번호</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeNum'
                    id="form-field-officenum" placeholder="사업자번호입력" />
                </div>
              </div>

              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officename">회사명</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeName'
                    id="form-field-officename" placeholder="회사명" />
                </div>
              </div>
              
               <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officetel">대표번호</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeTel'
                    id="form-field-officetel" placeholder="대표번호" />
                </div>
              </div>
      
         </div>
         <div class="span6">
         <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officepostnum">우편번호</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officePostNum'
                    id="form-field-officepostnum" placeholder="우편번호입력" />
                </div>
              </div>

              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officeaddr">회사주소</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeAddr'
                    id="form-field-officeaddr" placeholder="회사주소입력" />
                </div>
              </div>
              
               <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officefax">팩스번호</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeFax'
                    id="form-field-officefax" placeholder="팩스번호" />
                </div>
              </div>
      
         </div>
         </div>



              <div class="space-4"></div>
        <div class="row">
            <div class="span8">
          <h4 class="header blue bolder smaller">계약 동의 안내</h4>

<!--                 <div class="span4">                      -->
                  <img  src="../images/infoadd.png"><br>
                    <div class="form-group" >
                   <div class="col-lg-offset-5">
                    <input type="checkbox"> 정보동의 체크
                    </div>
                  </div>
                   </div>
                   
                   
                </div>
                </div>
              
       <blockquote class="pull-right">
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
  <small>Someone famous in <cite title="Source Title">Source Title</cite></small>
</blockquote>
              
          


          
  
<div class="form-group" >
<div class="col-md-5 col-md-offset-7">
<button class="btn btn-default">취소</button>
<button type="submit" class="btn btn-primary">확인</button>
<!-- <span class="btn btn-sm" data-rel="tooltip" title="Default">Default</span> -->
<!-- <span class="btn btn-warning btn-sm tooltip-warning" data-rel="tooltip" data-placement="left" title="Left Warning">Left</span> -->
<!-- <span class="btn btn-success btn-sm tooltip-success" data-rel="tooltip" data-placement="right" title="Right Success">Right</span> -->
<!-- <span class="btn btn-danger btn-sm tooltip-error" data-rel="tooltip" data-placement="top" title="Top Danger">Top</span> -->
<!-- <span class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title="Bottm Info">Bottom</span> -->
</div>
</div>
         </div>
  </form>
<hr />
<footer>
<p>&copy; 비트 2014</p>
</footer>
</div><!--/.fluid-container-->
<script type="text/javascript">
function photoUploadPopup()
      {
         myWin = window.open('addImage.do', 'popwindow', 'width=300,height=300');
         
         photoZone = document.getElementById('photoZone');
        
};

function initPhoto() {
  photoZone.innerHTML = '<img id="mPhoto"   name="mPhoto" src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>';
};
</script>



</body>
</html>
