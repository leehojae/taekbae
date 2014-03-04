<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/jquery-ui-1.10.4.custom.css"/>
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../css/ui.jqgrid.css"/>

<script src = "../js/jquery-1.5.2.js" type = "text/javascript"></script>
<script src = "../js/i18n/grid.locale-kr.js" type = "text/javascript"></script>
<script src = "../js/jquery.jqGrid.min.js" type = "text/javascript"></script>
<script>



    $(window.document).ready(function() {
      
        $("#grid").jqGrid({
            //url : 'http://apis.daum.net/socialpick/search?output=json',
            url : 'http://localhost:9999/taetaetae/office//ajax/officeList.do',
            caption : 'rrreeee지점 목록',    // caption : 그리드의 제목을 지정한다.
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
        
        
        $("#updateBtn").click( function() {
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
          location.href = 'list.do';
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
      
      alert( " ddd :  " +   $('#ono').val()   );
    }
    function updateFunction()
    {
      alert( " 444 :  " +   $('#ono').val()   );
    }
</script>

<title>점소관리</title>
</head>



<div id="header">
  <%@ include file="/common/include/top.inc.jsp"%>
  </div>
  <br>
<body onload="init()">
<div id="menu" style="background-color:#000000;height:500px;width:200px;float:left;">
      <br>
      <br>
      <br>
          <ul>
            <li><a href="../main.do"><span></span>엑셀등록</a>
            <li><a href="getTransportSimulationConfigView.das"><span></span>디비초기화</a>
            <li><a href="getTransportSimulationConfigView.das"><span></span>회원등록</a>
            <li><a href="getTransportSimulationConfigView.das"><span></span>점소등록</a>
            <li><a href="getTransportSimulationConfigView.das"><span></span>차량등록</a>
            <li><a href="getTransportSimulationConfigView.das"><span></span>배송구역등록</a>
          </ul>
</div>
<div id="content" style=" float:left;">
 <br>
  <form  method="post"  enctype="multipart/form-data">
<select id="officeName"  style="margin:1px 0 0 0;"> 
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
    <input id="addBtn" type="button" value="등록" />
    <input id="updateBtn" type="button" value="변경"  />
    <input id="delBtn" type="button" value="삭제"    onclick="deleteFunction(   )" />
    <input id="cancelBtn" type="reset" value="취소" />
  </form>
</div>
</body>
</html>