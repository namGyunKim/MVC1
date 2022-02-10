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
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>

<%
	String ssssum = String.valueOf(request.getParameter("p_num1"));
	int scount = Integer.parseInt(ssssum);

	
	String fruitCode = (String)session.getAttribute("sFruitCode");
	/* String fruitCode = (String)session.getAttribute("thisCode"); */
	/* 
	String orderCount2 = String.valueOf(session.getAttribute("thisCount"));
	int orderCount = Integer.parseInt(orderCount2); */

	/* response.sendRedirect("../Pay/pay.jsp"); */

	fruitDAO fr = new fruitDAO();
	FruitVO fv = fr.getIdInfo(fruitCode);
	int totalPrice = scount * fv.getFruitPrice();
/* 	out.println(orderCount);
	out.println(fv.getFruitPrice());
	out.println(totalPrice);

	out.println(ssum);
	out.println(sssum);
	out.println(ssssum); */
	
	session.setAttribute("totalPrice", totalPrice);
	response.sendRedirect("../Pay/pay.jsp");
%>
</body>
</html>