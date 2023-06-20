<%--

	자바 / HTML 분리
	=> <%! !>
	=> <% %>
	=> <%= %>
	---------------- 자바 코딩 영역
	1. 145page
		지시자
		1) page : JSP 파일의 정보
		   -------------------		
		2) taglib
		3) include

	-----------------
	
	지시자
	
	1. info
		정보 => 작성자 / 수정일
	2. contentType
		변환 : 브라우저에 알려준다 (실행 결과)
		text/html; charset=UTF-8 => HTML
		text/xml; charset=UTF-8 => XML
		text/plain;charset=UTF-8 => JSON
	3. import
		자바 라이브러리 읽기
			=> 사용자 정의 읽기
			=> 자동 추가
				java.lang
				javax/servlet
			<%@ page import="java.io.*;"%>	
	4. buffer : HTML을 
	5. errorPage : 에러 발생시에 이동하는 파일 지정
	6. isErrorPage : 종류별 에러 처리
	
	
	속성="" 속성=""
		=> 띄어쓰기 따옴표 필수
	<%@ %> : 번역되는 태그가 아니라 선언하는 태그
	생략을 하면 한글이 깨진다
	첫줄에 사용한다	


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

<h1>JSP 시작점</h1>

</body>
</html>





