<%--

	제어 => JSTL
	
	core : 제어문, URL 관련, 변수 설정 (request.setAttribute())
		   제어문
		   조건문
		   -----
		   		<c:if test="조건식">
		   			true시 처리
		   		</c:if>					==> 다중 조건문, if~else 없다
		   선택문
		   -----
		   		<c:choose>
		   			<c:when test="">처리문장</c:when>
		   			<c:otherwise>default</c:otherwise>
		   		</c:choose>
		   			=> switch, 다줄 if
		   반복문
		   -----
		   	<c:forEach>
		   		for(int i=0; i<=10; i++)
		   		=> <c:forEach var="i" begin="0" end="10" step="1">
		   										------- 포함
		   		**단점 for(int i=10; i>=10; i--) => - 는 forEach에서 사용 못 함
		   		
			<c:forEach> => 향상된 for(for~each)
				for(BoardVO vo:list)
					=> <c:forEach var="vo" items="list">

		   	<c:forTokens>	=> StringTokenizer

			URL : 화면 이동
			------------- response.sendRedirect(url)
							=> <c:redirect url="url">
						  request.setAttribute("a",값)
						  	=> <c:set var="a" value="값">		   		
		   				  
		   	out.println()
		   		=> <c:out value="">
		   		=> 자바스크립트에서 자바 데이터를 받아서 출력시 사용
		   	
	fmt : 변환 (날짜 변환, 숫자 변환 : DecimalFormat)
			   -------  -------			ㅣ
			   	SimpleDateFormat		<fmt:formatNumber value="" pattern="999,999">
			   		   ㅣ
			   		   <fmt:formatDate value="" pattern="yyyy-MM-dd">
			   		   
	fn : String 메소드 처리
		${fn:length(문자열)}
		${fn:substring(문자열,start,end)}
		
	sql : DAO
	xml : OXM

 --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
<%--import : 제어문, URL, 변수선언 할 때 core import --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- format --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- function : fn --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--

prefix => 사용자 결정이 가능
prefix="c"

 --%>


<%

	// 데이터 설정 = > 오라클
	List<String> names=new ArrayList<String>();
	names.add("홍길동");
	names.add("ㄱㄴㄷ");
	names.add("ㅁㄴㅇ");
	names.add("ㄱㄷㅈ");
	names.add("ㅂㅂㅈ");
	
	// => 이상태에선 EL 사용 불가 => ${}으로 출력 원하면 request, session 저장해야 사용 가능
	request.setAttribute("names", names);		
	
	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>자바를 이용한 for문</h1>
<h3>이름 목록</h3>
<ul>
<%  
	for(String name:names) {
%>
		<li><%=name %></li>
<%		
	}
%>
</ul>

<h3>JSTL 이용한 for문</h3>
<ul>
	<c:forEach var="name" items="${names }">
	<li>${name }</li>
	</c:forEach>
</ul>


<h3>자바 (StringTokenizer)</h3>
<ul>
<%
	String color="red,blue,green,yellow,black";
	StringTokenizer st=new StringTokenizer(color,",");
	
	while(st.hasMoreTokens()) {
%>
	<li><%=st.nextToken() %></li>
<%		
	}
%>
</ul>

<h3>JSTL (forTokens)</h3>
<ul>
<c:forTokens var="c" items="red,blue,green,yellow,black" delims=",">
<li>${c }</li>
</c:forTokens>
</ul>

<%--
	var="c"		=> st.nextToken()
	items="red,blue,green,yellow,black"		=>문자열
	delims=","		=> 구분자
	
 --%>


</body>
</html>


