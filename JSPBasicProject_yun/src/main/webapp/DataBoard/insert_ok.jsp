<%@page import="java.io.File"%>
<%@page import="com.sist.vo.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%
    // 화면 출력용이 아니라 기능 처리만 하기 때문에 html 내용 다 지움
    // _ok.jsp : 기능 처리 (member_ok, update_od) => 데이터베이스 처리하고 이동만 시켜줌

    // 1. 한글 처리
    request.setCharacterEncoding("UTF-8");

    // 1-1. 파일 업로드 클래스 생성
    String path = "c:\\download";
    int size = 1024 * 1024 * 100;
    String enctype = "UTF-8";

    MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());

    // 2. 요청데이터 받기
    String name = request.getParameter("name");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String pwd = request.getParameter("pwd");

    // 3. VO에 묶는다
    DataBoardVO vo = new DataBoardVO();
    vo.setName(name);
    vo.setSubject(subject);
    vo.setContent(content);
    vo.setPwd(pwd);

    String filename = mr.getOriginalFileName("upload");

    if (filename == null) {

        vo.setFilename("");
        vo.setFilesize(0);

    } else {
        File file = new File(path + "\\" + filename);
        vo.setFilename(filename);
        vo.setFilesize((int) file.length());
    }

    // 4. DAO로 전송
    DataBoardDAO dao = DataBoardDAO.newInstance();
    dao.databoardInsert(vo);    // 오라클에 추가

    // 5. 화면 이동 (list.jsp)
    response.sendRedirect("list.jsp");
%>
