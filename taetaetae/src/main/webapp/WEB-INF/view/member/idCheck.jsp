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
			alert("검색할 아이디를 입력해 주세요.");
			return ;
		}	
		Frm.action = "../member/idCheck.do?id=" + Frm.searchKsearcheywordA.value;
 		
		Frm.submit();
	}
	
	function chkFrm() {
		
	var id = window.opener.document.getElementById("id");
	
	
 		
	 var getOfficeName = document.getElementById("search").innerHTML;
	 
		id.value = getOfficeName;
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
	
			<p>아이디 중복 검색</span></p>
			<input id="searchKsearcheywordA"/>
<!-- 			<input type="text" id="search" class="text">  -->
			<input id="updateBtn" type="button" value="찾아보기" onclick="search()" />
			
			
<style type="text/css">	
#hiddenOfficeName  {
position: inherit;
opacity: 100;
}
#search  {
position: inherit;
opacity: 100;
}
</style>
<c:choose>
 <c:when test="${   member.id ==null}">
 <br>
 <div>  <span id="search"  ><%= request.getParameter("id") %></span> 은 사용 할 수 있습니다. </div>
 </c:when>
 <c:when test="${   member.id !='' }">
  <br>
 <div>  <span id="search">${member.id}</span> 은 이미 시스템에 등록되어 있어 사용 할 수 없습니다. </div>
 </c:when>
 <c:otherwise>
<%--   사업자번호      ${member.memberNum} 으로 검색한    사업소가 없습니다.  --%>
 </c:otherwise>
</c:choose>
			

			

			
		</div>
		
		
	</div>
	
	

<div style="margin:0 20px;padding:12px 0 15px;line-height:0;text-align:center;word-spacing:-2px">
	<input id="updateBtn" type="button" value="사용하기" onclick="chkFrm()" />
	<input id="delBtn" type="button" value="취소"  onclick="window.close()" />

</div>

	</fieldset>
	</form>

</div>



</body></html>