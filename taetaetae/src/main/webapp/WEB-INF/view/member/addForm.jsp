<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/loginMain.css"/> 
	<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/member.css"/> 
	<script src = "../js/jquery-1.8.2.min.js" type = "text/javascript"></script> 
	<script src = "../js/jquery-ui.js" type = "text/javascript"></script> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    
    <!--jquery.ui.datepicker 한글팩 -->
    <script src = "../js/jquery.ui.datepicker-ko.js" type = "text/javascript"></script> 
    
    <!--캘린더 : 외부 js파일-->
    <script src = "../js/calendar2.js" type = "text/javascript"></script> 
</head>

	<body>

<form method="post" action="ajax/addMember.do"    enctype="multipart/form-data">
<input type='hidden'   id ='photo' name='photo' >
   	<TABLE  id="mytable"   WIDTH="50%"  height="100">
<TR>


<th rowspan=8 bgcolor=#F6F6F6>     

<div id ="photoZone">
<img id="mPhoto"     name="mPhoto"   src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>
</div>

<input id="updateBtn" type="button" value="사진등록" onclick="photoUploadPopup()" />
	<input id="delBtn" type="button" value="삭제"  onclick="initPhoto()" />
</th>
</tr>
<tr>
<TD WIDTH="20%" bgcolor=#E4F7BA>소속
<TD WIDTH="53%"><select id="officeNum" name="officeNum" >
              						<option value="" selected="selected">소속</option>
              						<option value=" 1">양재택배</option>
              					</select></TD>
              					</tr>

<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>직위<br></TD>
<TD WIDTH="53%"><select id="rank" name="rank" >
              						<option value="" selected="selected">소속</option>
              						<option value=" 1">양재택배</option>
              					</select></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>아이디</TD>
<TD WIDTH="53%"><input id="id" name="id" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>비밀번호</TD>
<TD WIDTH="53%"><input id="password" name="password" class="a" type="password" value="" maxlength="100"><br></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>이름</TD>
<TD WIDTH="53%"><input id="name" name="name" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>생년월일</TD>
<TD WIDTH="53%">
 <input type="date"    id="personalNumber"   name="personalNumber">
</TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>전화번호</TD>
<TD WIDTH="53%"><input id="tel" name="tel" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>
<TR>
<th colspan=3><br><input type='submit' value='직원 등록 신청'>&nbsp;&nbsp;<input type='reset' value='취소'>
</TR>

</TABLE>
   	
   </form>	
   	
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