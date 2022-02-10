<%@page import="telinfoDAO.fruitDAO"%>
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

fruitDAO fr = new fruitDAO();

String thisFruitName=request.getParameter("joinFruitName");
String thisFruitPYear=request.getParameter("joinFruitPYear");
String thisFruitMaker=request.getParameter("joinFruitMaker");
int thisFruitPrice=Integer.parseInt(request.getParameter("joinFruitPrice"));
String thisFruitGoods=request.getParameter("joinFruitGoods");
int thisFruitCount=Integer.parseInt(request.getParameter("joinFruitCount"));
String thisFruitImg=request.getParameter("joinFruitImg");
String thisFruitCode=(String)session.getAttribute("sChangeCode");




if(fr.fruitDataChange(thisFruitCode, thisFruitName, thisFruitPYear, thisFruitMaker, thisFruitPrice, thisFruitGoods, thisFruitCount, thisFruitImg)){
session.setAttribute("sFruitChange", thisFruitCode);
 response.sendRedirect("fruitManager.jsp"); 
	
}


%>
<%-- <%=thisFruitCode %>
<%=thisFruitName %>
<%=thisFruitPYear %>
<%=thisFruitMaker %>
<%=thisFruitPrice %>
<%=thisFruitGoods %>
<%=thisFruitCount %>
<%=thisFruitImg %> --%>

</body>
</html>