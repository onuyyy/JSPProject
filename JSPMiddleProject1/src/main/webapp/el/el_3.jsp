<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.SawonModel"></jsp:useBean>    

<%
	// request 안에 값이 들어가 있다
	model.sawonInfo(request);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
사번 : ${vo.sabun } <br>
이름 : ${vo.name } <br>
부서 : ${vo.dept } <br>
직원 : ${vo.job } <br>
연봉 : ${vo.pay } <br>
</body>
</html>