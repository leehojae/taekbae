+<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
$(window.document).ready(function() {
	
	$("#grid").jqGrid({
        url : 'http://localhost:9999/taetaetae/member/ajax/list.do',
		datatype: "json",
		 colNames : ['no',      '지점', '이름', 'ID',  '직위',   '전화','생년월일','사진' ],
		  colModel : [
	                    
	                    

	                    { name : 'no',         index : 'no',         width : 50,    align : 'center'  , hidden : true},
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
	        	  	alert("eeee");
	        	  	 location.href = "../office/nonApplist.do";
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
	        	  	
	        	  }	,

	   	rowNum:10,
	   	rowList:[10,20,30],
	   	pager: '#pager',
	   	sortname: 'id',
		recordpos: 'left',
	    viewrecords: true,
	    sortorder: "desc",
		multiselect: true,
		caption: "직원 목록"
	});
	jQuery("#grid").jqGrid('navGrid','#pager',{add:false,del:false,edit:false,position:'right'});
	jQuery("#m1").click( function() {

		
		var selectedMembers = new Array();
		selectedMembers = jQuery("#grid").jqGrid('getGridParam','selarrrow');
		
		var answer  = confirm( '삭제 하시겠습니까?  ');
		if( answer ) 
			{
			for(var i = 0; i< selectedMembers.length ; i++)
			{
				
				location.href = 'ajax/delete.do?no=' + selectedMembers;
			}	
			}
		
	});
	
    $("#updateBtn").click( function() {
    	$.ajax( 'ajax/update.do', {
    		   type: 'POST',
			data: {
				no : $('#mno').val(),
				carNumber : $('#mname').val(),
				carLoad: $('#mid').val()
				
			},
			success: function(car){
				location.href = 'carList.do';
	}});
		
}
   
    );
	
	jQuery("#tttttt1s").click( function() {
		jQuery("#grid").jqGrid('setSelection',"13");
	});
	
	

    
});



jQuery("#grid").jqGrid('navGrid','#pager',{add:false,del:false,edit:false,position:'right'});




function addFunction()
{
		location.href = 'add.do' ;
}


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
<style type="text/css">

.ui-jqgrid-labels > th {
  font-size: 12px;
}

.ui-widget-content > td, .jqgrow ui-row-ltr > td {
  font-size: 12px;
}

#pager_left {
  font-size: 12px;
}

#pager_center > table > tbody > tr > td {
  font-size: 12px;
}

</style>
<title>직원관리</title>
</head>

<body onload="init()">



<input id="addBtn" type="submit" value="등록"   onclick="addFunction()" />
<form  method="post"   action="ajax/addMember.do"      enctype="multipart/form-data">
<input id="mno" name="mno" maxlength="15" value="0" type="hidden">
<table id = "grid"></table>
<div id = "pager"></div>
<script type="text/javascript">
$(function (){
  $("#gbox_grid").css("width", "100%");
  $("#gview_grid").css("width", "100%");
  $(".ui-jqgrid-titlebar .ui-jqgrid-caption .ui-widget-header .ui-corner-top .ui-helper-clearfix").css("width", "100%");
  $(".ui-state-default .ui-jqgrid-hdiv").css("width", "100%");
  $(".ui-jqgrid-labels").css("width", "100%");
  $(".ui-state-default .ui-jqgrid-hdiv").css("width", "100%");
  $(".ui-jqgrid .ui-jqgrid-hdiv").css("width", "100%");
  $(".ui-jqgrid-htable").css("width", "100%");
  $(".ui-jqgrid-bdiv").css("width", "100%");
  $(".ui-jqgrid-hbox").css("width", "100%");
  $(".ui-state-default .ui-th-column .ui-th-ltr").css("width", "100%");
  $("#pager").css("width", "100%");
  $("#pg_pager").css("width", "100%");
  $("#grid_cb").css("width", "100%");
  $("#grid").css("width", "100%");
  $("#grid > tbody > tr > td").css("width", "100%");
  $("#grid_officeNo").css("width", "100%");
  $("#grid_name").css("width", "100%");
  $("#grid_id").css("width", "100%");
  $("#grid_rank").css("width", "100%");
  $("#grid_tel").css("width", "100%");
  $("#grid_officeNum").css("width", "100%");
  $("#grid_officeName").css("width", "100%");
  $("#grid_officeTel").css("width", "100%");
  $("#grid_no").css("width", "100%");
  $("#jqgh_grid_cb").css("width", "100%");
/*   $("tr").css("width", "100%");
  $("td").css("width", "100%"); */
  $("content").css("width", "100%");
});
</script>
<input id="m1" type="button" value="삭제" />
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