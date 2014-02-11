<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<div id="feedForm" class="portlet">
<form action="feed/add.do" method="post"
  enctype="multipart/form-data">
<textarea id="feedContents" name="contents"></textarea>
<input id="feedAttFile" type="file" name="attFile">
<input id="feedProjectNo" type="hidden" name="projectNo" value="1">
<input id="feedSubmit" type="submit" value="등록">
</form>
</div>    
    
    
    