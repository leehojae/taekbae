<%@page import="com.google.gson.Gson"%>
<%@ page language="java" 
    contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<%=new Gson().toJson(request.getAttribute("excels"))%>