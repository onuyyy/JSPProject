<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>action 태그</h1>
<table class="table">
	<tr>
		<td>
			<ul>
				<li>&lt;jsp:include page=""&gt; : JSP 특정 영역의 다른 JSP를 첨부해서 사용한다 (조립)
					<br>
					&lt;jsp:include page=""&gt; : JSP를 따로 실행한 다음에 HTML로 묶는다 (동적)
					<br>
					&lt;%@jsp:include page="" %&lt; : JSP를 먼저 묶어서 한 번에 컴파일한다 : 메뉴, footer 만들 때 자주 사용 (변수가 없기 때문)
					<!-- @jsp:include : 전부 다 복사 ==> 변수 충돌 위험 크다 -->
				</li>
				<li>&lt;jsp:forward page=""&gt; : 파일을 덮어쓴다 (URL 유지 = request를 사용)</li>
				<li>&lt;jsp:param value="값" name="key"&gt;</li>			
				<li>&lt;jsp:useBean id="" class=""&gt; : 클래스 메모리 할당</li>
				<li>&lt;jsp:setProperty name="객체명" property=""&gt; : 빈즈(VO)에 값을 채운다</li>			
			</ul>
		</td>
	</tr>
</table>
</body>
</html>