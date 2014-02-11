<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
int count = 0;

synchronized private int getFileCount() {
	if (count > 100000)
		count = 0;
	return ++count;
}
%>
<%
//1. 클라이언트가 보낸 데이터를 파트 별로 잘라서 객체에 담아주는 공장 준비
FileItemFactory factory = new DiskFileItemFactory();

//2. 서블릿 요청 정보를 공장에게 전달해 주는 객체 준비
ServletFileUpload upload = new ServletFileUpload(factory);

//3. 파일 업로드를 처리하라고 명령을 내림
List<FileItem> items = upload.parseRequest(request);
for (FileItem fileItem : items) {
	if (fileItem.isFormField()) { // 일반 입력 값인가?
		request.setAttribute(fileItem.getFieldName(), 
			  fileItem.getString("UTF-8"));
	} else { // 파일인가?
	  String originFilename = fileItem.getName();
	  String ext = originFilename.substring(
	  		 originFilename.lastIndexOf("."));
	  String newFilename = System.currentTimeMillis() 
	  		+ "_" + this.getFileCount() + ext;
	  fileItem.write(new File(application.getRealPath(
        "/files/" + newFilename)));
	  fileItem.delete();
	  request.setAttribute(fileItem.getFieldName(), newFilename);
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업로드 결과</title>
</head>
<body>
이름: ${requestScope.name}<br>
나이: ${requestScope.age}<br>
파일1: ${requestScope.file1}<br>
<img src="../files/${file1}"><br>
파일2: ${requestScope.file2}<br>
<img src="../files/${file2}"><br>
</body>
</html>










