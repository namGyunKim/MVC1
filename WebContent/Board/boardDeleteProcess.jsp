<%@page import="telinfoDAO.BoardDAO"%>
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

BoardDAO board=new BoardDAO();

String thisName=(String)session.getAttribute("sId");
String thisNumber=request.getParameter("boardNumber");

board.deleteBoard(thisName, thisNumber);
 response.sendRedirect("boardList.jsp");
%>
</body>
</html>