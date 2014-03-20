<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/jquery-ui-1.10.1.custom.css"/>
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/ui.jqgrid.css"/>  
 
<script src = "../js/jquery-1.7.2.min.js" type = "text/javascript"></script> 
<script src = "../js/jquery.jqGrid.min.js" type = "text/javascript"></script>
<script src = "../js/i18n/grid.locale-kr.js" type = "text/javascript"></script>



<script>
var  ppp = null ;
$(window.document).ready(function() {
	
    $("#grid").jqGrid({
        //url : 'http://apis.daum.net/socialpick/search?output=json',
        url : 'http://localhost:9999/taetaetae/member/ajax/list.do',
        caption : '직원 현황',    // caption : 그리드의 제목을 지정한다.
        datatype : 'json',               // datatype : 데이터 타입을 지정한다.
                                                // (json 으로 외부에 요청을 보내면 보안정책에 위배되어 요청이 나가질 않는다.
                                                //  따라서 datatype 을 jsonp로 변경하고 보내야 한다.)

      	mtype: 'post',                 // mtype : 데이터 전송방식을 지정한다.
        height : '300px',                 // height : 그리드의 높이를 지정한다.
        pager : '#pager',               // pager : 도구 모임이 될 div 태그를 지정한다.
        rowNum : 20,                      // rowNum : 한 화면에 표시할 행 개수를 지정한다.
        loadonce : true,                // loadonce : rowNum 설정을 사용하기 위해서 true로 지정한다.
        rowList : [10, 20, 30],       // rowList : rowNum을 선택할 수 있는 옵션을 지정한다.

        
    	postData: {
			searchKeywordA: $("#searchKeywordA").val()
			, searchKeywordB: $("#searchKeywordB").val()
		},
        colNames : [ 'no','지점', '이름', 'ID',  '직위',   '전화','생년월일','사진' ],
        colModel : [
                    
                    { name : 'no',         index : 'no',         width : 50,    align : 'center' },
                    { name : 'officeName',         index : 'officeName',         width : 150,    align : 'center' },
                    { name : 'name',         index : 'name',         width : 150,    align : 'center' },
                    { name : 'id',         index : 'id',         width : 110,    align : 'center' },
                    { name : 'rank',         index : 'rank',         width : 150,    align : 'center' },
                    { name : 'tel',         index : 'tel',         width : 150,    align : 'center' , hidden : true},
                    { name : 'personalNumber',         index : 'personalNumber',         width : 150,    align : 'center' , hidden : true},
                    { name : 'photo',         index : 'photo',         width : 1,    align : 'center' , hidden : true},
                    ],
        jsonReader : {
        	 repeatitems : false,
             id : "no",
             root : function (obj) { return obj.jsonResult.data; },
             page : function (obj) { return 1; },
             total : function (obj) { return 1; },
             records : function (obj) {return  obj.jsonResult.data.length; }
},

onCellSelect: function(rowid, iCol, nCol, cellcontent, event) {

 //$("#status").val("edit");
	var $rowData = $(this).getRowData(rowid);
	
	 console.log( "dddddeux : "+    ($rowData['photo'])   );
	 ppp  =   ($rowData['photo']) ;
	 setPhoto() ;
	$("#mno").val($rowData['no']);
	$("#mname").val($rowData['name']);
	$("#mofficeName").val($rowData['officeName']);
	$("#mrank").val($rowData['rank']);
	$("#mtel").val($rowData['tel']);
	$("#mid").val($rowData['id']);
	$("#mpersonalNumber").val($rowData['personalNumber']);
	$("#mphoto").val($rowData['photo']);
	
}	

    // navGrid() 메서드는 검색 및 기타기능을 사용하기위해 사용된다.
    }).navGrid('#pager', {
        search : true,
        edit : true,
        add : true,
        del : true
    });
    
    
    
	
	  
    $("#addBtn").click( function() {
    
    	$.ajax( 'ajax/add.do', {
    		   type: 'POST',
			data: {
				no : $('#mno').val(),
				name : $('#mname').val(),
				id: $('#mid').val(),
				tel: $('#mtel').val(),
				personalNumber: $('#mpersonalNumber').val(),
				officeNum: $('#oAddr').val(),
				officeName: $('#oAddr').val(),
				rank: $('#mrank').val()
			},
			success: function(members){
				location.href = 'memberList.do';
	}});
		
}
    );
    
    
    $("#searchBT").click( function() {  
    	
    	fn_reloadPjtList();
        return false;
	});
    
    
    $("#updateBtn").click( function() {
    	$.ajax( 'ajax/update.do', {
    		   type: 'POST',
			data: {
				no : $('#mno').val(),
				name : $('#mname').val(),
				id: $('#mid').val(),
				tel: $('#mtel').val(),
				personalNumber: $('#mpersonalNumber').val(),
				officeNum: $('#oAddr').val(),
				officeName: $('#oAddr').val(),
				rank: $('#mrank').val()
			},
			success: function(members){
				location.href = 'memberList.do';
	}});
		
}
   
    );
    
});


function deleteFunction()
{
	var answer  = confirm( '삭제 하시겠습니까?  ');
	if( answer ) 
	{
		location.href = 'ajax/delete.do?no=' + $('#mno').val();
	}	
	return;
}



function setPhoto() {
	
	if(ppp == "")
	{
		photoZone.innerHTML = '<img id="mPhoto"   name="mPhoto" src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>';
	}
	else{
		photoZone.innerHTML = '<img id="mPhoto"   name="mPhoto" src="' +   ppp   + '"height="100"><br>';
	}	
	
}



function fn_reloadPjtList() 
{
	
	
	$("#grid").jqGrid().setGridParam({postData:{
		searchKeywordA: $("#searchKeywordA").val(),
		searchKeywordB: $("#searchKeywordB").val()
	}, page:1}).trigger("reloadGrid");	
	alert("sssss3333");
}

</script>

<title>직원관리</title>
</head>

<body onload="init()">




<form  method="post"  enctype="multipart/form-data">
<input id="mno" name="mno" maxlength="15" value="0" type="hidden">
<table id = "grid"></table>
<div id = "pager"></div>

<TABLE  id="mytable"    class="boardList">
<TR>


<th rowspan=7 bgcolor=#F6F6F6>     

<div id ="photoZone">
<img id="mPhoto"     name="mPhoto"   src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>
</div>
<!-- <input  type="button"  class="btn btn-5 btn-5a icon-cog"  value="사진등록" onclick="photoUploadPopup()" /> -->
<!-- 	<input id="delBtn" type="button" value="삭제"  onclick="initPhoto()" /> -->
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
<TD WIDTH="53%"  bgcolor=#FFFF6C><input id="mid" name="mid" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>이름</TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C><input id="mname" name="mname" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>생년월일</TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C>
<input id="mtel" name="mtel" class="a" type="text" value="" maxlength="100">
</TD>
</TR>
<TR>
<TD WIDTH="20%" bgcolor=#E4F7BA>전화번호</TD>
<TD WIDTH="53%"  bgcolor=#FFFF6C><input id="mtel" name="mtel" class="a" type="text" value="" maxlength="100"><br></TD>
</TR>

</TABLE>
   	
   

  
	<input id="updateBtn" type="button" value="변경" class="view">
	<input id="delBtn" type="button" value="삭제"  onclick="deleteFunction()" />
	<input id="cancelBtn" type="reset" value="취소">
	</form>	
</body>


        <script>
      
      function photoUploadPopup()
      {
      	 myWin = window.open('updateImage.do', 'popwindow', 'width=300,height=300');
      	 
      	 photoZone = document.getElementById('photoZone');
        
      }

      
      
      

function initPhoto() {
	photoZone.innerHTML = '<img id="mPhoto"   name="mPhoto" src="../images/memberPhoto/bg_noimage_1.gif" height="100"><br>';
}
</script>
</html>