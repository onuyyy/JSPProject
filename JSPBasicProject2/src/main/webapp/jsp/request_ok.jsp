<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	// request.jsp에서 전송된 데이터를 받는다
	// 1. 한글(1byte) => 변환한다(2byte)
	request.setCharacterEncoding("UTF-8");
	
	// 1) 이름 (단일값) <input type=text name="name">
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String tel=request.getParameter("tel");
	String tel2=request.getParameter("tel2");
	String content=request.getParameter("content");
	// 입력창의 대부분은 getParameter로 받는다
	// checkbox만 getParameterValues로 받는다 (여러 개이기 때문에 배열)
	String[] hobby=request.getParameterValues("hobby");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>전송된 값</h1>
이름 : <%=name %><br>
성별 : <%=sex %><br>
전화 : <%=tel+")"+tel2 %><br>
소개 : <%=content %><br>
취미 : 
	
	
		<%
			// 값이 있는지 없는지 확인해줘야 한다   => try ~ catch 절 이용해도 된다                       
			if(hobby!=null) {
				for(String h:hobby) {
					%>
					<li><%=h %></li>
					<%
				}
			} else {
				%>
				<font color="red">취미가 없습니다</font>
				<%
			}
	
	 			%>



</body>
</html>


