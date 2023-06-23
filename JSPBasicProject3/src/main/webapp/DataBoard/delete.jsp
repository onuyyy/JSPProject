<%@page import="com.sist.vo.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.io.*"%>
<jsp:useBean id="dao" class="com.sist.dao.DataBoardDAO"></jsp:useBean>
<%
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	DataBoardVO vo=dao.databoardFileInfo(Integer.parseInt(no));
	
	// dao 연결
	Boolean bCheck=dao.databoardDelete(Integer.parseInt(no), pwd);
	
	if(bCheck==true) {
		
		// 파일 유무 확인
		if(vo.getFilesize()!=0) {	// 파일이 존재
			File file=new File("c:\\download\\"+vo.getFilename());
				file.delete();
		}
		response.sendRedirect("list.jsp");

	} else {
	%>
		<script>
			alert("비밀번호가 틀립니다.");
			history.back();
		</script>
	<%	
	}
	
%>  