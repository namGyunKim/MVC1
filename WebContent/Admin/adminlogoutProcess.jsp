<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그아웃 프로세스</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");


session.setAttribute("adminId", "null");
session.setAttribute("adminPw", "");
session.setAttribute("adminIdCheck", "");
session.setAttribute("adminPwCheck", "");
response.sendRedirect("adminLogin.jsp");
%>
</body>
</html>