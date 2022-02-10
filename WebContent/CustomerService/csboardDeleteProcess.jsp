<%@page import="telinfoDAO.CustomerServiceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

CustomerServiceDAO cs = new CustomerServiceDAO();
String thisName=(String)session.getAttribute("sId");
String thisNumber=request.getParameter("boardNumber");

cs.deleteBoard(thisName, thisNumber);
 response.sendRedirect("csboardList.jsp");
%>
</body>
</html>