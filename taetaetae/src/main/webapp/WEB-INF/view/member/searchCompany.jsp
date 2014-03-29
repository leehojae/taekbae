<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko"><head>
<meta http-equiv="Content-type" content="text/html;charset=euc-kr">
<title>SDMS 직원 증명사진  :: 이미지 첨부</title>
<link rel="stylesheet" href="http://t.static.blog.naver.net/mylog/versioning/common/css/paper-140562.css" type="text/css">
<script type="text/javascript" src="http://t.static.blog.naver.net/mylog/versioning/add_image-832127.js"></script>
<script language="javascript">


	//added by mj.chong 2006. 10. 16, IE7
	function resizeWindow() {
		window.resizeTo(370,360);
	}


	function search(){
		
		
		Frm = document.forms[0];
		
		
		if(Frm.searchKsearcheywordA.value  == "")
		{
			alert("검색할 사업자 번호를 입력해 주세요.");
			return ;
		}	
		Frm.action = "../office/searchCompany.do?no=" + Frm.searchKsearcheywordA.value;
 		
		Frm.submit();
	}
	
	function chkFrm() {
		
		var officeName = window.opener.document.getElementById("officeName");
		var officeNum = window.opener.document.getElementById("officeNum"); 
		
/* 		Frm = document.forms[0];
		
		var filenm = Frm.file1.value; */
 		
		 var getOfficeName = document.getElementById("hiddenOfficeName").innerHTML;
 		 var getOfficeNumber = document.getElementById("officeNumber").innerHTML;
		alert("getOfficeName :"  + getOfficeName   + ", dddd :  " + getOfficeNumber );
		officeNum.value = getOfficeNumber;
		officeName.value = getOfficeName; 
		
		window.close();
		
	}

	
</script>
</head>

<body onload="resizeWindow();SetFilezise();">
<div id="pop_wrap">     
	<form name="FileFrm" enctype="multipart/form-data" method="post">
	
	
	
	
	<input type="hidden" name="imgOnlyYn" value="1">
	<input type="hidden" name="attachAllsize" value="0">
	<input type="hidden" name="myfilesize" value="0">
	<input type="hidden" name="maxfilesize" value="524288000">
	<input type="hidden" name="uploadPolicy" value="GENERAL_IMAGE">
	<input type="hidden" name="isProfileThumbUpload" value="true">
<!-- 	<input type="file" name="photoFile" value="true"> -->
	<fieldset>
	<legend>파일업로드</legend>
	
	<div id="pop_content">
		<div class="file_section">
	
			<p>사업소번호를 검색해주세요</span></p>
			<input id="searchKsearcheywordA"/>
<!-- 			<input type="text" id="search" class="text">  -->
			<input id="updateBtn" type="button" value="찾아보기" onclick="search()" />
<!-- 			<br> -->
<%-- 			<input type='text' name='officeNum'  value='${office.officeNum}'  readonly='true' > --%>
<!-- 			<br> -->
<%-- 			<input type='text' name='officeNum'  value='${office.officeName}'  readonly='true' > --%>
<!-- 			<br> -->
			
			
<style type="text/css">	
#hiddenOfficeName  {
position: inherit;
opacity: 100;
}
#officeNumber  {
position: inherit;
opacity: 100;
}
</style>
<c:choose>
 <c:when test="${   office.officeName ==null}">
 <br>
시스템에 등록된 사업소의 사업자번호를 입력해주세요
 </c:when>
 <c:when test="${   office.officeName !='' }">
  <br>
 <div>사업자번호  <span id="officeNumber">${office.officeNum}</span> 으로 검색한 결과  <span id="hiddenOfficeName" >${office.officeName}</span> 사업소가 나왔습니다. </div>
  <%-- 사업자번호  ${office.officeNum} 으로 검색한 결과  ${office.officeName} 사업소가 나왔습니다. --%>
 </c:when>
 <c:otherwise>
<%--   사업자번호      ${office.officeNum} 으로 검색한    사업소가 없습니다.  --%>
 </c:otherwise>
</c:choose>
			

			

			
		</div>
		
		
	</div>
	
	

<!-- 	<div style="margin:0 20px;padding:12px 0 15px;line-height:0;text-align:center;word-spacing:-2px"><a href="#" id="submitBtn" class="_returnFalse" onclick="goSubmit()" tabindex="0"><img src="http://blogimgs.naver.net/imgs/btn_ok1.gif" style="cursor:pointer;visibility:visible" name="sbtn" id="sbtn"></a> -->
<div style="margin:0 20px;padding:12px 0 15px;line-height:0;text-align:center;word-spacing:-2px">
	<input id="updateBtn" type="button" value="등록하기" onclick="chkFrm()" />
	<input id="delBtn" type="button" value="취소"  onclick="window.close()" />

</div>
<!-- 	<a href="#" id="cancelImageUpload" class="_returnFalse" onclick="window.close()" tabindex="0"><img src="http://blogimgs.naver.net/imgs/btn_cncl.gif" width="50" height="29" alt="취소"></a></div> -->

	</fieldset>
	</form>

</div>



</body></html>