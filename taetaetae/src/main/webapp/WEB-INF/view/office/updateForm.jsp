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
       
    
    
    <form class="form-horizontal" method="post" action="ajax/updateOffice.do">
      <div class="tab-content profile-edit-tab-content">
        <div id="edit-basic" class="tab-pane in active">
        
        
        <h4 class="header blue bolder smaller">Office</h4>
         <div class="row">
         <div class="span6">
         <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officenum">사업자번호</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeNum'
                   name='officeNum'  value='${office.officeNum}'  />
                </div>
              </div>

              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officename">회사명</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeName'
                    name='officeName'   value='${office.officeName}'  />
                </div>
              </div>
              
               <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officetel">대표번호</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeTel'
                     value='${office.officeTel}'  placeholder="대표번호" />
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
                    value='${office.officePostNum}'  placeholder="우편번호입력" />
                </div>
              </div>

              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officeaddr">회사주소</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeAddr'
                 value='${office.officeAddr}'   placeholder="회사주소입력" />
                </div>
              </div>
              
               <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officefax">팩스번호</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text" name='officeFax'
                    value='${office.officeFax}'   placeholder="팩스번호" />
                </div>
              </div>
      
         </div>
         </div>


           
<div class="form-group">
<div class="col-lg-10 col-lg-offset-2">
<button class="btn btn-default" type="submit">수정</button>
<button type="button" class="btn btn-primary"  onclick="deleteOffice()">삭제</button>
<span class="btn btn-warning btn-sm tooltip-warning" data-rel="tooltip" data-placement="left" title="Left Warning"   onclick="back( )">목록</span>
<!-- <span class="btn btn-sm" data-rel="tooltip" title="Default">Default</span> -->
<!-- <span class="btn btn-warning btn-sm tooltip-warning" data-rel="tooltip" data-placement="left" title="Left Warning">Left</span> -->
<!-- <span class="btn btn-success btn-sm tooltip-success" data-rel="tooltip" data-placement="right" title="Right Success">Right</span> -->
<!-- <span class="btn btn-danger btn-sm tooltip-error" data-rel="tooltip" data-placement="top" title="Top Danger">Top</span> -->
<!-- <span class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title="Bottm Info">Bottom</span> -->
</div>
</div>
</div><!--/.fluid-container-->
<script type="text/javascript">


function back(){
	window.history.back(); 
}
function deleteOffice()  {
	alert(${office.officeNum});
      var answer  = confirm( '삭제 하시겠습니까?' );
    if( answer ) 
    {
      
      location.href = 'ajax/deleteOffice.do?no=' + ${office.officeNum};
    } 
      return;
    }

</script>



</body>
</html>
