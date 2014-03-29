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
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
                                   
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
    <form class="form-horizontal" method="post" action="ajax/addMember.do" enctype="multipart/form-data" >
      <fieldset>
        <legend>직업가입란</legend>
      </fieldset>
      
      <div class="tab-content profile-edit-tab-content">
        <div id="edit-basic" class="tab-pane in active">
        
        
        <h4 class="header blue bolder smaller">Office</h4>
         
            <div class="form-group">
              <label for="select"
                class="col-sm-3 control-label no-padding-right">소속</label>
              <div class="col-sm-9">
                <input  type="text"
                      id="form-field-username" placeholder="사업자번호" />
                      <input id="delBtn" type="button" value="검색"  onclick="searchCompany()" />
              </div>
             
           </div>   
            
           <div class="form-group">
            <label for="select"
              class="col-sm-3 control-label no-padding-right">직급선택</label>
            <div class="col-sm-9">

              <select  id="select">
                <option>직책선택</option>
                <option>대표</option>
                <option>배송기사</option>

              <select class="form-control" id="select">
                <option>사장-(1급)</option>
                <option>부장-(3급)</option>
                <option>과장-(4급)</option>
                <option>팀장-(5급)</option>
                <option>실장-(6급)</option>
                <option>사원-(7급)</option>
                <option>인턴-(9급)</option>

              </select> <br> 
            </div>
           </div>
        
        
        
          <h4 class="header blue bolder smaller">General</h4>
                    
          <div class="row">
            <div class="col-xs-12 col-sm-4">
            <div id ="photoZone">
<img id="mPhoto"     name="mPhoto"   src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>
</div>
<input id="updateBtn" type="button"  class="btn btn-5 btn-5a icon-cog"  value="사진등록" onclick="photoUploadPopup()" />
<input id="updateBtn" type="button"  class="btn btn-5 btn-5a icon-cog"  value="등록취소" onclick="initPhoto()" />
     
          </div>
          


            <div class="vspace-xs"></div>

            <div class="col-xs-12 col-sm-8">
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-id">아이디</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text"
                    id="form-field-id" placeholder="아이디" />
                </div>
              </div>

              <div class="space-4"></div>
              <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-username">사용자이름</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text"
                    id="form-field-username" placeholder="사용자이름" />
                </div>
              </div>

              <div class="space-4"></div>
              <div id="edit-password" class="tab-pane">

                <div class="form-group">
                  <label class="col-sm-3 control-label no-padding-right"
                    for="form-field-pass1">비밀번호</label>

                  <div class="col-sm-9">
                    <input type="password" id="form-field-pass1" />
                  </div>
                </div>

                <div class="space-4"></div>

                <div class="form-group">
                  <label class="col-sm-3 control-label no-padding-right"
                    for="form-field-pass2">비밀번호 확인</label>

                  <div class="col-sm-9">
                    <input type="password" id="form-field-pass2" />
                  </div>
                </div>
              </div>
            </div>
          </div>

          <hr />
          <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-date">생년월일</label>

                                <div class="col-sm-9">
                                  <div class="input-medium">
                                    <div class="input-group">
                                      <input id="personalNumber" type="date" name="personalNumber"
                                        placeholder="yyyy-MM-dd" /> 
                                    </div>
                                  </div>
                                </div>
                              </div>

            
            
            
          </div>
          <div class="space-4"></div>
          <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right">성별</label>
            <div class="col-sm-9">
              <label class="radio"> <input type="radio"
                name="optionsRadios" id="optionsRadios1" value="option1"
                checked="" /> <span class="lbl"> 남</span>
              </label> <label class="radio"> <input type="radio"
                name="optionsRadios" id="optionsRadios2" value="option2" /> <span
                class="lbl"> 여</span>
              </label>
            </div>
          </div>

          <div class="space-4"></div>

          <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"
              for="form-field-comment">소개글</label>
            <div class="col-lg-5">
              <textarea class="form-control" rows="3" id="textArea"></textarea>
              <span class="help-block">자기소개를 입력하세요~! 500자 이내</span>
        
            </div>
          </div>

          <div class="space-4"></div>
          <h4 class="header blue bolder smaller">Contact</h4>

          <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"
              for="form-field-email">이메일<i class="fa fa-envelope-o"></i></label>

            <div class="col-sm-9">
              <span class="input-icon input-icon-right" > <input
                type="email" id="form-field-email" placeholder="ooo@bit.com" />
                
              </span>
            </div>
          </div>
          
          
         

          <div class="space-4"></div>

          <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"
              for="form-field-website">SNS<i class="fa fa-twitter"></i></label>

            <div class="col-sm-9">
              <span class="input-icon input-icon-right"> <input
                type="url" id="form-field-website"
                placeholder="ooo@bit.com" /> 
              </span>
            </div>
          </div>

          <div class="space-4"></div>

          <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"
              for="form-field-phone">핸드폰번호</label>

            <div class="col-sm-9">
              <span class="input-icon input-icon-right"> <input
                class="input-medium input-mask-phone" type="text"
                id="form-field-phone" /> <i
                class="icon-phone icon-flip-horizontal"></i>
              </span>
            </div>
          </div>

          

         
        
          <div id="edit-password" class="tab-pane">
            <div class="space-10"></div>

            <div class="form-group">
              <label class="col-sm-3 control-label no-padding-right"
                for="form-field-pass1">New Password</label>

              <div class="col-sm-9">
                <input type="password" id="form-field-pass1" />
              </div>
            </div>

            <div class="space-4"></div>

            <div class="form-group">
              <label class="col-sm-3 control-label no-padding-right"
                for="form-field-pass2">Confirm Password</label>

              <div class="col-sm-9">
                <input type="password" id="form-field-pass2" />
              </div>
            </div>
          </div>
        </div>
    </form>
    <hr />
<div class="form-group">
<div class="col-lg-10 col-lg-offset-2">
<button class="btn btn-default">취소</button>
<button type="submit" class="btn btn-primary">확인</button>
<span class="btn btn-sm" data-rel="tooltip" title="Default">Default</span>
<span class="btn btn-warning btn-sm tooltip-warning" data-rel="tooltip" data-placement="left" title="Left Warning">Left</span>
<span class="btn btn-success btn-sm tooltip-success" data-rel="tooltip" data-placement="right" title="Right Success">Right</span>
<span class="btn btn-danger btn-sm tooltip-error" data-rel="tooltip" data-placement="top" title="Top Danger">Top</span>
<span class="btn btn-info btn-sm tooltip-info" data-rel="tooltip" data-placement="bottom" title="Bottm Info">Bottom</span>
</div>
</div>
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
function searchCompany()
      {
         myWin = window.open('searchCompany.do', 'popwindow', 'width=300,height=300');
         
         photoZone = document.getElementById('photoZone');
        
};

function initPhoto() {
  photoZone.innerHTML = '<img id="mPhoto"   name="mPhoto" src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>';
};
</script>



</body>
</html>
