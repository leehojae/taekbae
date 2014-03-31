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
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <link href="../assets/css/bootstrap-ko.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <!-- <link href="../assets/css/font-awesome.min.css" rel="stylesheet"> -->
    <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="../js/bootstrap/bootstrap.min.js"></script>
    <script src="../assets/js/behavior.js"></script>
    
    <!-- page specific plugin styles -->

    <link rel="stylesheet" href="../assets/css/jquery-ui-1.10.3.custom.min.css" />
    <link rel="stylesheet" href="../assets/css/jquery.gritter.css" />
    <link rel="stylesheet" href="../assets/css/select2.css" />
    <link rel="stylesheet" href="../assets/css/bootstrap-editable.css" />
    <!-- fonts -->

    <link rel="stylesheet" href="../assets/css/ace-fonts.css" />

    <!-- ace styles -->

    <link rel="stylesheet" href="../assets/css/ace.min.css" />
    <link rel="stylesheet" href="../assets/css/ace-rtl.min.css" />   
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />

    <!--[if lte IE 8]>
      <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="../assets/js/ace-extra.min.js"></script>

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
<!--     <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet"> -->
<!--       <link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/loginMain.css"/>  -->
<!--   <link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/member.css"/>  -->
<!--   <link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/table/table.css"/>  -->

    <!-- IE6~8에서 HTML5 태그를 지원하기위한 HTML5 shim -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- 파비콘과 앱 아이콘 -->
<!--     <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png"> -->
<!--     <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png"> -->
<!--       <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png"> -->
<!--                     <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png"> -->
                                   <link rel="shortcut icon" href="../icon/favicon.png">
                                   
    <link rel="stylesheet" type="text/css" href="//w2ui.com/src/w2ui-1.3.min.css" />

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
    
    <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>
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

          </div><!--/.nav-collapse -->
        </div>
      </div>
        </div><!--/span-->





<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
    <form class="form-horizontal" method="post"     action="../member/ajax/addMember.do"   >
  
      
      <div class="tab-content profile-edit-tab-content">
      
        
        
        <h4 class="header blue bolder smaller">&nbsp;&nbsp;Office</h4>
        
         <div class="row">
        <div class="span6">
         <input type="hidden" name="rank" value="3">
           <input type="hidden" id="name" name="name" class="a" type="text"     value='${office.officeName}'  maxlength="100">
            <div class="form-group">
              <label for="select"
                class="col-sm-4 control-label no-padding-right">사업자번호입력</label>
              <div class="col-sm-8">
                <input class="col-xs-12 col-sm-10" 
                       type='text' name='officeNum'    id ='officeNum'    value='${office.officeNum}'  readonly='true'  placeholder="'-'없이 입력하세요." />
              </div>
           </div>   

           <div class="form-group">
              <label for="select"
                class="col-sm-4 control-label no-padding-right">회사명</label>
              <div class="col-sm-8">
                <input class="col-xs-12 col-sm-10" type="text"
                    id ='officeName'  name='officeName'   value='${office.officeName}'  readonly='true'  />
              </div>
           </div> 
           <div class="form-group">
              <label for="select"
                class="col-sm-4 control-label no-padding-right">우편번호</label>
              <div class="col-sm-8">
                <input class="col-xs-12 col-sm-10" type="text"
                      id="officePostNum"  name="officePostNum" value='${office.officePostNum}'  readonly='true' />
              </div>
           </div> 
           </div>
           <div class="span6">
             <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-username">주소</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text"
                  id="officeAddr"  name="officeAddr"   value='${office.officeAddr}'  readonly='true' />
                </div>
              </div>
              
               <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-username">전화번호</label>

                <div class="col-sm-8">
                 <input class="col-xs-12 col-sm-10" type="text"
                  id='officeTel'   name='officeTel'    value='${office.officeTel}'  readonly='true' />
                </div>
              </div>
               <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-username">팩스</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text"
                     name='officeFax'    id='officeFax'   value='${office.officeFax}'  readonly='true' />
                </div>
              </div>
          </div>
        </div>
  
  </div> <!--  row클래스 끝 -->
  
    <h4 class="header blue bolder smaller">&nbsp;&nbsp;&nbsp;&nbsp;ID/PW</h4>
    
     <div class="row">
          


            <div class="vspace-xs"></div>

              <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"
              for="form-field-email">아이디</label>

            <div class="col-sm-9">
              <span class="input-icon input-icon-right" > <input
                 id="id"  name = "id"   placeholder="영문 숫자 포함 10자 이내" />
                 <input type="button"    id="idcheck" value="중복확인"   onclick="idCheck()" />
              </span>
            </div>
          </div>
          </div>

         
        
          <div id="edit-password" class="tab-pane">
            <div class="space-10"></div>

            <div class="form-group">
              <label class="col-sm-3 control-label no-padding-right"
                for="form-field-pass1">Password</label>

              <div class="col-sm-9">
                <input type="password" id="password" name="password" />
              </div>
            </div>

            <div class="space-4"></div>

<!--             <div class="form-group"> -->
<!--               <label class="col-sm-3 control-label no-padding-right" -->
<!--                 for="form-field-pass2">Confirm Password</label> -->

<!--               <div class="col-sm-9"> -->
<!--                 <input type="password" id="form-field-pass2" /> -->
<!--               </div> -->
<!--             </div> -->
    
    
     <div class="space-4"></div>
        
          <h4 class="header blue bolder smaller">개인정보처리 동의</h4>
                    
          <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-officefax"><font color="white">.</font></label><br>
                <img  src="../images/infoadd.png">
          </div>      
                <div class="col-sm-4" style="text-align:right;">
                  <label class="checkbox">
                  <input type="checkbox"> 정보동의에 체크하세요.
                  
                  </label>
                </div>
          
    
    </div>
    
    
    
<div class="form-group">
<div class="col-lg-10 col-lg-offset-2">
<button type="submit" class="btn btn-primary">승인요청</button>
 
</div>
</div>
 </form>
<hr />
<script type="text/javascript">

function idCheck()
{
	
	var idcheck = document.getElementById('id'); 
	
	if (idcheck.value == '' || idcheck.value == null) {
		alert('ID를 입력하세요');
		return false;
	}
	
//	myWin = window.open('searchCompany.do', 'popwindow', 'width=300,height=300');
          myWin = window.open('../member/idCheck.do?id=' + idcheck.value, 'popwindow', 'width=300,height=300');
         
         
        
};
</script>



</body>
</html>
