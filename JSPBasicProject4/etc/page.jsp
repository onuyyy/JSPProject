<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!

	String msg="Hello JSP!!";	// 멤버변수
	public String display() {	// 메소드
		return msg;	
	}

	/*
		public void _jspService() {
			String msg="";
			-----------
			this.msg
		}
	*/
	
	
	// 같은 클래스 내에선 this. 생략 ==> 원래는 this.다 붙여줘야 함
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String msg="Hello JSP (지역변수)";
%>

<%=this.msg%>
<%-- this.찍으면 hello jsp!! 출력 / 안 찍으면 hello jsp (지역변수) 출력 --%>
</body>
</html>