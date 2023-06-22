<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String fn=request.getParameter("fn");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="../image/<%=fn %>" style="width:100%">;
<%-- 이미지 폴더가 밖에 있기 때문에 ../ 써야 함 --%>
</body>
</html>