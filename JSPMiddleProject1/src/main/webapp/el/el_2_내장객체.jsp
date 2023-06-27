<%--

	EL : 지원하는 내장객체 581 page
	
	1. requestScope		=> request.setAttrubute()
	2. sessionScope		=> session.setAttribute()
	3. param			=> request.getParameter()
	4. paramValues		=> request.getParameterValues()

 --%>

<%
	String name="홍길동";
	request.setAttribute("name", "홍길동");
	session.setAttribute("name", "심청이");
	// 우선순위는 request다
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름:${name }, ${requestScope.name }
		<!-- 출력 안 된다 => ${} 는 일반 변수를 출력하는 곳이 아님 -->
	<%=request.getAttribute("name") %>
</body>
</html>