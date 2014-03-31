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
    
    #idcheck{
 background: #823aa0;
  color: #fff;
  height: 25px;
  min-width: 80px;
  line-height: 24px;
  font-size: 12px;
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
    
<script type="text/javascript">
$(function(){
  $.getJSON('../office/ajax/officeAllList.do', function(data){
    var data = data.jsonResult.data;  
        console.log(data);
  });
});
</script>
    
</head>
<body class="tab-content profile-edit-tab-content">

<!--     <form class="form-horizontal" method="post" action="ajax/addMember.do" enctype="multipart/form-data" > -->
<!--     <form class="form-horizontal" method="post" enctype="multipart/form-data" > -->
     <Form  class="form-horizontal"   action="ajax/addMember.do"     method="post"     enctype="multipart/form-data">
<!--  onSubmit="formCheck();return false"> -->
    
    
      <div >
        <div id="edit-basic" class="tab-pane in active">
        
        
         <h4 class="header blue bolder smaller">Office Info(  ${loginUser.name} ) </h4>
         <input type=hidden    id=officeNum name = "officeNum" value=" ${loginUser.officeNum}">
           <div class="form-group">
            <label for="select"
              class="col-sm-3 control-label no-padding-right">직책선택</label>
            <div class="col-sm-9">

              <select   id=rank name = "rank" >
                <option value="2">영업소관리자</option>
                <option value="3">배송기사</option>
                
              </select>
               <br> 
            </div>
           </div>
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
          
          
          
           <div id="edit-password" class="tab-pane">

                <div class="form-group">
                  <label class="col-sm-3 control-label no-padding-right"
                    for="form-field-pass1">비밀번호</label>

                  <div class="col-sm-9">
                    <input type="password"   id="password"  name = "password"    />
                  </div>
                </div>

                <div class="space-4"></div>

                <div class="form-group">
                  <label class="col-sm-3 control-label no-padding-right"
                    for="form-field-pass2">비밀번호 확인</label>

                  <div class="col-sm-9">
                    <input type="password"  id="passwordRe"  name = "passwordRe"    /> 
                  </div>
                </div>
              </div>
   
        
         value='${office.officeName}'
        
          <h4 class="header blue bolder smaller">General</h4>
                    
<div class="row">
<div class="col-xs-12 col-sm-4" style="text-align: center">
<div id ="photoZone">
<img id="mPhoto" name="photo" src="../images/memberPhoto/bg_noimage_1.gif" style="width: 161px; height: 161px;"><br>
</div>
<input id="updateBtn" type="button"  class="btn btn-5 btn-5a icon-cog"  value="사진등록" onclick="photoUploadPopup()" />
<input id="updateBtn" type="button"  class="btn btn-5 btn-5a icon-cog"  value="등록취소" onclick="initPhoto()" />
</div>
          


            <div class="vspace-xs"></div>

            <div class="col-xs-12 col-sm-8">
              

              <div class="space-4"></div>
                <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"
              for="form-field-email">이름</label>

            <div class="col-sm-9">
              <span class="input-icon input-icon-right" >
               <input  id="name"  name = "name"   value='${member.name}' />
                
              </span>
            </div>
          </div>
          
          
            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-date">생년월일</label>

                                <div class="col-sm-9">
                                  <div class="input-medium">
                                    <div class="input-group">
                                      <input id="personalNumber" type="date" name="personalNumber"    value='${member.personalNumber}'
                                        placeholder="yyyy-MM-dd" /> 
                                    </div>
                                  </div>
                                </div>
                              </div>
                              
                              
                              
                              
                              <h4 class="header blue bolder smaller">Contact</h4>

          <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-username">주소</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text"
                    id="addresss"  name = "addresss"  placeholder="주소를 입력해 주세요" />
                </div>
              </div>
          

          <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"
              for="form-field-phone">핸드폰번호</label>

            <div class="col-sm-9">
              <span class="input-icon input-icon-right"> 
              
              <select id="hp1" name="hp1" >
             <option value="010"  selected> 010 </option>
             <option value="011"> 011 </option>
             <option value="016"> 016 </option>
             <option value="017"> 017 </option>
             <option value="018"> 018 </option>
             <option value="019"> 019 </option>
          </select>
          -
          <input type="text" id="hp2" name="hp2" size="4" maxlength="4">
          -
          <input type="text" id="hp3" name="hp3" size="4" maxlength="4">
          <input type="hidden" id="tel" name="tel" >
              
              </span>
            </div>
          </div>
              
          
          
           
           
           
           

              <div class="space-4"></div>
             
            </div>
          </div>

          <hr />
            
        

            
            
            
          </div>
          <div class="space-4"></div>

          <div class="space-4"></div>
          

          

         
        
          <div id="edit-password" class="tab-pane">
            <div class="space-10"></div>

         

            <div class="space-4"></div>

          </div>
        </div>

<div class="form-group">
<div class="col-lg-10 col-lg-offset-2">
<!-- <button type="submit" class="btn btn-primary"  >dddd직원등록</button> -->

<button type="submit" class="btn btn-primary"   >직원등록</button>
<!-- <button type="submit" class="btn btn-primary"   onclick="javascript:formCheck();">직원등록</button> -->
<button class="btn btn-default">취소</button>
</div>
</div>
<hr />
    </form>
<!--/.fluid-container-->
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
function idCheck()
{
  
  var idcheck = document.getElementById('id'); 
  
  if (idcheck.value == '' || idcheck.value == null) {
    alert('ID를 입력하세요');
    return false;
  }
  
//  myWin = window.open('searchCompany.do', 'popwindow', 'width=300,height=300');
          myWin = window.open('idCheck.do?id=' + idcheck.value, 'popwindow', 'width=300,height=300');
         
         
        
};

function initPhoto() {
  photoZone.innerHTML = '<img id="mPhoto"   name="mPhoto" src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>';
};



function formCheck() {
  
  Frm = document.forms[0];
  var id = document.getElementById('id');
  var password = document.getElementById('password');
  var passwordRe = document.getElementById('passwordRe');
  var password_check = document.getElementById('password_check');

  
  
  var name = document.getElementById('name');
  var personalNumber = document.getElementById('personalNumber');
  var addresss = document.getElementById('addresss');
  
  
  
  var hp1 = document.getElementById('hp1'); 
  var hp2 = document.getElementById('hp2'); 
  var hp3 = document.getElementById('hp3'); 
  var hp = hp1.value + "-" + hp2.value + "-" + hp3.value;
  
  /*핸드폰 번호 길이 체크*/
  
  
  if (id.value == '' || id.value == null) {
    alert('ID를 입력하세요');
    focus.member_id;
    return false;
  }

  if (password.value == '' || password.value == null) {
    alert('비밀번호를 입력하세요');
    focus.password;
    return false;
  }
  
  
  /*비밀번호와 비밀번호확인란 같은지 확인*/
  if (password.value != passwordRe.value){
    alert("비밀번호와 비밀번호 확인란이 다릅니다.");
    focus.passowrd;
    return false;
  }
  
    /*핸드폰 번호 길이 체크*/
  if(hp2.value.length<=2 || hp3.value.length!=4){
    alert("휴대폰번호를 제대로 입력해주세요");
    focus.hp2;
    return false;
  }
    /*핸드폰이 숫자만 들어가는지 체크*/
    if(isNaN(hp2.value) || isNaN(hp3.value))
  {
    alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
    return false;
  }
    /**/
  if (hp2.value.length > 2 || hp3.value.length==4){
    document.getElementById("tel").value = hp;
  }
  
  Frm.action = "../office/searchCompany.do?no=" + Frm.searchKsearcheywordA.value;
    alert("dwrewr");
  Frm.submit();
  
}

</script>

</body>
</html>
