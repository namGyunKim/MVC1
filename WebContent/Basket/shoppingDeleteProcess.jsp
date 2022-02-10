<%@page import="telinfoDAO.BasketDAO"%>
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

BasketDAO bk = new BasketDAO();
String uId=(String)session.getAttribute("sId");
String fruitCode=request.getParameter("fruitCode");
bk.deleteBasket(uId, fruitCode);
//삭제된 식품코드
session.setAttribute("sBasketDelete", fruitCode);

response.sendRedirect("shoppingDeleteForm.jsp");
%>



</body>
</html>