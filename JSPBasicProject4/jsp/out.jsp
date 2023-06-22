<%--

	JSP
	---
	1) 지시자 : page / include / taglib
			
		page : JSP파일에 대한 정보
			1. contentType : 브라우저에 실행하는 타입 => 파싱하는 방법을 알려준다
							 -----------------
							 html => text/html
							 xml => text/xml
							 json => text/plain
			2. import : 여러 번 사용이 가능, 라이브러리 읽기
			3. errorPage : 에러시에 에러 출력 화면으로 이동
			4. buffer : html 태그를 저장하는 공간
						소스 미리보기
						=> 사용자마다 한 개만 생성 (브라우저가 연결해서 읽어가는 위치)
	
	2) 스크립트 : 자바/html 분리해서 코딩
	   ----- 자바 언어 코딩 위치
	   <%! %> : 선언문 (멤버변수, 메소드 선언) => 클래스 제작이 클래스 블록 안에 들어감 (사용 빈도 x)
	   <% %>  : 일반 메소드 영역 => 지역변수, 제어문, 메소드 호출, ...
	   			_jspSErvice() {
	   				---------------
	   				JSP에 첨부하는 소스
	   				---------------	
	   			}
	   <%= %> : 화면 출력 (변수, 문자열 ...) => out.println(<%= %>)
	   ------ out
	 
	3) 내장 객체 : 미리 객체를 생성해서 필요한 위치에서 사용이 가능
		request : HttpServletRequest
					사용자 정보 (요청 정보, 추가 정보, 브라우저 정보)
					= 요청 정보
						getParameter() : 사용자가 전송한 데이터를 한 개씩만 받을 수 있다
										=> 문자열 String으로만 받는다
						getParameterValues() : 여러 개를 동시에 받는다
										=> String[]으로 되어있다 ex) 체크박스 select...
						setCharacterEncoding() : 디코딩
										=> POST에서만 사용
										=> GET은 자동화 처리
										  --------------- server.xml (한글 처리, 포트)
					= 추가 정보 (MVC, MV)
						오라클에서 받은 값을 추가 => JSP
						setAttribute() : 기존에 있는 request 값에 출력에 필요한 데이터를 추가해서 전송
						getAttribute() : 추가해서 보낸 데이터를 받을 경우에 사용
					= 브라우저 정보
						getRemoteAddr() : 접속자의 IP
						getRequestURL(), getRequestURI(), getContextPath()	
		response : HttpServletResponse
					= 응답 정보, 화면 이동 정보
						setContextTpye() => HTML, XML
							=> page 지시
						addCookie() : 쿠키 전송 => 한 번만 수행할 수 있다
					= 화면 이동 정보
						필요시에 서버에서 화면을 요청 화면이 아닌 다른 화면으로 이동
							login = main
							insert = list
							delete = list
							update = detail
						=> sendRedirect() : GET 방식, request를 초기화한 다음 이동
					= Header 정보 : 실제 데이터 전송 전에 처리
						setHeader() => 한글변환 / 다운로드시 파일명, 크기 => 다운로드창을 보여준다	
		out : JspWriter (출력 버퍼 관리)
				= 출력 (메모리)
					println() : <%= %>
				= 메모리 확인
					getBufferSize() : 총 버퍼 크기
					getRemaining() : 사용중인 버퍼 크기
				= 버퍼 지우기
					clear()
		session
		application
		pageContext
		------------- 필수
		config => web.xml 처리
		exception => try ~ catch 이용
		page => this
							
		

 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- out 출력 (복잡한 html 구조) --%>
	
<%

response.setContentType("text/html;charset=UTF-8");

		  EmpDAO dao=new EmpDAO();
		  List<EmpVO> list=dao.empListData();
		  out.print("<!DOCTYPE html>");
	      out.print("<html>");
	      out.print("<head>");
	      out.print("<meta charset=\"UTF-8\">");
	      out.print("<title>Insert title here</title>");
	      out.print("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">");
	      out.print("<style>");
	      out.print(".container{margin-top:50px}");
	      out.print(".row{margin:0px auto;width:800px}");
	      out.print("h1{text-align:center}");	
	      out.print("</style>");
	      out.print("</head>");
	      out.print("<body>");
	      out.print("<div class=container>");
	      out.print("<h1>사원 목록</h1>");
	      out.print("<div class=row>");
	      out.print("<table class=\"table table-striped\">");
	      out.print("<tr class=success>");
	      out.print("<th class=text-center>사번</th>");
	      out.print("<th class=text-center>이름</th>");
	      out.print("<th class=text-center>직위</th>");
	      out.print("<th class=text-center>입사일</th>");
	      out.print("<th class=text-center>급여</th>");
	      out.print("<th class=text-center>성과급</th>");
	      out.print("<th class=text-center>부서명</th>");
	      out.print("<th class=text-center>근무지</th>");
	      out.print("<th class=text-center>호봉</th>");
	      out.print("</tr>");
	      for(EmpVO vo:list)
	      {
	    	  out.print("<tr>");
		      out.print("<td class=text-center>"+vo.getEmpno()+"</td>");
		      out.print("<td class=text-center><a href=\"MainServlet?mode=2&empno="+vo.getEmpno()+"\">"+vo.getEname()+"</a></td>");
		      out.print("<td class=text-center>"+vo.getJob()+"</td>");
		      out.print("<td class=text-center>"+vo.getDbday()+"</td>");
		      out.print("<td class=text-center>"+vo.getDbsal()+"</td>");
		      out.print("<td class=text-center>"+vo.getComm()+"</td>");
		      out.print("<td class=text-center>"+vo.getDvo().getDname()+"</td>");
		      out.print("<td class=text-center>"+vo.getDvo().getLoc()+"</td>");
		      out.print("<td class=text-center>"+vo.getSvo().getGrade()+"</td>");
		      out.print("</tr>");
	      }
	      out.print("</table>");
	      out.print("</div>");
	      out.print("</div>");
	      out.print("</body>");
	      out.print("</html>");
	      %>

</body>
</html>




