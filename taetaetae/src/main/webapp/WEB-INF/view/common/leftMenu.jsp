<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

 <c:choose>
         <c:when test="${  '1'  eq  loginUser.rank  }">
         <div class="well sidebar-nav">
            <ul class="nav nav-list">
          
             <li><a href="../office/list.do">사업소목록</a></li>
             <li><a href="../office/nonApplist.do">미승인 사업소목록</a></li>
            </ul>
          </div><!--/.well -->
       </c:when>
       <c:when test="${  '2'  eq  loginUser.rank  }">
         <div class="well sidebar-nav">
            <ul class="nav nav-list">
           
            <li><a href="http://localhost:9999/taetaetae/secondMain.do">배송할당</a></li>
             <li><a href="../office/officeState">영업소정보</a></li>
              <li><a href="../member/list.do">직원 목록</a></li>
              <li><a href="../car/list.do">차량 목록</a></li>
              <li><a href="../area/list.do">배송구역 목록</a></li>
            </ul>
          </div><!--/.well -->
       </c:when>
          <c:when test="${  '3'  eq  loginUser.rank  }">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li><a href="http://localhost:9999/taetaetae/thirdMain.do">영업소정보3</a></li>
              <li><a href="../member/list.do">직원 목록</a></li>
              <li><a href="../car/list.do">차량 목록</a></li>
              <li><a href="../area/list.do">배송구역 목록</a></li>
            </ul>
          </div><!--/.well -->
       </c:when>
   </c:choose>



 	
</body>
</html>