<%@page import="data_vo.futsalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.*,vo.*,java.util.*,java.sql.*" %>
<%

request.setCharacterEncoding("UTF-8");

String gname=request.getParameter("gname");	// 사용자가 선택한 구장 이름, 시간, 지역
String gtime=request.getParameter("gtime");
String garea=request.getParameter("garea");

futsalVO gvo=new futsalVO();

gvo.setName(gname);

FutsalDAO dao = FutsalDAO.newInstance();
List<FutsalVO> list = dao.futsalListData();


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">

.container{
   margin-top: 50px;
}
.row{
   margin: 0px auto;
   width: 800px;
}
h1{
  text-align: center;
  font-family: 'Gasoek One', sans-serif;
}
.table{
  border: 1px solid black;
}
</style>

</head>
<body>
<div class="container">
    <h1>header</h1>
    <table class="table">
      <tr>
        <th colspan="10" class="text-center">이미지</th>
      </tr>
      <tr>
        <th rowspan="10" class="text-left">
        	구장이름 : <br>
        	구장주소 : <br>
        	구장가격 : <br>
        	구장정보 :
        </th>
        <td>지도</td>
      </tr>
      <tr>
        <td>날씨</td>
      </tr>
    </table>
<%
    for (FutsalVO vo :list) {
%>      
        <h3><%= vo.getGname() %></h3>
<%    
    }
%>
</div>
</body>
</html>
