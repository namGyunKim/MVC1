<%@page import="telinfoVO.FruitVO"%>
<%@page import="telinfoDAO.fruitDAO"%>
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
int orderCount=Integer.parseInt(request.getParameter("orderCount"));

response.sendRedirect("../Pay/pay.jsp");

fruitDAO fr=new fruitDAO();
FruitVO fv=fr.getIdInfo(fruitCode);
int totalPrice=orderCount*fv.getFruitPrice();

session.setAttribute("totalPrice", totalPrice);


%>
</body>
</html>