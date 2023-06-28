<%--

	EL : 지원하는 내장객체 581 page
	
	1. requestScope		=> request.setAttribute("key",값) : 기존의 request 추가 데이터 설장
						=> request.getAttribute("key") : ${requestScope.key} => ${key}
						
	2. sessionScope		=> session.setAttribute()
						
	
	3. param			=> request.getParameter() : ${param.key}
	4. paramValues		=> request.getParameterValues() : ${paramValues.key}

	내장객체 (일반 JSP ==> 자바/HTML 분리)
			-------		------------ => 모든 처리는 자바 : 결과 값만 출력
			자바/HTML 혼합
			
	String name=""
	${name} => 출력 안 됨		
			
	request.setAttribute("name","")
			ㅣ
			${name}		
			
	session.setAttribute("name","")
			ㅣ
			${name}		
			
			
	
			

 --%>

<%
	String name="홍길동";
	request.setAttribute("name", "홍길동");
	session.setAttribute("name", "심청이");
	// 우선순위는 request다
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


