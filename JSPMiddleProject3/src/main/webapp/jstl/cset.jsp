<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String name="ㅎㄱㄷ";
	// request에 저장 => 데이터 추가
	request.setAttribute("n", name);
	
%>    
    
<c:set var="nm" value="ㅅㅊㅇ">
<%-- el 출력 용도로 사용 => 변수 설정 --%>

</c:set>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>자바 출력</h1>
이름1 : <%=name %> <br>
이름2 : <%=request.getAttribute("n") %>
<h1>EL 출력</h1>
이름1 : ${n }	<br>
이름2 : ${nm }
<%--
getAttribute = ${}
 --%>
<br>
이름 4 : <c:out value="${nm }"/> <br>
이름 5 : <c:out value="${n }"/>

<%--
	JQuery와 충돌 방지
	출력 => $
	<c:out value="" > 으로 방지
	
--%>

</body>
</html>