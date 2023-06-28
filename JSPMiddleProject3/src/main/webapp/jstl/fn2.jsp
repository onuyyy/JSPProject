<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<String> list=new ArrayList<String>();
	list.add("red");
	list.add("grey");
	list.add("pink");
%>

<c:set var="list" value="<%=list %>"/>

<%--
	JSTL에서 제공하는 태그는 XML로 만들어져있다
		1. 태그, 속성은 대소문 구분
		2. 속성값은 반드시 ""
		3. 여는 태그, 닫는 태그 반드시 사용한다
 --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자바</h1>
	<ul>
		<li><%=list.get(0) %></li>
		<li><%=list.get(1) %></li>
		<li><%=list.get(2) %></li>
	</ul>
	
	<h1>자바 for문</h1>
	<ul>
		<%
			for(int i=0; i<list.size(); i++) {
		%>	
				<li><%=list.get(i) %></li>
		<%	
			}
		%>
	</ul>
	
	<h1>자바 forEach</h1>
	<ul>
	<%
		for(String s:list) {
	%>
		<li><%=s %></li>
	<%		
		}
	%>
	</ul>
	
	<h1>EL 이용</h1>
	<ul>
		<li>${list[0] }</li>
		<li>${list[1] }</li>
		<li>${list[2] }</li>
	</ul>
	
	<h1>JSTL 이용</h1>
	<ul>
		<c:forEach var="col" items="${list }">
		<li>${col }</li>
		</c:forEach>
	</ul>
	
		<h1>JSTL 이용 2</h1>
	<ul>
		<c:forEach var="col" items="${list }" varStatus="s">
		<!--  <li>${s.index+1}.${col }</li>-->
		<li>${list[s.index] }</li>
		</c:forEach>
	</ul>
	<!-- index 번호 가져올 때 varStatus -->
	
	<h1>JSTL 이용 3</h1>
	<%
		List<String> names=new ArrayList<String>();
		names.add("ㅎㄱㄷ");
		names.add("ㅁㄴㅇ");
		names.add("ㅂㅈㄷ");
		names.add("ㅎㄹㅇ");
		names.add("ㅋㅌㅊ");
		
		List<String> sexs=new ArrayList<String>();
		sexs.add("남");
		sexs.add("여");
		sexs.add("남");	
		sexs.add("여");	
		sexs.add("남");
	%>
	
	<c:set var="names" value="<%=names %>"/>
	<c:set var="sexs" value="<%=sexs %>"/>
	<ul>
		<c:forEach var="name" items="${names }" varStatus="n">
			<li>${name }(${sexs[n.index] })</li>
		</c:forEach>
	</ul>
	
</body>
</html>


