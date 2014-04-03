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



<script type="text/javascript">

$(window.document).ready(function() {
	
    $("#grid").jqGrid({
        //url : 'http://apis.daum.net/socialpick/search?output=json',
        url : 'http://localhost:9999/taetaetae/car/ajax/list.do',
        caption : '차량 현황',    // caption : 그리드의 제목을 지정한다.
        datatype : 'json',               // datatype : 데이터 타입을 지정한다.
                                                // (json 으로 외부에 요청을 보내면 보안정책에 위배되어 요청이 나가질 않는다.
                                                //  따라서 datatype 을 jsonp로 변경하고 보내야 한다.)

        mtype : 'get',                     // mtype : 데이터 전송방식을 지정한다.
        height : '300px',                 // height : 그리드의 높이를 지정한다.
        pager : '#pager',               // pager : 도구 모임이 될 div 태그를 지정한다.
        rowNum : 20,                      // rowNum : 한 화면에 표시할 행 개수를 지정한다.
        loadonce : true,                // loadonce : rowNum 설정을 사용하기 위해서 true로 지정한다.
        rowList : [10, 20, 30],       // rowList : rowNum을 선택할 수 있는 옵션을 지정한다.

        colNames : [ 'no','차량번호', '차종' ,  '모델명'   , '담당기사'   ],
        colModel : [
                    
                    { name : 'no',         index : 'no',         width : 70,    align : 'center'  , hidden : true},
                    { name : 'carNumber',         index : 'carNumber',         width : 140,    align : 'center' },
                    { name : 'carType',         index : 'carType',         width : 270,    align : 'center' },
                    { name : 'carModel',         index : 'carModel',         width : 270,    align : 'center' },
                    { name : 'driver',         index : 'driver',         width : 130,    align : 'center' },
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
	$("#carNumber").val($rowData['carNumber']);
	$("#carType").val($rowData['carType']);
	$("#carModel").val($rowData['carModel']);
	$("#cDriver").val($rowData['driver']);
	$("#mno").val($rowData['no']);
	$("#mnoUpdate").val($rowData['no']);

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
				carNumber : $('#carNumber').val(),
				carModel: $('#carModel').val(),
				carType: $('#carType').val(),
				driver: $('#cDriver').val()
			},
			success: function(car){
				location.href = 'carList.do';
	}});
		
}
    
    );
    $("#delBtn").click( function() {
    
    	$.ajax( 'ajax/delete.do', {
    		   type: 'POST',
			data: {

				no : $('#mno').val()
				
			},
			success: function(car){
				location.href = 'carList.do';
	}});
		
}
    
    );
    $("#updateBtn").click( function() {
    
    	$.ajax( 'ajax/update.do', {
    		   type: 'POST',
			data: {

				no : $('#mno').val(),
				carNumber : $('#carNumber').val(),
				carModel: $('#carModel').val(),
				carType: $('#carType').val(),
				mnoUpdate: $('#mnoUpdate').val()
				
			},
			success: function(car){
				location.href = 'carList.do';
	}});
}
    );
});

</script>

<style type="text/css">
.ui-pg-input {
  width: 20px;
}

.ui-pg-selbox {
  width: 100%;
}
body {
  margin: 10px;
}
</style>
<title>직원관리</title>
</head>

<body onload="init()">
<table id = "grid"></table>
<div id = "pager"></div>



<form  method="post"   name="frm"  id="frm"   onSubmit="formCheck();return false">
<table id = "grid" style="width: 100%;"></table>
<div id = "pager" style="width: 100%;"></div>
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
  $(".ui-jqgrid-labels > th").css("width", "100%");
/*   $("tr").css("width", "100%");
  $("td").css("width", "100%"); */
  $("content").css("width", "100%");
});
</script>

<table class="table">
<tr>
<td><div style="width : 64px; display: inline-block; vertical-align: middle;">차량번호  : </div><input id=carNumber type="text" name="cNumber" style="margin: 0px;"></td>
<td><div style="width : 64px; display: inline-block; vertical-align: middle;">모델 : </div><input id=carModel type="text" name="carModel" style="margin: 0px;"></td>	
</tr>
<tr>
<td><div style="width : 64px; display: inline-block; vertical-align: middle;">차종 : </div><input id=carType type="text" name="carType" style="margin: 0px;"></td>
<td><div style="width : 64px; display: inline-block; vertical-align: middle;">기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp사 : 
</div><input id=cDriver type="text" name="cDriver" style="margin: 0px;"   onfocus="myFunction()" ></td>
</tr>
<tr>
</table>
<input id=idDD  type="hidden" name="idDD" style="margin: 0px;">
<input id=mno  type="hidden" name="mno" style="margin: 0px;">   
<input id=mnoUpdate  type="hidden" name="mnoUpdate" style="margin: 0px;">   
 <input  id="addBtn" class="btn btn-default"   type="button"   value="등록"  >
<input id="updateBtn" class="btn btn-default" type="button" value="변경" class="view">
 <input  id="delBtn"  class="btn btn-default"   type="button"   value="삭제" onclick="deleteFunction()">
<input id="cancelBtn" class="btn btn-default" type="reset" value="취소">
</form>
</body>
<script type="text/javascript">
function myFunction()
{
	myWin = window.open('../member/memberPopup.do', 'popwindow', 'width=300,height=450');
	frm.carNumber.focus();
	return;
}

</script>
</html>