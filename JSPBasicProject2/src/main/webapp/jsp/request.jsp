<%--

	JSP
		1. 동작 순서
			1) client 요청 (주소창을 이용해서 서버에 연결)
				http://localhost:8080/JSPBasicProject2/jsp/request.jsp
				----   --------  ---- ----------------
			 protocol  serverIP  port	ContextPath
				웹에 연결
				--------------------  --------------------------------
					   서버 관련					클라이언트 요청 관련(URI)
					     ㅣ							  ㅣ
					   	 ------------------------------
					   					URL			
			2) DNS를 거쳐서 => localhost(도메인) => ip 변경
			3) ip와 port를 이용해서 서버에 접속
				new Socket(ip,port) => TCP
			4) web server
				http
				----
					= HTML, XML, CSS, JSON => web server 자체에서 처리 후에 브라우저로 전송
					= JSP / Servlet은 처리하지 못 한다
					 ----------------------------
					 		ㅣ
					 	Web Container (WAS) => JAVA로 변경 => 컴파일 => 실행
					 												--- 실행 결과를 메모리에 모아둔다
			5) 메모리에 출력한 내용을 브라우저로 응답
			
			JSP (Java Server Page) : 서버에서 실행되는 자파 파일
				=> 실행 과정
					_jspInit()	: web.xml 초기화
					_jspService()	: 사용자 요청을 처리하고 결과 값을 HTML로 전송
					-------------- 공백
					{
						이 영역에 소스 코딩할 수 있도록 만든다 => JSP (메소드 안에)
					}
					_jspDestroy()	: 새로고침, 화면 이동할 때 메모리에서 해제 시킴  
					
					public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
					{
						    final javax.servlet.jsp.PageContext pageContext;
						    javax.servlet.http.HttpSession session = null;
						    final javax.servlet.ServletContext application;
						    final javax.servlet.ServletConfig config;
						    javax.servlet.jsp.JspWriter out = null;
						    final java.lang.Object page = this;
						    javax.servlet.jsp.JspWriter _jspx_out = null;
						    javax.servlet.jsp.PageContext _jspx_page_context = null;
						    
						    소스 코딩 영역
						    ==> 
					}
					   					
			1) page 지시자
				형식 = <%@ page 속성="" 속성="" %>
				JSP 파일에 대한 정보를 가지고 있음
				속성 : contentType="" => 변환코드
									 => 브라우저에 어떤 파일인지 알려준다
									 	------ HTML / XML / JSON 만 파싱 가능 , 이 외에는 일반 텍스트
									 		  ------ -----  -----
									 		  		   		contentType(text/plain)
									 		  		  text/xml
											  text/html
					 import : 라이브러리 읽기
					 import="java.util.*;java.io.*;"
					 errorPage : error시에 이동하는 페이지 지정
					 buffer="8kb" => 16kb 32kb ...
					 							  
		3. 스크립트 사용법
			자바가 코딩되는 영역
			<%! %> : 선언부 (메소드, 멤버면수) => 사용빈도 x
			<%= %> : 화면 출력 out.println(여기에 들어가는 코딩)
			<% %> : 자바 코딩 => 제어문, 메소드 호출, 지역변수
			
				=> 표현식 ${}
				=> 스크립트릿 JSTL
				=> JSP 안에서는 태그형으로 제작
			
		4. 내장 객체
			9가지 지원
			= request : HttpSevlerREquest
				request는 관리자 => 톱캣	
				1) 서버정보 / 클라이언트 브라우저 정보
					getServerInfo()
					getPort()
					getMethod()
					getProtocol()
					getRequestURL()
					getRequestURI()
					getContextPath()
				2) 사용자 요청 정보
					데이터 전송시 => 데이터가 request에 묶여서 들어온다
						= 단일 데이터
							getParameter()
						= 다중 데이터
							String []getParemeterValues() => checkbox / select => multiline
						= 한글 변환 (디코딩)
							setCharacterEncoding => UTF-8	
						= 키를 읽는다
							getParameterNames()
							받는파일명?no=1&name=aaa
							------ 얘한테 보낸다	
							a.jsp?no=1&name=aaa&hobby=a&hobby=b&hobby=c		==> 얜 배열 형식
				3) 추가 정보
					setAttribute() : request 데이터 추가 전송
					getArrtibute() : 전송된 데이터 읽기
					
					response = HttpServletResponse
					= Header 정보
						다운로드시 파일명 크기 미리 띄어줌
						setHeader()
					= 응답 정보
						HTML 전송 => text/html
						Cookie 전송 => addCookie
					= 화면 이동
						  	sendRedirect()	
			= response : HttpSevletResponse
			= session : HttpSession
			= out : JspWriter
			= application : ServletContext
			= pageContext : PageContext
			= page : Object	(this)
			= exception : Exception
			= config : ServletConfig    
			
			
			페이지 입출력
				request response out
			외부 환경 정보
				config
			서블릿 관련
				application pageContent sessoion
			
			                    
			
		5. 액션 태그
		6. include
		7. cookie
		8. JSTL
		9. EL
		10. MVC







 --%>
 
 <%
 	pageContext.include("");
 %>
 
 
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
  
  
  
</head>
<body>
<!-- 170page getParameter, getParameterValues -->
<div class="container">
	<h1>개인 정보</h1>
	<div class="row">
		<form method=post action="request_ok.jsp"><!-- action한테 값을 보낸다 => name이라고 준 것들이 넘어간다 -->
		<table class="table">
			<tr>
				<th class="text-center" width=20%>이름</th>
				<td width=80%>
					<input type=text name=name size=15 class="input-sm">
				</td>
			</tr>
			<tr>
				<th class="text-center" width=20%>성별</th>
				<td width=80%>
					<!--  radio 버튼은 그룹을 만들어야 함 => name으로 그룹 묶음 -->
					<input type=radio name=sex value="남자" checked>남자
					<input type=radio name=sex value="여자">여자
				</td>	
			</tr>
			<tr>
				<th class="text-center" width=20%>전화번호</th>
				<td width=80%>
				
					<!-- 
						getParameter("tel")
									 ------ name 속성의 값을 써줘야 한다 (자바랑 연동시 필수 **)		 
					 -->
					 
					<select name="tel" class="input-sm">
						<option>010</option>
					</select>
					<input type=text name="tel2" size=15 class="input-sm">
				</td>
			</tr>
			<tr>
				<th class="text-center" width=20%>소개</th>
				<td width=80%>
					<textarea rows="8" cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th class="text-center" width=20%>취미</th>
				<td width=80%>
					<input type=checkbox name="hobby" value="운동">운동
					<input type=checkbox name="hobby" value="등산">등산
					<input type=checkbox name="hobby" value="낚시">낚시	
					<input type=checkbox name="hobby" value="게임">게임
					<input type=checkbox name="hobby" value="공부">공부	
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn btn-sm btn-danger">전송</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>

</body>
</html>




