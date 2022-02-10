<%@page import="telinfoDAO.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문후 장바구니 전체삭제</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

BasketDAO bk=new BasketDAO();

String uId=(String)session.getAttribute("sId");
bk.BasketAllDelete(uId);

response.sendRedirect("../Basket/shopping.jsp");
%>




</body>
</html>