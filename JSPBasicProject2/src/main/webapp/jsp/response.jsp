<%--

	173page
	response (응답), request (요청)
		=> response : HttpServletResponse
		요청 메소드
		setHeader() : 사전에 전송할 데이터가 있는 경우
		----------- 권한을 부여하게 되면 미리 보내준다, 다운로드 받을 때 파일명과 크기를 미리 보내준다
		sendRedirect() : 서버에서 화면 이동
		-------------- login => main 이동 (서버에서 해줌)
					   글쓰기 => 목록 이동
					   ==> 필요한 위치로 화면을 이동 
		addCookie() : 쿠키 전송 (클라이언트 브라우저로 전송)
					  => 쿠키와 동시에 HTML을 전송할 수 없다

	 ** response / request는 각 JSP마다 따로 가지고 있다
 	 ** request는 화면 변경이 되면 => 초기화 된다 (값이 없어짐)
 	 							--------- 보완 session 등장 : 다른 저장소에 저장해놓고 여기저기서 같은 값을 쓸 수 있도록 한다
 	 										request : 지역변수
 	 										session : static 변수 => 서버 안에 저장해서 필요할 때마다 가져다 쓸 수 있게
 	 		
		
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

<a href="response_1.jsp?id=admin&pwd=1234">전송</a>

</body>
</html>