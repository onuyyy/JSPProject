<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*,java.util.*"%>
<%@ page import="java.text.*" %>    
    <%
    
    	// 사용자가 보내준 요청 값을 받는다 => page
    	String strpage=request.getParameter("page");
    	/*
    		list.jsp		==> null (물음표 없으면 null)
    		list.jsp?page=	==> ""	 (""은 공백)
    		list.jsp?page=2 ==> 2
    				page, 검색어 => 보안 필요 없음 doget : url로 보냄
    	*/
    	if(strpage==null) {
    		 strpage="1";	// 처음엔 페이지 선택 못하니까 => default page 설정해둠
    	}
    				
    	int curpage=Integer.parseInt(strpage);
    	DataBoardDAO dao=DataBoardDAO.newInstance();
    	List<DataBoardVO> list=dao.databoardListData(curpage);
    	int count=dao.databoardRowCount();
    	int totalpage=(int)(Math.ceil(count/10.0));	// 총페이지 
    								// 85/10.0 ==> 8.5 => 9  
    			
    	
    	// DAO에서 요청한 page의 값을 읽어온다
    	// << [1] [2] [3] ... >>
    	final int BLOCK=5;	// 1~5페이지지 startpage 1로 유지시키기 위함
    	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
    	// [1] => 1,2,3,4,5
    	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
    	if(endPage>totalpage)
    		endPage=totalpage;
    	
    	
    	// Oracle에서 가지고 온 데이터를 화면에 출력
    	count=(count-((curpage*10)-10));
    	/*
    		count = 85	85-(1*10-10) => 85
    		1page => 85
    		2page => 75
    	*/
    
    	String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    	
    	
    	
    %>
    
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
margin:0px suto;
width:900px;
}
h1 {
text-align:center;
 font-family: 'Noto Sans KR', sans-serif;
}
  </style>
</head>
<body>
	<div class="container">
		<h1>자료실</h1>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<a href="insert.jsp" class="btn btn=sm btn-warning">새글</a>
					</td>
				</tr>
			</table>
			<table class="table table-hover">
				<tr>
					<th class="text-center" width=10%>번호</th>
					<th class="text-center" width=10%>제목</th>
					<th class="text-center" width=10%>이름</th>				
					<th class="text-center" width=10%>작성일</th>				
					<th class="text-center" width=10%>조회수</th>					
				</tr>
				<%
					for(DataBoardVO vo:list) {
				%>		
				<tr>
					<td class="text-center" width=10%><%=count-- %></td>
					<td width=45%>
					<a href="detail.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
						&nbsp;
						<%
							if(today.equals(vo.getDbday())) {
						%>
							<sup style="color:red">new</sup>	
						<%	
							}
						%>
					</td>
					<td class="text-center" width=10%><%=vo.getName() %></td>				
					<td class="text-center" width=10%><%=vo.getRegdate() %></td>				
					<td class="text-center" width=10%><%=vo.getHit() %></td>					
				</tr>
				<%		
					}
				%>
			</table>
		</div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
				<%
					if(startPage>1) {
				%>
				  <li><a href="list.jsp?page=<%=startPage-1%>">&lt;</a></li>
				<%
					}
				 %> 
						<%
							for(int i=startPage;i<=endPage;i++) {
						%>
							<li<%=curpage==i?"class=active":"" %>><a href="list.jsp?page=<%=i%>"><%=i %></a></li>
						<%		
							}
						%>
						<%
							if(endPage<totalpage){
						%>	
							<li><a href="#">&gt;</a></li>	
						<%
						}
						%>

				</ul>
			</div>
		</div>
	</div>
</body>
</html>






