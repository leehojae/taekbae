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
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
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
    
    <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    
    
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
<TD WIDTH="53%"  bgcolor=#FFFF6C><select id="officeNum" name="officeNum" >
                          <option value="" selected="selected">소속</option>
                          <option value=" 1">양재택배</option>
                        </select></TD>
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




<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->
<!--  -------------------------------------------------사용자 정보 입력 1------------------------------------------------- -->


<form class="form-horizontal">
  <fieldset>
    <legend>직업가입란</legend>
  </fieldset>
  
  <div class="tab-content profile-edit-tab-content">
              <div id="edit-basic" class="tab-pane in active">
                              <h4 class="header blue bolder smaller">General</h4>

                              <div class="row">
                                <div class="col-xs-12 col-sm-4">
                                  <input type="file" />
                                </div>

                                <div class="vspace-xs"></div>

                                <div class="col-xs-12 col-sm-8">
                                 <div class="form-group">
                                    <label class="col-sm-4 control-label no-padding-right" for="form-field-id">ID</label>

                                    <div class="col-sm-8">
                                      <input class="col-xs-12 col-sm-10" type="text" id="form-field-id" placeholder="ID"  />
                                    </div>
                                  </div>

                                  <div class="space-4"></div>
                                  <div class="form-group">
                                    <label class="col-sm-4 control-label no-padding-right" for="form-field-username">Username</label>

                                    <div class="col-sm-8">
                                      <input class="col-xs-12 col-sm-10" type="text" id="form-field-username" placeholder="Username"  />
                                    </div>
                                  </div>
                                                                  
                                 <div class="space-4"></div>
                                   <div id="edit-password" class="tab-pane">

                                  <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-pass1">New Password</label>

                                  <div class="col-sm-9">
                                    <input type="password" id="form-field-pass1" />
                                  </div>
                                 </div>

                                 <div class="space-4"></div>

                               <div class="form-group">
                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-pass2">Confirm Password</label>

                                  <div class="col-sm-9">
                                    <input type="password" id="form-field-pass2" />
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                <hr />
                              <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-date">Birth Date</label>

                                <div class="col-sm-9">
                                  <div class="input-medium">
                                    <div class="input-group">
                                      <input class="input-medium date-picker" id="form-field-date" type="text" data-date-format="dd-mm-yyyy" placeholder="dd-mm-yyyy" />
                                      <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-calendar">
                                        </i>
                                      </span>
                                    </div>
                                  </div>
                                </div>
                              </div>
  
                              <div class="space-4"></div>

                              <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Gender</label>

                                <div class="col-sm-9">
                                  <label class="radio">
                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked=""/>
                                    <span class="lbl"> Male</span>
                                  </label>

                                  <label class="radio">
                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"/>
                                    <span class="lbl"> Female</span>
                                  </label>
                                </div>
                              </div>

                              <div class="space-4"></div>

                                <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-comment">Comment</label>
                                <div class="col-lg-5">
                                  <textarea class="form-control" rows="3" id="textArea"></textarea>
                                  <span class="help-block">자기소개를 입력하세요~! 우리자기는 이뿌다. 이런거 말고...</span>

                                </div>
                              </div>

                              <div class="space"></div>
                              <h4 class="header blue bolder smaller">Contact</h4>

                              <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-email">Email</label>

                                <div class="col-sm-9">
                                  <span class="input-icon input-icon-right">
                                    <input type="email" id="form-field-email" value="alexdoe@gmail.com" />
                                    <i class="icon-envelope"></i>
                                  </span>
                                </div>
                              </div>

                              <div class="space-4"></div>

                              <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-website">Website</label>

                                <div class="col-sm-9">
                                  <span class="input-icon input-icon-right">
                                    <input type="url" id="form-field-website" value="http://www.alexdoe.com/" />
                                    <i class="icon-globe"></i>
                                  </span>
                                </div>
                              </div>

                              <div class="space-4"></div>

                              <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-phone">Phone</label>

                                <div class="col-sm-9">
                                  <span class="input-icon input-icon-right">
                                    <input class="input-medium input-mask-phone" type="text" id="form-field-phone" />
                                    <i class="icon-phone icon-flip-horizontal"></i>
                                  </span>
                                </div>
                              </div>

                              <div class="space"></div>
                              <h4 class="header blue bolder smaller">Office</h4>
                            
                            <div class="form-group">
      <label for="select" class="col-sm-3 control-label no-padding-right">부서선택</label>
      <div class="col-sm-9">
        <select class="form-control" id="select">
          <option>사장실</option><option>영업부</option><option>운송부</option>
          <option>배차부</option><option>주부</option><option>부부</option>
          <option>두부</option>
        </select>
        <br>
        <br>
     </div>
    
     <label for="select" class="col-sm3-2 control-label">직급선택</label>
      <div class="col-lg-10">
        <select class="form-control" id="select">
          <option>사장</option><option>부장</option><option>과장</option>
          <option>팀장</option><option>실장</option><option>사원</option>
          <option>인턴</option>
        </select>
        <br>
     </div>
                            
                            
                            
                            
                              
                </div>

                            

                            <div id="edit-password" class="tab-pane">
                              <div class="space-10"></div>

                              <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-pass1">New Password</label>

                                <div class="col-sm-9">
                                  <input type="password" id="form-field-pass1" />
                                </div>
                              </div>

                              <div class="space-4"></div>

                              <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-pass2">Confirm Password</label>

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




<!-- -----------------------------------------jQuery drop jpeg file---------------------------------------------- -->
<!-- -----------------------------------------jQuery drop jpeg file---------------------------------------------- -->
<!-- -----------------------------------------jQuery drop jpeg file---------------------------------------------- -->
<!-- -----------------------------------------jQuery drop jpeg file---------------------------------------------- -->
<!-- -----------------------------------------jQuery drop jpeg file---------------------------------------------- -->
<!-- -----------------------------------------jQuery drop jpeg file---------------------------------------------- -->




<!-- inline scripts related to this page -->

    <script type="text/javascript">
      jQuery(function($) {
      
        //editables on first profile page
        $.fn.editable.defaults.mode = 'inline';
        $.fn.editableform.loading = "<div class='editableform-loading'><i class='light-blue icon-2x icon-spinner icon-spin'></i></div>";
          $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="icon-ok icon-white"></i></button>'+
                                      '<button type="button" class="btn editable-cancel"><i class="icon-remove"></i></button>';    
        
        //editables 
          $('#username').editable({
          type: 'text',
          name: 'username'
          });
      
      
        var countries = [];
          $.each({ "CA": "Canada", "IN": "India", "NL": "Netherlands", "TR": "Turkey", "US": "United States"}, function(k, v) {
              countries.push({id: k, text: v});
          });
      
        var cities = [];
        cities["CA"] = [];
        $.each(["Toronto", "Ottawa", "Calgary", "Vancouver"] , function(k, v){
          cities["CA"].push({id: v, text: v});
        });
        cities["IN"] = [];
        $.each(["Delhi", "Mumbai", "Bangalore"] , function(k, v){
          cities["IN"].push({id: v, text: v});
        });
        cities["NL"] = [];
        $.each(["Amsterdam", "Rotterdam", "The Hague"] , function(k, v){
          cities["NL"].push({id: v, text: v});
        });
        cities["TR"] = [];
        $.each(["Ankara", "Istanbul", "Izmir"] , function(k, v){
          cities["TR"].push({id: v, text: v});
        });
        cities["US"] = [];
        $.each(["New York", "Miami", "Los Angeles", "Chicago", "Wysconsin"] , function(k, v){
          cities["US"].push({id: v, text: v});
        });
        
        var currentValue = "NL";
          $('#country').editable({
          type: 'select2',
          value : 'NL',
              source: countries,
          success: function(response, newValue) {
            if(currentValue == newValue) return;
            currentValue = newValue;
            
            var new_source = (!newValue || newValue == "") ? [] : cities[newValue];
            
            //the destroy method is causing errors in x-editable v1.4.6
            //it worked fine in v1.4.5
            /**     
            $('#city').editable('destroy').editable({
              type: 'select2',
              source: new_source
            }).editable('setValue', null);
            */
            
            //so we remove it altogether and create a new element
            var city = $('#city').removeAttr('id').get(0);
            $(city).clone().attr('id', 'city').text('Select City').editable({
              type: 'select2',
              value : null,
              source: new_source
            }).insertAfter(city);//insert it after previous instance
            $(city).remove();//remove previous instance
            
          }
          });
      
        $('#city').editable({
          type: 'select2',
          value : 'Amsterdam',
              source: cities[currentValue]
          });
      
      
      
        $('#signup').editable({
          type: 'date',
          format: 'yyyy-mm-dd',
          viewformat: 'dd/mm/yyyy',
          datepicker: {
            weekStart: 1
          }
        });
      
          $('#age').editable({
              type: 'spinner',
          name : 'age',
          spinner : {
            min : 16, max:99, step:1
          }
        });
        
        //var $range = document.createElement("INPUT");
        //$range.type = 'range';
          $('#login').editable({
              type: 'slider',//$range.type == 'range' ? 'range' : 'slider',
          name : 'login',
          slider : {
            min : 1, max:50, width:100
          },
          success: function(response, newValue) {
            if(parseInt(newValue) == 1)
              $(this).html(newValue + " hour ago");
            else $(this).html(newValue + " hours ago");
          }
        });
      
        $('#about').editable({
          mode: 'inline',
              type: 'wysiwyg',
          name : 'about',
          wysiwyg : {
            //css : {'max-width':'300px'}
          },
          success: function(response, newValue) {
          }
        });
        
        
        
        // *** editable avatar *** //
        try {//ie8 throws some harmless exception, so let's catch it
      
          //it seems that editable plugin calls appendChild, and as Image doesn't have it, it causes errors on IE at unpredicted points
          //so let's have a fake appendChild for it!
          if( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ) Image.prototype.appendChild = function(el){}
      
          var last_gritter
          $('#avatar').editable({
            type: 'image',
            name: 'avatar',
            value: null,
            image: {
              //specify ace file input plugin's options here
              btn_choose: 'Change Avatar',
              droppable: true,
              /**
              //this will override the default before_change that only accepts image files
              before_change: function(files, dropped) {
                return true;
              },
              */
      
              //and a few extra ones here
              name: 'avatar',//put the field name here as well, will be used inside the custom plugin
              max_size: 110000,//~100Kb
              on_error : function(code) {//on_error function will be called when the selected file has a problem
                if(last_gritter) $.gritter.remove(last_gritter);
                if(code == 1) {//file format error
                  last_gritter = $.gritter.add({
                    title: 'File is not an image!',
                    text: 'Please choose a jpg|gif|png image!',
                    class_name: 'gritter-error gritter-center'
                  });
                } else if(code == 2) {//file size rror
                  last_gritter = $.gritter.add({
                    title: 'File too big!',
                    text: 'Image size should not exceed 100Kb!',
                    class_name: 'gritter-error gritter-center'
                  });
                }
                else {//other error
                }
              },
              on_success : function() {
                $.gritter.removeAll();
              }
            },
              url: function(params) {
              // ***UPDATE AVATAR HERE*** //
              //You can replace the contents of this function with examples/profile-avatar-update.js for actual upload
      
      
              var deferred = new $.Deferred
      
              //if value is empty, means no valid files were selected
              //but it may still be submitted by the plugin, because "" (empty string) is different from previous non-empty value whatever it was
              //so we return just here to prevent problems
              var value = $('#avatar').next().find('input[type=hidden]:eq(0)').val();
              if(!value || value.length == 0) {
                deferred.resolve();
                return deferred.promise();
              }
      
      
              //dummy upload
              setTimeout(function(){
                if("FileReader" in window) {
                  //for browsers that have a thumbnail of selected image
                  var thumb = $('#avatar').next().find('img').data('thumb');
                  if(thumb) $('#avatar').get(0).src = thumb;
                }
                
                deferred.resolve({'status':'OK'});
      
                if(last_gritter) $.gritter.remove(last_gritter);
                last_gritter = $.gritter.add({
                  title: 'Avatar Updated!',
                  text: 'Uploading to server can be easily implemented. A working example is included with the template.',
                  class_name: 'gritter-info gritter-center'
                });
                
               } , parseInt(Math.random() * 800 + 800))
      
              return deferred.promise();
            },
            
            success: function(response, newValue) {
            }
          })
        }catch(e) {}
        
        
      
        //another option is using modals
        $('#avatar2').on('click', function(){
          var modal = 
          '<div class="modal hide fade">\
            <div class="modal-header">\
              <button type="button" class="close" data-dismiss="modal">&times;</button>\
              <h4 class="blue">Change Avatar</h4>\
            </div>\
            \
            <form class="no-margin">\
            <div class="modal-body">\
              <div class="space-4"></div>\
              <div style="width:75%;margin-left:12%;"><input type="file" name="file-input" /></div>\
            </div>\
            \
            <div class="modal-footer center">\
              <button type="submit" class="btn btn-small btn-success"><i class="icon-ok"></i> Submit</button>\
              <button type="button" class="btn btn-small" data-dismiss="modal"><i class="icon-remove"></i> Cancel</button>\
            </div>\
            </form>\
          </div>'});
          
          
          var modal = $(modal);
          modal.modal("show").on("hidden", function(){
            modal.remove();
          });
      
          var working = false;
      
          var form = modal.find('form:eq(0)');
          var file = form.find('input[type=file]').eq(0);
          file.ace_file_input({
            style:'well',
            btn_choose:'Click to choose new avatar',
            btn_change:null,
            no_icon:'icon-picture',
            thumbnail:'small',
            before_remove: function() {
              //don't remove/reset files while being uploaded
              return !working;
            },
            before_change: function(files, dropped) {
              var file = files[0];
              if(typeof file === "string") {
                //file is just a file name here (in browsers that don't support FileReader API)
                if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
              }
              else {//file is a File object
                var type = $.trim(file.type);
                if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
                    || ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
                  ) return false;
      
                if( file.size > 110000 ) {//~100Kb
                  return false;
                }
              }
      
              return true;
            }
          });
      
          form.on('submit', function(){
            if(!file.data('ace_input_files')) return false;
            
            file.ace_file_input('disable');
            form.find('button').attr('disabled', 'disabled');
            form.find('.modal-body').append("<div class='center'><i class='icon-spinner icon-spin bigger-150 orange'></i></div>");
            
            var deferred = new $.Deferred;
            working = true;
            deferred.done(function() {
              form.find('button').removeAttr('disabled');
              form.find('input[type=file]').ace_file_input('enable');
              form.find('.modal-body > :last-child').remove();
              
              modal.modal("hide");
      
              var thumb = file.next().find('img').data('thumb');
              if(thumb) $('#avatar2').get(0).src = thumb;
      
              working = false;
            });
            
            
            setTimeout(function(){
              deferred.resolve();
            } , parseInt(Math.random() * 800 + 800));
      
            return false;
          });
              
        });
      
        
      
     
      
        ///////////////////////////////////////////
        $('#user-profile-3')
        .find('input[type=file]').ace_file_input({
          style:'well',
          btn_choose:'Change avatar',
          btn_change:null,
          no_icon:'icon-picture',
          thumbnail:'large',
          droppable:true,
          before_change: function(files, dropped) {
            var file = files[0];
            if(typeof file === "string") {//files is just a file name here (in browsers that don't support FileReader API)
              if(! (/\.(jpe?g|png|gif)$/i).test(file) ) return false;
            }
            else {//file is a File object
              var type = $.trim(file.type);
              if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif)$/i).test(type) )
                  || ( type.length == 0 && ! (/\.(jpe?g|png|gif)$/i).test(file.name) )//for android default browser!
                ) return false;
      
              if( file.size > 110000 ) {//~100Kb
                return false;
              }
            }
      
            return true;
          }
        })
        .end().find('button[type=reset]').on(ace.click_event, function(){
          $('#user-profile-3 input[type=file]').ace_file_input('reset_input');
        })
        .end().find('.date-picker').datepicker().next().on(ace.click_event, function(){
          $(this).prev().focus();
        })
        $('.input-mask-phone').mask('(999) 999-9999');
      
      
      
        ////////////////////
        //change profile
        $('[data-toggle="buttons"] .btn').on('click', function(e){
          var target = $(this).find('input[type=radio]');
          var which = parseInt(target.val());
          $('.user-profile').parent().addClass('hide');
          $('#user-profile-'+which).parent().removeClass('hide');
        });
      });
    </script>
</body>


</html>
        




