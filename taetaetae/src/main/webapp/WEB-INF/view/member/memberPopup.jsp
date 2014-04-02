<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/jquery-ui-1.10.1.custom.css"/>
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/ui.jqgrid.css"/>  
<link href="../assets/css/bootstrap-ko.css" rel="stylesheet">
 
<script src = "../js/jquery-1.7.2.min.js" type = "text/javascript"></script> 
<script src = "../js/jquery.jqGrid.min.js" type = "text/javascript"></script>
<script src = "../js/i18n/grid.locale-kr.js" type = "text/javascript"></script>
<script language="javascript">



	//added by mj.chong 2006. 10. 16, IE7
	function resizeWindow() {
		window.resizeTo(370,360);
	}


	
	function chkFrm(no, id, name) {
		alert(   no + ",   "  + id+ ",   "  +  name   );
// 	var id = window.opener.document.getElementById("id");
	var cDriver = window.opener.document.getElementById("cDriver");
	var memberNo = window.opener.document.getElementById("memberNo");
	
// 		memberNo.value = no;
// 		id.value = id;

 		//cDriver.value = name;
 		cDriver.value = name;
//  		id.value = id;
//  		memberNo.value = no;
	
 		//opener.document.getElementById("b").value="change";    // 해당 ID의 value 값 변경

 		opener.document.getElementById("frm").submit();   // 해당 ID의 submit()을 호출
 		
		window.close();
		
	}

	
</script>
<script>
$(window.document).ready(function() {
	
	$("#grid").jqGrid({
        url : 'http://localhost:9999/taetaetae/member/ajax/list.do',
		datatype: "json",
		 autowidth:true,  
         mtype : 'get',                     // mtype : 데이터 전송방식을 지정한다.
         height : 'auto',                 // height : 그리드의 높이를 지정한다.
         pager : '#pager',               // pager : 도구 모임이 될 div 태그를 지정한다.
         rowNum : 20,                      // rowNum : 한 화면에 표시할 행 개수를 지정한다.
         loadonce : true,                // loadonce : rowNum 설정을 사용하기 위해서 true로 지정한다.
         rowList : [10, 20, 30],       // rowList : rowNum을 선택할 수 있는 옵션을 지정한다.
		
		
		 colNames : ['no',     '이름', 'ID'],
		  colModel : [
	                    
	                    

	                    { name : 'no',         index : 'no',         width : 50,    align : 'center'  , hidden : true},
	                    { name : 'name',         index : 'name',         width : 150,    align : 'center' },
	                    { name : 'id',         index : 'id',         width : 110,    align : 'center' },
	                   
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
	        	   $("#status").val("edit");
	        	  	var $rowData = $(this).getRowData(rowid);
// 	        	  	alert(   "ddd : "+   ($rowData['name'])  +  ",    ddd : "+     ($rowData['no'])  +  ",    ddd : "+     ($rowData['id'])    );
	        	  	chkFrm( ($rowData['no']),  ($rowData['id']),  ($rowData['name']));
	        	  	// location.href = "read.do?no="+($rowData['no']) ;
	        	  	// location.href = "read.do?no="+($rowData['no']) ;
	        	  	 console.log( "dddddeux : "+    ($rowData['photo'])   );
	        	  	 
	        	  	 
	        	  	 $('#mno').val()
// 	        	 	var $rowData = $(this).getRowData(rowid);
// 	        	 	$("#cno").val($rowData['no']);
// 	        	 	$("#cNumber").val($rowData['carNumber']);
// 	        	 	$("#cType").val($rowData['carType']);
// 	        	 	$("#cDriver").val($rowData['driver']);
	        	  	 
	        	  	 
	        	  	
	        	  }	,

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

input[type="radio"], input[type="checkbox"] {
  margin: 0px;
}

body {
  margin: 10px;
}

.ui-pg-input {
  width: 20px;
}

.ui-pg-selbox {
  width: 100%;
}

</style>
<title>직원관리</title>
</head>

<body>

<table id = "grid"></table>
<div id = "pager"></div>
<input id="mno" name="mno" maxlength="15" value="0" type="hidden">

</body>

</html>