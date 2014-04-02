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
    
/*     #idcheck{ */
/*  background: #823aa0; */
/*   color: #fff; */
/*   height: 25px; */
/*   min-width: 80px; */
/*   line-height: 24px; */
/*   font-size: 12px; */
/* } */
#updateBtn {
position: relative;
-moz-opacity: 0;
filter: alpha(opacity: 0);
z-index: 2;
opacity: 0;
width: 100%;
left: 0px;
display: none;
}


#fakeBtn {
float: right;
z-index: 1;
}
#addFile{
float: left;
width: 50%;
}
#cancelFile{
float: right;
width: 50%;
text-align: left;
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
function readURL(input) {
  if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function (e) {
          $('#mPhoto').attr('src', e.target.result);
      }
      
      reader.readAsDataURL(input.files[0]);
  }
}

$("#updateBtn").change(function(){
  readURL(this);
});
</script>



<script>
var blank="http://localhost:9999/taetaetae/images/memberPhoto/bg_noimage_1.gif";
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#mPhoto')
            .attr('src', e.target.result);
            //.height(200);
        };

        reader.readAsDataURL(input.files[0]);
    }
    else {
      var img = input.value;
        $('#mPhoto').attr('src',img);
        //$('#mPhoto').attr('src',img).height(200);
    }
    //$("#x").show().css("margin-right","10px");
}
$(document).ready(function() {
  $("#x").click(function() {
    $("#img_prev").attr("src",blank);
    $("#x").hide();  
  });
});
</script>
<!--[if IE]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

           <style type="text/css">
        div.fileinputs {
            position: relative;
            width: 20px;
        }

        div.fakefile {
            position: absolute;
            top: 0px;
            left: 0px;
            z-index: 1;
        }

        div.fakefile input[type=button] {
            /* enough width to completely overlap the real hidden file control */
            cursor: pointer;
            width: 148px;
        }

        div.fileinputs input.file {
            position: relative;
            text-align: right;
            -moz-opacity:0 ;
            filter:alpha(opacity: 0);
            opacity: 0;
            z-index: 2;
        }
        
#addFile {
  display: inline-block;
  width: 50%;
  float: left;
}
        
        
    </style>
  
</head>
<body class="tab-content profile-edit-tab-content">

<!--     <form class="form-horizontal" method="post" action="ajax/addMember.do" enctype="multipart/form-data" > -->
<!--     <form class="form-horizontal" method="post" enctype="multipart/form-data" > -->
     <Form  class="form-horizontal"      method="post"   action="ajax/addMember.do"   enctype="multipart/form-data"   onSubmit="formCheck();return false">
<!--  onSubmit="formCheck();return false"> -->
    
    
      <div class="tab-content profile-edit-tab-content"> <!-- 등록폼 네모 테두리 -->
       <div id="edit-basic" class="tab-pane in active">
        
        
         <h4 class="header blue bolder smaller">Office Info</h4>
          <input type="hidden" name="rank" value="4">
          <input type="hidden" name="officeNum" value="${loginUser.officeNum}">
                
                <div class="form-group">
                    <label class="col-sm-4 control-label no-padding-right"
                    for="form-field-email">아이디</label>

                  <div class="col-sm-8">
<!--                     <span class="input-icon input-icon-right" >  -->
                    <span class="class="btn btn-sm" data-rel="tooltip" title="Default"" > 
                      <input id="id"  name = "id"   placeholder="영문 숫자 포함 10자 이내" />
                      <input type="button"  value="중복확인" onclick="idCheck()" />
                    </span>
                  </div>
                </div>
          


          
           <div id="edit-password" class="tab-pane">

                <div class="form-group">
                  <label class="col-sm-4 control-label no-padding-right"
                    for="form-field-pass1">비밀번호</label>

                  <div class="col-sm-8">
                    <input type="password"   id="password"  name = "password"    />
                  </div>
                </div>

                <div class="space-4"></div>

<!--                 <div class="form-group"> -->
<!--                   <label class="col-sm-3 control-label no-padding-right" -->
<!--                     for="form-field-pass2">비밀번호 확인</label> -->

<!--                   <div class="col-sm-9"> -->
<!--                     <input type="password"  id="passwordRe"  name = "passwordRe"    />  -->
<!--                   </div> -->
<!--                 </div> -->
              </div>
   
        
        
        
          <h4 class="header blue bolder smaller">General</h4>
                    
<div class="row">
<div class="col-xs-12 col-sm-4" style="text-align: center">
<div id ="photoZone">
<img id="mPhoto" name="photo" src="../images/memberPhoto/bg_noimage_1.gif" style="width: 161px; height: 161px;"><br>
</div>


<div id="fileInputs">
<div id="addFile">
<input id="updateBtn" type="file" name="photoFile" class="btn btn-5 btn-5a icon-cog"  value="사진등록" onchange="readURL(this);" />
<input id="fakeBtn" type="button"  class="btn btn-5 btn-5a icon-cog"  value="사진등록" onclick="document.getElementById('updateBtn').click();"/>
</div>
<div id="cancelFile">
<input id="cancelBtn" type="button"  class="btn btn-5 btn-5a icon-cog"  value="등록취소" onclick="initPhoto()" />
</div>
</div>
</div>
          
            <div class="vspace-xs"></div>

            
            <div class="col-xs-12 col-sm-8">
            
            <div class="space-4"></div>
            <div class="space-4"></div>
            
            <div class="form-group">
              <label class="col-sm-3 control-label no-padding-right"
                     for="form-field-email">이름</label>

              <div class="col-sm-8">
                 <input  id="name"  name = "name"  />
              </div>
           </div>
           
            <div class="space-4"></div>
            <div class="space-4"></div>
            
                 <div class="form-group">
                 <label class="col-sm-3 control-label no-padding-right" for="form-field-date">생년월일</label>

                 <div class="col-sm-8">
<!--                  <div class="input-medium"> -->
<!--                  <div class="input-group"> -->
                 <input class="col-xs-3" id="personalNumber" type="date" name="personalNumber"
                                        placeholder="yyyy-MM-dd" /> 
<!--                                     </div> -->
<!--                                   </div> -->
                                </div>
                              </div>
                              </div>
                              </div>
      <div class="space-4"></div>
                              
                              
           <h4 class="header blue bolder smaller">Contact</h4>

          <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-username">주소</label>

                <div class="col-sm-8">
                  <input class="col-xs-10 col-sm-8" type="text"
                    id="addresss"  name ="addresss"  placeholder="주소를 입력해 주세요" />
                </div>
              </div>
          <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-username">이메일</label>
                <div class="col-sm-8">
                   <input  id="email"  name ="email"  />
<!--                   <input type="text" -->
<!--                     id="email"  name ="email"  placeholder="email 주소를 입력해 주세요" /> -->
                </div>
              </div>
          

          <div class="form-group">
            <label class="col-sm-1 control-label no-padding-right"
              for="form-field-phone">핸드폰번호</label>

            <div class="col-sm-8">
            <span>
            <input class="col-sm-1" type="text" id="hp1"  name = "hp1"  placeholder="010" >
            <input class="col-sm-1" type="text" id="hp2"  name = "hp2"  placeholder="1234" >
            <input class="col-sm-1" type="text" id="hp3"  name = "hp3"  placeholder="5678" />
             <input type="hidden"   id="tel" name="tel">
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
<!-- <button class="btn btn-primary"   onclick="javascript:formCheck();">직원등록</button> -->
<button class="btn btn-default">취소</button>
</div>
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
	
//	myWin = window.open('searchCompany.do', 'popwindow', 'width=300,height=300');
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

	
	
	var name = document.getElementById('name');
	var personalNumber = document.getElementById('personalNumber');
	var addresss = document.getElementById('addresss');
	
	
	
	var hp1 = document.getElementById('hp1'); 
	var hp2 = document.getElementById('hp2'); 
	var hp3 = document.getElementById('hp3'); 
	var tel = document.getElementById('tel'); 
	var hp = hp1.value + "-" + hp2.value + "-" + hp3.value;
	document.getElementById("tel").value = hp;
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
	if (addresss.value == '' || addresss.value == null) {
		alert('주소를 입력하세요');
		focus.addresss;
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
		
			
		Frm.submit();
	
	
}

</script>

</body>
</html>
