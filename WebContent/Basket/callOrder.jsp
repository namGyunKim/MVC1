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
String fruitCode=request.getParameter("fruitCode");
String orderCount=request.getParameter("orderCount");

RequestDispatcher rd1=request.getRequestDispatcher("../1.jsp");
//RequestDispatcher rd1=request.getRequestDispatcher("test.jsp");
rd1.forward(request,response);


%>
</body>
</html>