<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
    
<%
	
	/*
		JSP => 데이터를 수집 (자바)
			1. 사용자가 보내준 데이터 받기
			2. 받은 데이터를 이용해서 데이터베이스 연동
			3. 오라클에서 데이터 읽기 => HTML 화면에 출력
			
		순서			   Model   View
			요청 (JSP) => 자바 => JSP
						 ㅣ
						오라클
			
			
	*/
	
	FoodDAO dao = FoodDAO.newInstance();
	List<FoodVO> list = dao.foodListData();
	
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<%
				for(FoodVO vo:list) {
			%>		
					  <div class="col-md-4">
					    <div class="thumbnail">
					      <a href="food_detail.jsp?fno=<%=vo.getFno()%>">	<%-- detail에 fno를 넘긴다 --%>
					        <img src=<%=vo.getPoster() %> style="width:100%">
					        <div class="caption">
					          <p><%=vo.getName() %></p>
					        </div>
					      </a>
					    </div>
					  </div>
			<%		
				}
			%>
		</div>
	</div>

<ul>
	<%
		for(FoodVO vo:list) {
	%>
			<li><%=vo.getName() %></li>
	<%
		}
	%>
</ul>


</body>
</html>