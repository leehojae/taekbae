<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="//w2ui.com/src/w2ui-1.3.min.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script type="text/javascript" src="//w2ui.com/src/w2ui-1.3.min.js"></script>

<script type="text/javascript">
$(function () { 
  $('#toolbar').w2toolbar({
    name: 'toolbar',
    items: [
      { type: 'button',  id: 'item1',  caption: '엑셀등록', img: 'icon-page', hint: 'Hint for item 1' },
      { type: 'button',  id: 'item2',  caption: '디비초기화', img: 'icon-page', hint: 'Hint for item 2' },
      { type: 'button',  id: 'item3',  caption: '회원등록', img: 'icon-page', hint: 'Hint for item 3' },
      { type: 'button',  id: 'item4',  caption: '점소등록', img: 'icon-page', hint: 'Hint for item 4' },
      { type: 'button',  id: 'item5',  caption: '차량등록', img: 'icon-page', hint: 'Hint for item 5' },
      { type: 'button',  id: 'item5',  caption: '배송구역등록', img: 'icon-page', hint: 'Hint for item 5' },
      { type: 'spacer' },
      { type: 'html',  id: 'item6',
      html: '<div style="padding: 3px 10px;">'+
            '<a href="#">${loginUser.name}</a>'+
            '<a href="${pageContext.request.contextPath}/auth/logout.do">[로그아웃]</a>'+
            '</div>' 
      },
    ],
    onClick: function (event) {
      console.log('Target: '+ event.target, event);
    }
  });
});
</script>

<div id="toolbar" style="padding: 4px; border: 1px solid silver; border-radius: 3px"></div>
<%-- <div style="border:1px red solid;background-color:lightgray;">
*SDMS
<a href="${pageContext.request.contextPath}/excel/add.do">엑셀등록</a>
<a href="${pageContext.request.contextPath}/excel/delete.do">디비초기화</a>
<a href="${pageContext.request.contextPath}/member/list.do">회원</a>
<a href="${pageContext.request.contextPath}/project/list.do">점소등록</a>
<a href="${pageContext.request.contextPath}/task/list.do">차량등록</a>
<a href="${pageContext.request.contextPath}/task/list.do">배송구역등록</a>
<c:choose>
	<c:when test="${!empty loginUser}">
	<a href="#">${loginUser.name}</a>
	<a href="${pageContext.request.contextPath}/auth/logout.do">[로그아웃]</a>
	</c:when>
	
  <c:otherwise>
  <a href="${pageContext.request.contextPath}/auth/login.do">[로그인]</a>
  </c:otherwise>
</c:choose>
</div> --%>