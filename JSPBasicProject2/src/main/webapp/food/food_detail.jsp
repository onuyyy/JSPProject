                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <%@page import="java.util.StringTokenizer"%>
<%@page import="com.sist.dao.FoodDAO"%>
<%@page import="com.sist.dao.FoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String fno=request.getParameter("fno");
	
	// DB 연동
	FoodDAO dao = FoodDAO.newInstance();
	
	FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
	
	String addr=vo.getAddress();
	String addr1=addr.substring(0,addr.lastIndexOf("지번"));
	String addr2=addr.substring(addr.lastIndexOf("지")+3);
	
	
	
%>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
  
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
				<%
					StringTokenizer st = new StringTokenizer(vo.getPoster(),"^");
					while(st.hasMoreTokens()) {
				%>	
					<td><img src="<%=st.nextToken()%>" style="width:100%"></td>
				<%	
					}
				%>
				</tr>
			</table>
		</div>
		<div style="height:10px"></div>
		<div class="row">
			<div class="col-sm-7">
				<table class="table">
					<tr>
						<td colspan="2">
							<h3><%=vo.getName() %>&nbsp;<span style="color:orange"><%=vo.getScore() %></span></h3>
						</td>
					</tr>
					<tr>
						<th width=15%>주소</th>
						<td width=85%><%=addr1%><br>
							<sub>지번:<%=addr2 %></sub>
						</td>
					</tr>
					<tr>
						<th width=15%>전화</th>
						<td width=85%><%=vo.getTel() %></td>
					</tr>
					<tr>
						<th width=15%>음식종류</th>
						<td width=85%><%=vo.getType() %></td>
					</tr>
					<tr>
						<th width=15%>가격대</th>
						<td width=85%><%=vo.getPrice() %><td>
					</tr>
					<tr>
						<th width=15%>영업시간</th>
						<td width=85%><%=vo.getTime() %></td>
					</tr>
					<tr>
						<th width=15%>주차</th>
						<td width=85%><%=vo.getParking() %></td>
					</tr>
					<%
						
					%>
					<tr>
						<th width=15%>메뉴</th>
						<td width=85%>
							<ul>
							<%
								st=new StringTokenizer(vo.getMenu(),"원");
								while(st.hasMoreTokens()) {
							%>
									<li><%=st.nextToken() %>원</li>
							<%		
								}
							%>
							</ul>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<a href="food_list.jsp" class="btn btn-xs btn-warning">목록</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-sm-5">
			
			</div>
		</div>
	</div>
</body>
</html>