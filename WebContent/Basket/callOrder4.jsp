<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바로주문하기</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<%

String fruitCode = (String)session.getAttribute("sFruitCode");
String fruitCount = request.getParameter("counttt");


session.setAttribute("orderFruitCode", fruitCode);
session.setAttribute("orderFruitCount", fruitCount);

response.sendRedirect("../1.jsp");
%>

</body>
</html>