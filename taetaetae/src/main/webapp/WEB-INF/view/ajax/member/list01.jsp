<%@ page language="java" 
    contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
[
<c:set var="count" value="0"/>
<c:forEach var="m" items="${members}">
<c:if test="${count != 0}">,</c:if>
{
"no" : ${m.no},
"name" : "${m.name}",
"email" : "${m.email}",
"tel" : "${m.tel}"
}
<c:set var="count" value="${count + 1}"/>
</c:forEach>  
]