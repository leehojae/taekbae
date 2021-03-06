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
    <script type="text/javascript">
    function BusinessNumber(str) {
    	var str = str.value
    	        // 사업자번호 오류검증
    	        // 아래 공식으로 계산후 10의 배수가 나오면 검증일치
    	        var num = new Array();
    	            num[0] = 1;
    	            num[1] = 3;
    	            num[2] = 7;
    	            num[3] = 1;
    	            num[4] = 3;
    	            num[5] = 7;
    	            num[6] = 1;
    	            num[7] = 3;
    	            num[8] = 5;
    	        var totalNumber = 0;
    	        var _num        = 0;
    	        for (i = 0; i < str.length-1; i++) {
    	            _num = parseInt(str.charAt(i)) * num[i];
    	            _num = "" + _num;
    	            if (i < 8) {
    	                totalNumber = totalNumber + parseInt(_num.charAt(_num.length-1));
    	            } else {
    	                totalNumber = (_num.charAt(_num.length-2) == "") ? totalNumber + 0 : totalNumber + parseInt(_num.charAt(_num.length-2));
    	                totalNumber = totalNumber + parseInt(_num.charAt(_num.length-1));
    	            }
    	        }
    	        totalNumber = totalNumber + parseInt(str.charAt(str.length-1));
    	        var num1    = str.substring(0,3);
    	        var num2    = str.substring(3,5);
    	        var num3    = str.substring(5,10);
    	        if (str == "") {
    	            alert("사업자번호를 입력하세요.");
    	            return false;
    	        } else if (num1.length != 3 || num2.length != 2 || num3.length != 5) {
    	            alert("유효하지 않은 사업자 번호입니다.");
    	            return false;
    	        } else if (!this.numberChecked(str)) {
    	            alert("유효하지 않은 사업자 번호입니다.");
    	            return false;
    	        } else if (totalNumber%10 != 0) {
    	            alert("유효하지 않은 사업자 번호입니다.");
    	            return false;
    	        } else {
    	            return true;
    	        }
    	    }
    
    
    // 전화번호
    var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
// 01로 시작하는 핸드폰 및 지역번호와 050, 070 검증
// 원래 050은 0505 평생번호인가 그런데 보편적으로 050-5xxx-xxxx 로 인식함
// 0505-xxx-xxxx 라는 식으로 넣으면 통과할 수 없음. 그래서 경고창 띄울때 예시 넣는것이 좋음.
// -(하이픈)은 넣어도 되고 생략해도 되나 넣을 때에는 정확한 위치에 넣어야 함.

function telChk(obj) {
    if(!obj.value) {
        alert("전화번호를 입력하세요.");
        obj.focus();
        return false;
    }
    else if (!regExp.test(obj.value)) {
        alert("잘못된 전화번호입니다. 숫자, - 를 포함한 숫자만 입력하세요. 예) 050-XXXX-XXXX");
        obj.focus();
        obj.select();
        return false
    }
    return true;
}
    </script>
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
    <form class="form-horizontal" method="post" action="ajax/addOffice.do" >
  
      
      <div class="tab-content profile-edit-tab-content">
        
        <h4 class="header blue bolder smaller">&nbsp;&nbsp;Office</h4>
         <div class="row">
            <div class="span6">
            <div class="form-group">
              <label for="form-field-officenum"
                class="col-sm-4 control-label no-padding-right">사업자등록번호</label>
              <div class="col-sm-8">
                <input class="col-xs-12 col-sm-10"    
                       type='text' name='officeNum' id ='officeNum' onblur="BusinessNumber(this)"   placeholder="'-'없이 숫자만 입력하세요." />
                   <br>    <span class="help-block">(영업소 사업자등록번호를 입력하세요)</span>
              </div>
           </div>   

           <div class="form-group">
              <label for="form-field-officename"
                class="col-sm-4 control-label no-padding-right">회사명</label>
              <div class="col-sm-8">
                <input class="col-xs-12 col-sm-10" type="text"
                    id ='officeName'  name='officeName'  placeholder="회사명" />
              </div>
           </div> 
           <div class="form-group">
              <label for="form-field-officepostnum"
                class="col-sm-4 control-label no-padding-right">우편번호</label>
              <div class="col-sm-8">
                <input class="col-xs-12 col-sm-10" type="text"
                      id="officePostNum"  name="officePostNum" placeholder="우편번호" />
              </div>
           </div> 
           </div>
           
           <div class="span6">
             <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-addr">주소</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text"
                    id="form-field-addr" name="officeAddr" placeholder="대표회사주소" />
                </div>
              </div>
              
               <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-tel">전화번호</label>

                <div class="col-sm-8">
                 <input class="col-xs-12 col-sm-10" type="text"
                    id='officeTel' name='officeTel' placeholder="전화번호" onblur="telChk(this)"/>
                </div>
              </div>
               <div class="form-group">
                <label class="col-sm-4 control-label no-padding-right"
                  for="form-field-fax">팩스</label>

                <div class="col-sm-8">
                  <input class="col-xs-12 col-sm-10" type="text"
                     name='officeFax' id='officeFax' placeholder="팩스번호" onblur="telChk(this)" />
                </div>
              </div>
          </div>
        </div>
    <hr />
<div class="form-group">
<div class="col-lg-10 col-lg-offset-2">
<button class="btn btn-default">취소</button>
<button type="submit" class="btn btn-primary">다음</button>
  </div>
  </div>
 
  </div>
  
  </form>

<hr />
<script type="text/javascript">


function validateCheck(){
	Frm = document.forms[0];
	 checkBizID(bizID)  ;
	
	
	Frm.submit();
}


function checkBizID(bizID)  //사업자등록번호 체크 
{ 
    // bizID는 숫자만 10자리로 해서 문자열로 넘긴다. 
    var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
    var tmpBizID, i, chkSum=0, c2, remander; 
     bizID = bizID.replace(/-/gi,''); 

     for (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i); 
     c2 = "0" + (checkID[8] * bizID.charAt(8)); 
     c2 = c2.substring(c2.length - 2, c2.length); 
     chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
     remander = (10 - (chkSum % 10)) % 10 ; 

    if (Math.floor(bizID.charAt(9)) == remander) return true ; // OK! 
      return false; 
} 




function NumObj(obj){

	   if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력

	    return true;

	   } else {

	   event.returnValue = false;

	  }
	 
	 }
function initPhoto() {
  photoZone.innerHTML = '<img id="mPhoto"   name="mPhoto" src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>';
};
</script>



</body>
</html>
