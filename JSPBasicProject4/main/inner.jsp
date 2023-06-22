<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내장 객체 (7장)</h1>
<table class="table">
	<tr>
		<td colspan=2>
			내장객체: 미리 객체를 생성해서 필요시마다 사용 가능하게 만든다 <br>
					=> 모든 서버에서 request, response, session.. 지원 <br>
					=> NodeJs, JSP, PHP, ASP, DJango
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<pre>
	public void _jspService<mark>(HttpServletRequest request,
	HttpServletResponse response)</mark>
	{
	 (( JSP 코딩 영역))
	 PageContext pageContext;
	 HttpSession session = null;
	 ServletContext application;
	 ServletConfig config;
	 JspWriter out = null;
	 Object page = this;		    
			    
  	}
  			</pre>		
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<ul>
				<li>JSP 파일에서 입출력 관련 객체</li>
				<li>JSP 파일에서 외부 환경과 관련 객체</li>
				<li>JSP 파일에서 서블릿 관련 객체 config</li>			
				<li>JSP 파일에서 예외 관련 객체</li>			
			</ul>
		</td>
	</tr>
	<tr>
		<td width=25%>request</td>
		<td width=75%>사용자와 관련 (요청정보, 브라우저 정보, 추가정보)</td>
	</tr>
	<tr>
		<td width=25%>response</td>
		<td width=75%>서버에서 응답 정보, 화면 이동 정보, header 정보</td>
	</tr>
	<tr>
		<td width=25%>out</td>
		<td width=75%>출력 버퍼와 관련, 화면 출력 정보
		<br><sub>출력 버퍼: 실행된 HTML을 저장하는 공간 (브라우저에서 읽어가는 공간)</sub>
		</td>
	</tr>	
	<tr>
		<td width=25%>application</td>
		<td width=75%>서버 정보, 자원 정보, 로그 정보</td>
	</tr>
	<tr>
		<td width=25%>session</td>
		<td width=75%>서버세 사용자의 일부 정보를 저장 : 전역변수처럼 사용한다</td>
	</tr>
	<tr>
		<td width=25%>pageContext</td>
		<td width=75%>페이지의 흐름(request) : JSP 여러 개 조립</td>
	</tr>
	<tr>
		<td width=25%>config, exception, page (등장 빈도 낮음)</td>
		<td width=75%>외부 환경 설정, 예외 관리</td>
	</tr>
</table>
</body>
</html>