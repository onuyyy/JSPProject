<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	// response.sendRedirect("response_2.jsp");
	RequestDispatcher rd = request.getRequestDispatcher("response_2.jsp");
	rd.forward(request, response);
	// request를 잃어버리지 않게 하는 것 forward => 복사해서 붙여넣는다
	System.out.println(request);

%>

<%-- request는 한 단계 더 거치면 갑을 잃어버린다 (초기화 후 값이 들어감) --%>
