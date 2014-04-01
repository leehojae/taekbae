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


$(function (){
  $("#gbox_grid").css("width", "100%");
});

    $(window.document).ready(function() {
      
    	  $("#searchBtn").click( function() {
    		  fn_reloadPjtList();
    		});
    	
    	
        $("#grid").jqGrid({   //   keywordA=' + $('#searchKeywordA').val()+'keywordB=' + $('#searchKeywordB').val()
            //url : 'http://apis.daum.net/socialpick/search?output=json',
           url : 'http://localhost:9999/taetaetae/office//ajax/officeList.do',
           // url : 'http://localhost:9999/taetaetae/office//ajax/officeList.do?keywordA=' + $('#searchKeywordA').val()+'&keywordB=' + $('#searchKeywordB').val(),
            caption : '승인 지점 목록',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
                                                    // (json 으로 외부에 요청을 보내면 보안정책에 위배되어 요청이 나가질 않는다.
                                                    //  따라서 datatype 을 jsonp로 변경하고 보내야 한다.)
            autowidth:true,  
            mtype : 'get',                     // mtype : 데이터 전송방식을 지정한다.
            height : 'auto',                 // height : 그리드의 높이를 지정한다.
            pager : '#pager',               // pager : 도구 모임이 될 div 태그를 지정한다.
            rowNum : 20,                      // rowNum : 한 화면에 표시할 행 개수를 지정한다.
            loadonce : true,                // loadonce : rowNum 설정을 사용하기 위해서 true로 지정한다.
            rowList : [10, 20, 30],       // rowList : rowNum을 선택할 수 있는 옵션을 지정한다.
            
            postData:{
            	keywordA: $("#searchKeywordA").val(),
            	keywordB: $("#searchKeywordB").val()},
            // colNames : 열의 이름을 지정한다.
            colNames : [ '사업자번호','지점명', '전화', '우편번호',  '주소',   '팩스' ],
            colModel : [
                        
                        { name : 'officeNum',         index : 'officeNum',         width :  150,    align : 'center' },
                        { name : 'officeName',         index : 'officeName',         width : 250,    align : 'center' },
                        { name : 'officeTel',         index : 'officeTel',         width : 250,    align : 'center' },
                        { name : 'officePostNum',         index : 'officePostNum',         width : 150,    align : 'center'  , hidden : true},
                        { name : 'officeAddr',         index : 'officeAddr',         width : 300,    align : 'center' , hidden : true},
                        { name : 'officeFax',         index : 'officeFax',         width : 300,    align : 'center' , hidden : true},
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
    location.href = "updateOffice.do?no="+($rowData['officeNum']) ;
    $("#ono").val($rowData['officeNum']);
    $("#oname").val($rowData['officeName']);
    $("#oTel").val($rowData['officeTel']);
    $("#oPostNum").val($rowData['officePostNum']);
    $("#oAddr").val($rowData['officeAddr']);
    $("#oFax").val($rowData['officeFax']);
    
  } 
 
        // navGrid() 메서드는 검색 및 기타기능을 사용하기위해 사용된다.
        }).navGrid('#pager', {
            search : true,
            edit : true,
            add : true,
            del : true
        });
        
      
        $("#updateBtn").click( function() {
          alert($('#oname').val());
          $.ajax( 'ajax/updateOffice.do', {
        type: 'POST',
        data: {
          officeNum: $('#ono').val(),
          officeName: $('#oname').val(),
          officeTel: $('#oTel').val(),
          officePostNum: $('#oPostNum').val(),
          officeAddr: $('#oAddr').val(),
          officeFax: $('#oFax').val()
        },
        success: function(members){
          location.href = 'officeList.do';
    }});
        
    }
        );
        
  
    });

    function deleteFunction()
    {
      var answer  = confirm( '삭제 하시겠습니까?' );
    if( answer ) 
    {
      
      location.href = 'ajax/deleteOffice.do?no=' + $('#ono').val();
    } 
      return;
    }

    
</script>

<title>점소관리</title>
</head>

<body >
<div id="content" style=" float:left; width: 100%;">
  <form  method="post"  enctype="multipart/form-data">

    <table id = "grid" style="width: 100%;"></table>
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
  $("#pager").css("width", "100%");
  $("#grid").css("width", "100%");
  $("#grid_officeNum").css("width", "100%");
  $("#grid_officeName").css("width", "100%");
  $("#grid_officeTel").css("width", "100%");
  $("tr").css("width", "100%");
  $("td").css("width", "100%");
});
</script>
  </form>
</div>
</body>
</html>