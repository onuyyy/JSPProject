<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 

	메소드 사용 fn



 -->
<%
	String msg="홍길동쓰";
%>
<c:set var="msg" value="홍길동입니다"/>
<c:set var="msg2" value="<%=msg %>"/>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JAVA</h1>
<%=msg.length() %> <br>
<%=msg.substring(0,3) %>
<h1>JSTL</h1>
${msg } <br>
${msg2 } <br>

${fn:length(msg) }<br>
${fn:substring(msg,0,3) } <br>
${fn:replace(msg, '홍','박') }

</body>
</html>