<%--

	JSP => HTML+Java
		  ----------- 구분해서 사용해야 한다 (스크립트)
		  
		=> 스크립트 => 자바를 코딩하는 영역
		   ------
			선언문 : <%! %> => 메소드 선언, 멤버  변수 선언
			표현식 : <%= %> => out.println() 자바 변수 출력
			스크립트릿 : <% %> => 일반 자바 (메소드 영역)
						       메소드 호출, 지역변수 설정, 제어문, ...
		
		a.jsp	       
		<%! 
			int a=10;
			public void display() {}
		%>
		
		<%
			String name="홍길동";
		%>
		
		<div>
			<%=name%>
		</div>
		
		==> 자바 변경
		public class a_jsp extends HttpServlet {
			public void _jspInit() {}
			public void _jspDestroy() {}
			
			public void _jspServic() {
				String name="홍길동";
				out.write("<div>");
				out.println(name);<%=name%>	
				out.write("</div>");
			}
		}

 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <style type="text/css">
  
  .container {
  	margin-top:50px;
  }
  
  .row {
  	width:100%;
  	margin:0px auto;
  }
  
  h1 {
  	text-align: center;
  }
  
  </style>
  
  <!-- 
  
  	HTML 안에서 자바는 일반 텍스트로 처리 된다 <% %>를 잘 처리해야 한다 *****
  
   -->
  
</head>
<body>

	<div class="container">
		<h1>구구단</h1>
		<div class="row">
			<table class="table">
				<tr>
					<%	// 자바 코딩
						for(int i=2; i<=9; i++) {
							%>
								<!-- html 코딩 -->
								<th class="text-center"><%=i+"단" %></th>
							<%
						}
					%>
				</tr>
				<%
					for(int i=1; i<=9; i++) {
						%>
							<tr>
						<%
						
						for(int j=2; j<=9; j++) {
						%>
							<td class="text-center">
						<%= 	j+"*"+i+"="+(j*i) %>
							</td>
						<%
						}
						%>
							</tr>
						<%
						}
				%>
			</table>
		</div>
	</div>

</body>
</html>


