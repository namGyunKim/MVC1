<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 프로세스</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");


session.setAttribute("sId", "null");
session.setAttribute("sPw", "");
session.setAttribute("idCheck", "");
session.setAttribute("pwCheck", "");
response.sendRedirect("login.jsp");
%>
</body>
</html>