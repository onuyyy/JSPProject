<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	메소드 방식 : <%=request.getMethod() %><br>
	<!-- post를 지정하지 않으면 전부 get : default가 get방식이다 
		 post방식 : 자바스크립트, <form> 
		 	=> 나머지 get
	-->
	서버 주소 : <%=request.getServerName() %><br>
	서버 포트 : <%=request.getServerPort() %><br>
	클라이언트 IP : <%=request.getRemoteAddr() %><br>
	<!-- 조회수 증가시 같은 ip의 증가를 막기 위하여 ip 중요
		 WebSocket : 실시간 상담할 때 ip를 알고 있어야 클라이언트에게 연결 가능
	-->
	URL : <%=request.getRequestURL() %><br>
	URI : <%=request.getRequestURI() %><br>
	ContextPath : <%=request.getContextPath() %><br>
	Browser : <%=request.getHeader("User-Agent") %><br>
	
	
</body>
</html>