<%@page import="telinfoDAO.AdminDAO"%>
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

AdminDAO ad =new AdminDAO();

String thisId=request.getParameter("joinId");
String thisPw=request.getParameter("joinPw");
String thisLevel=request.getParameter("joinLevel");

ad.join(thisId, thisPw, thisLevel);
response.sendRedirect("adminJoin.jsp");

%>
</body>
</html>