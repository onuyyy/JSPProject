<%@page import="com.sist.temp.SawonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	// 사용자가 보내준 값을 인코딩 UTF-8 설정 / 인코딩 : 문자나 숫자 값을 컴퓨터가 이해할 수 있는 값으로 설정
	// 디코딩은 인코딩된 데이터를 원래 데이터로 변경시킬 때 사용
	request.setCharacterEncoding("UTF-8");


	// 각 name의 속성 값을 String 형태로 받아온다
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String dept=request.getParameter("dept");
	String job=request.getParameter("job");
	String pay=request.getParameter("pay");
	
	// vo 값 채우기
	SawonBean bean=new SawonBean();
	bean.setName(name);
	bean.setDept(dept);
	bean.setJob(job);
	bean.setSex(sex);
	bean.setPay(Integer.parseInt(pay));
	
	
%>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름:<%=bean.getName() %><br>
	성별:<%=bean.getSex() %><br>
	부서:<%=bean.getDept() %><br>
	직위:<%=bean.getJob() %><br>
	연봉:<%=bean.getPay() %><br>
</body>
</html>