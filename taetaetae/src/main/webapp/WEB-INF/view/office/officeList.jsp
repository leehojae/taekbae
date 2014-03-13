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

    $(window.document).ready(function() {
      
    	  $("#searchBtn").click( function() {
    		  fn_reloadPjtList();
    		});
    	
    	
        $("#grid").jqGrid({   //   keywordA=' + $('#searchKeywordA').val()+'keywordB=' + $('#searchKeywordB').val()
            //url : 'http://apis.daum.net/socialpick/search?output=json',
           url : 'http://localhost:9999/taetaetae/office//ajax/officeList.do',
           // url : 'http://localhost:9999/taetaetae/office//ajax/officeList.do?keywordA=' + $('#searchKeywordA').val()+'&keywordB=' + $('#searchKeywordB').val(),
            caption : '지점 목록',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
                                                    // (json 으로 외부에 요청을 보내면 보안정책에 위배되어 요청이 나가질 않는다.
                                                    //  따라서 datatype 을 jsonp로 변경하고 보내야 한다.)
 
            mtype : 'get',                     // mtype : 데이터 전송방식을 지정한다.
            height : '300px',                 // height : 그리드의 높이를 지정한다.
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
                        
                        { name : 'officeNum',         index : 'officeNum',         width : 150,    align : 'center' },
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
        
      
        $("#addBtn").click( function() {
          alert($('#oname').val());
          $.ajax( 'ajax/addOffice.do', {
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
          location.href = 'list.do';
    }});
        
    }
        );
        
  
    });

    
    
    /* 서고 목록 검색 function */
    function fn_reloadPjtList() 
    {
    	alert("TTT");
    	$("#grid").setGridParam({
    		postData : {
        		keywordA: $("#searchKeywordA").val(),
        		keywordB: $("#searchKeywordB").val()
    		}
    	}).trigger("reloadGrid");
    	alert("DDDD");
    	
    }
    
</script>

<title>점소관리</title>
</head>

<body >
<div id="content" style=" float:left;">
  <form  method="post"  enctype="multipart/form-data">

    <table id = "grid"></table>
    <div id = "pager"></div>
   <table border=1    WIDTH="635"   bgcolor="#EAEAEA">
  <tr>
  <td>
    사업자번호 : <input id=ono type="text" name="ono">
  </td>
  <td>
    점소명 : <input id=oname type="text" name="oname">
  </td> 
  </tr>
  <tr>
  <td>
    전화 : <input id=oTel type="text" name="oTel">
  </td>
  <td>
    우편번호 : <input id=oPostNum type="text" name="oPostNum">
  </td> 
  </tr>
  <tr>
  <td>
    팩스 : <input id=oFax type="text" name="oFax">
  </td>
  <td>
    주소 : <input id=oAddr type="text" name="oAddr">
  </td> 
  </tr>
</table>
    <input id="updateBtn" type="button" value="변경"  />
    <input id="delBtn" type="button" value="삭제"    onclick="deleteFunction( )" />
    <input id="cancelBtn" type="reset" value="취소" />
  </form>
</div>
</body>
</html>