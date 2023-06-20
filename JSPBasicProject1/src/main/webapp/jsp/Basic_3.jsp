<%--

			선언문 : <%! %> => 메소드 선언, 멤버  변수 선언
			표현식 : <%= %> => out.println() 자바 변수 출력
			스크립트릿 : <% %> => 일반 자바 (메소드 영역)
						       메소드 호출, 지역변수 설정, 제어문, ...


	<%! %> : 선언문 => 메소드 선언 => 클래스 변경
			 public class className {
			 	선언문
			 }
			 
	<%= %>
	<% %>		 
	------ public void _jspService() {
				<%= %> : out.println()
				<% %>
			}	
		
			 
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%!
 
 	public int add(int a, int b) {
	 return a+b;
 }
 
 %>   
 
 <%
 
 	int a=10;
 	int b=20;
 	int c=add(a,b);
 
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>결과 : <%=c %></center>
</body>
</html>


