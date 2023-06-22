<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>pagecontext(pagecontext)</h1>

<table class="table">
	<tr>
		<th width=20% class="text-center">클래스명</th>
		<td width=80%>JspWriter</td>
	</tr>
	<tr>
		<th width=20% class="text-center">주요기능</th>
		<td width=80%>PageContext
			<ul>
				<li>페이지 연결</li>
				<li>내부 객체 정보 얻기</li>
				<li>출력 버퍼에 대한 정보</li>			
			</ul>
		</td>
	</tr>
	<tr>
		<th width=20% class="text-center">주요메소드</th>
		<td width=80%>
			<ul>
				<li>
					페이지 연결
					<ul>
						<li>***include() : 여러 개의 JSP를 조립&lt;jspLclude&gt; => 사이트 제작</li>
						<li>***forward() :  HTML만 덮어쓰는 역할&lt;jspforward&gt; = > MVC 주로 사용</li>
					</ul>
				</li>
				<li>
					내부 객체 얻기
					<ul>
						<li>getRequest() : request 객체 얻기</li>		
						<li>getResponse() : response 객체 얻기</li>	
						<li>getSession() : session 객체 얻기</li>	
					</ul>
				</li>
			</ul>
		</td>
	</tr>
</table>

</body>
</html>