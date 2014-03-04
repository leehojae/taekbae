<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> -->
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/jquery-ui-1.10.2.custom.css"/>
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/ui.jqgrid.css"/>


<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> -->
<script src = "../js/jquery-1.11.0.min.js" type = "text/javascript"></script>
<script src = "../js/i18n/grid.locale-kr.js" type = "text/javascript"></script>
<script src = "../js/jquery.jqGrid.min.js" type = "text/javascript"></script>
<script>

    $(window.document).ready(function() {
    	
        $("#grid").jqGrid({
            //url : 'http://apis.daum.net/socialpick/search?output=json',
            url : 'http://localhost:9999/taetaetae/member/ajax/list.do',
            caption : '직원 현황',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
                                                    // (json 으로 외부에 요청을 보내면 보안정책에 위배되어 요청이 나가질 않는다.
                                                    //  따라서 datatype 을 jsonp로 변경하고 보내야 한다.)
 
            mtype : 'get',                     // mtype : 데이터 전송방식을 지정한다.
            height : '300px',                 // height : 그리드의 높이를 지정한다.
            pager : '#pager',               // pager : 도구 모임이 될 div 태그를 지정한다.
            rowNum : 20,                      // rowNum : 한 화면에 표시할 행 개수를 지정한다.
            loadonce : true,                // loadonce : rowNum 설정을 사용하기 위해서 true로 지정한다.
            rowList : [10, 20, 30],       // rowList : rowNum을 선택할 수 있는 옵션을 지정한다.
 
            // colNames : 열의 이름을 지정한다.
            colNames : [ 'no','지점', '이름', 'ID',  '직위',   '전화','생년월일','사' ],
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
                        postData:{
                			searchKeywordA: $("#searchKeywordA").val(),
                			searchKeywordB: $("#searchKeywordB").val()
                			},
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
    		//alert($('#mid').val());
        	$.ajax( 'ajax/add.do', {
				method: 'POST',
				data: {
					
					photo: $('#mphoto').val(),
					name: $('#mname').val(),
					id: $('#mid').val(),
					tel: $('#mtel').val(),
					rank: $('#mrank').val(),
					personalNumber: $('#mpersonalNumber').val(),
					officeName: $('#officeName').val(),
					personalNumber: $('#mpersonalNumber').val()
				},
				success: function(members){
					location.href = 'list.do';
		}});
    		
    });
    	
    	
        $("#delBtn").click( function() {
    		var answer  = confirm( '삭제 하시겠습니까?' );
    		if( answer ) 
    		{
    			
    			document.listform.action = "<c:url value='/delLocationRuleLibrary.das'/>";
    		   	document.listform.submit();
    		}; 	
    	});
    });

</script>

<title>직원관리</title>
</head>

<div id="header">
	<%@ include file="/common/include/top.inc.jsp"%>
	</div>
<body onload="init()">
<div id="menu" style="background-color:#000000;height:500px;width:200px;float:left;">
			<br>
			<br>
			<br>
      		<ul>
		        <li><a href="../main.do"><span></span>엑셀등록</a>
		        <li><a href="getTransportSimulationConfigView.das"><span></span>디비초기화</a>
		         <li><a href="../member/list.do"><span></span>회원등록</a>
		        <li><a href="getTransportSimulationConfigView.das"><span></span>점소등록</a>
		        <li><a href="getTransportSimulationConfigView.das"><span></span>차량등록</a>
		        <li><a href="getTransportSimulationConfigView.das"><span></span>배송구역등록</a>
      		</ul>
</div>

<div id="content" style=" float:left;">
 <br>
  <table id = "grid"></table>
    <div id = "pager"></div>

  <form  method="post"  enctype="multipart/form-data">
<select id="officeName">
<option value="volvo">지점</option>
  <option value="saab">이름</option>
  <option value="mercedes">아이디</option>
</select>
<input id=searchKeywordA type="text" name="mname">
		<input id="delBtn" type="button" value="검색">
    <table id = "grid"></table>
    <div id = "pager"></div>
    
    
   <table border=1    WIDTH="635"   bgcolor="#EAEAEA">
	<tr>
	<td rowspan=3><img id="mPhoto" src="../images/images (8).jpeg" height="100"></td>
	<td>소속 :
		<select id="officeName">
			<option value="volvo">지점</option>
  			<option value="saab">이름</option>
  			<option value="mercedes">아이디</option>
		</select>
	</td>
	<td>
		직위 : <input id=mrank type="text" name="mrank">
	</tr>
	<tr>
	<td>
		이름 : <input id=mname type="text" name="mname">
	</td>
	<td>
		생년월일 : <input id=mpersonalNumber type="text" name="mpersonalNumber">
	</td>	
	</tr>
	<tr>
	<td>
		전화 : <input id=mtel type="text" name="mtel">
	</td>
	<td>
		ID : <input id=mid type="text" name="mid">
	</td>	
	</tr>
	

</table>
		<input id="addBtn" type="button" value="등록">
		<input id="updateBtn" type="button" value="변경" class="view">
		<input id="delBtn" type="button" value="삭제">
		<input id="cancelBtn" type="reset" value="취소">
	</form>
</body>
</html>