<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	//added by mj.chong 2006. 9. 26 로그인 체크 후 로그아웃 상태면 로그인 팝업
	function goSubmit() {
		//
		alert("goSubmit");
		window.close();
		
	}

	function chkFrm() {
		
		var mPhoto = window.opener.document.getElementById("mPhoto");
		mPhoto.src = document.getElementById("pathTextViewer").value;
       
		
		
		Frm = document.forms[0];

		var filenm = Frm.file1.value;
		
		
		
		 alert(" filenm  :" + filenm);
		var attachMysize = 0;
		if (filenm==""){
			alert("파일을 첨부해주세요!");
			return false;
		}else if(filenm.indexOf("%") >=0 ){
			alert("파일명에 '%'문자를 포함할 수 없습니다. 파일명을 변경하신후  다시 올려주세요.");
			return false;
		}
		var ext = filenm.slice(filenm.lastIndexOf(".")+1).toLowerCase();
		if  (!(ext == "gif" || ext == "jpg" || ext == "png")){
			alert("이미지파일 (.gif, .jpg, .png) 만 업로드 가능합니다.");
			return false;
		}
		
 		Frm.action = "setPhoto.do";
 		
		Frm.submit();
		window.close();
		
	}

	function SetFilezise() {
		var attachAllsize = "0";

		document.FileFrm.attachAllsize.value = attachAllsize;
	}
</script>
</head>

<body onload="resizeWindow();SetFilezise();">

<select name="ddlNames" id="ddlNames">
    <option value="Mudassar Khan">Mudassar Khan</option>
    <option value="John Hammond">John Hammond</option>
    <option value="Mike Stanley">Mike Stanley</option>
</select>
<br />
<br />
<input type="button" value="Select" onclick="SetName();" />
<script type="text/javascript">
    function SetName() {
        if (window.opener != null && !window.opener.closed) {
            var txtName = window.opener.document.getElementById("txtName");
            txtName.value = document.getElementById("ddlNames").value;
        }
        window.close();
    }
</script>



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
	
	
			<span><input type="file" name="file1" onchange="$('pathTextViewer').value=this.value"></span>
			<input type="text" id="pathTextViewer" class="text" readonly="" value=""> <img src="http://blogimgs.naver.net/imgs/btn_fnd.gif" width="61" height="23" alt="찾아보기">
		</div>
		<p><em>500K</em>미만의 파일만 등록할 수 있습니다. (파일명은 영문,숫자만 가능)<br><span>영문, 숫자가 아닐경우 이미지가 안보일 수 있습니다.</span></p>
		
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