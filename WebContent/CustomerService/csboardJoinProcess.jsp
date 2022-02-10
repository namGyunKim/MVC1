<%@page import="telinfoDAO.CustomerServiceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 프로세스</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

CustomerServiceDAO cs=new CustomerServiceDAO();
String thisTitle=request.getParameter("joinTitle");
String thisContents=request.getParameter("joinContents");
String thisId=(String)session.getAttribute("sId");
cs.join(thisTitle, thisId, thisContents);
response.sendRedirect("csboardAllList.jsp");
%>




</body>
</html>