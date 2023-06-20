<%--

	JSP : Java Server Page(파일 => 페이지)
	1. 구성요소
		Client : 브라우저
		Server : WebServer / WAS
							(Web Application Server) => Tomcat, Regin ,....
				client =>	========WAS========
							WebServer => WebContainer
							---------	 ------------JSP / Servlet을 HTML로 변환
							1. client의 요청을 받는다
								=> client는 항상 파일명을 요청해야 한다
							2. Web Server
								자체 처리(HTML,CSS,JSON)
								Web Container로 전송
								JSP / Container
							
	2. 웹 동작
				요청(request)
		client ---------------		WAS------------
									1. request			 / response 객체 생성
			   ---------------		   -------	 		   ---------
			    응답(response)			  ㅣ					   ㅣ
									사용자가 보낸 모든 정보		브라우저 정보(IP/PORT)
									? 뒤에 있는 데이터
									사용자의 브라우저 정보
									(사용자 IP / 사용자 PORT)
									2. Servlet 분석 => get : doGet
												   => post : doPost
									   -----------------------------
									   	=> Servlet 찾아서 HTML 만들어서 브라우저로 전송
									   	
				= JSP 동작 
				개발자(소스코딩) => 찾은 JSP => 서블릿 변환 => 컴파일
					=> 실헹 : 메모리에 HTML 메모리에 있는 브라우저가 읽어가게 만든다
	3. Servlet VS JSP
		Servlet
			= java 파일로 되어있기 때문에 수정시마다 컴파일 해야 한다
			= HTML이 자바 안에서 코딩해야 하기 때문에 => 문자열 때문에 불편하다 out.write...
			= CSS를 구사하기 어렵다 => 개발자가 HTML CSS JS JAVA ORACLE 전부 혼자 담당
		JSP	(Servlet의 단점을 보완)
			= HTML을 쉽게 다루게 만든다
			= HTML과 Java기 분리되어 있다	 => 분업 가능
			= 컴파일 없이 바로 확인 가능
		=> 둘 다 웹 서비스 기능을 가지고 있다 (사용자 요청 => html 변환 후 화면 보여줌)
	4. JSP 주로 사용하는 위치
			= VIEW만 사용(Java를 별도로 만들기 때문에) : 출력만 담당
			= JSP 점차적으로 사라지고 있다
				Spring : 서버 역할
				화면 출력 : HTML에서 직접 작엄
						 --------------- HTML에 제어문 기능(타임리프)
						 --------------- Vue,React
			 
	5. JSP 문법
		= 지시자
		= 스크립트릿
		= 내장객체
		= 액션 태그
		= 빈즈
		= JSTL
		= EL
		= MVC
	=> JSP : 브라우저 연결
	
							 
		19page
		요청 : URL 이ㅛㅇ해서 서버에 접근 => 요청
		응답 : Servlet/JSAP레서 받아서 처리 후 HTML로 변환
		
		정적페이지 : HTML (파일을 따로 제작)
		동적페이지 : JSP / Servelt (한 개의 파일 안에서 데이터만 변경)
		------- 정적 쿼리 / 동적 쿼리
		
		
		24page - JSP
		- 동적 콘텐츠 => 한 개의 파일 안에서 데이터를 변경할 수 있다
		- 자바 언어로 사용된다
		- 자바 / HTML이 분리되어 있다
		- JSP는 항상 Servlet으로 변경 후에 실행해야 한다
				   ---------------------------- Tomcat이 변경해줌
		- JSP는 화면에 출력할 내용의 메소드 안에 들어가는 내용을 코딩한다
		  --- 클래스가 아니고 메소드 영역이다
		- _jspService() {
			jsp 영역
		  }
	
		
		
		26page
		JSP
		=> 동적 페이지를 생성하기 위한 자바의 사용 기술 (자바)
			컴포넌트(클래스) 기반에서 개발 가능
		=> Servlet (28page)
			JSP와 연결해서 처리
			JSP : 정적 페이지 => 코딩하기 편리 (자바/HTML) 구분
						   => 소스 코딩이 노출 (라이브러리 제작은 어렵다)
		
		1. 사용자 요청
			브라우저 주소창만 이용이 가능
			http://localhost:8080/프로젝트명/폴더/XXX.jsp
				=> --------------- 서버에 접근
		2. 맨 마지막 파일
			= .html(htm), .css, .json => 웹 서버에서 직접 처리
			= .jsp
			  ----- 일반 브라우저에서는 일반 텍스트 파일
			  ----- 자바 변환	(Web Container = Tomcat)
			  	= a.jsp => a_jsp.java 변환
			  			=> 컴파일
			  				a_jsp.class => 서블릿
			  	= JVM이 서블릿 실행
			  		   ---------
			  		   	메모리 상에  <%= %>, out.println(), HTML
			  		   	=> 메모리에 저장 => 브라우저에서 읽기 => 실행
		3. servlet
			  ㅣ
			 init() : 생성자 대신 멤버면수 등의 초기화 담당 => web.xml
			  ㅣ
			 service() ===> 브라우저에 요청한 내용에 대한 처리 => 응답할 HTML 작성
			 	= doGet()
			 	= doPost()	 
			  ㅣ
			 destroy() ===> 파일 이동 / 새로고침 => 자동으로 메모리 해제 (GC 자동 호출)
		4. JSP
			ㅣ
		  _jspinit() : web.xml => 저장된 내용 읽어서 저장
		  			   error코드, servlet 저장, 환경 설정 위치, 한글 변환
		  	ㅣ
		  _jspservice() : 사용자 요청 처리 결과
		    ㅣ+
		  _jspdestroy() : 페이지 이동 / 새로 고침 => 자동으로 메모리 해제 (GC 자동 호출)
		  				=> request에 담긴 모든 정보를 잃어 버린다
		  				=> request 유지 : forward, include
		  				=> request 초기 : sendRedirect()
	

 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% out.println("Hello JSP"); %>
<%="Hello JSP" %>	<!-- 권장사항 %= -->


</body>
</html>