<%--

	import => 라이브러리 
	
	import="java.util.*, java.io.*";
	
	<%! %> => 출력용 코딩 x

 --%>
 
 
<%@page import="com.sist.form.MainClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*" buffer="16kb"%>
 
    
 <%
 
 	Date date=new Date();
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 	String today=sdf.format(date);
 	MainClass m =new MainClass();
 	String msg = m.display();
 	
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=msg %></h1>
	<h1><%=out.getBuffer.Size() %></h1>
	<h1><%=out.getRemaining() %></h1>


</body>
</html>