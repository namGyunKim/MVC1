<%@page import="telinfoVO.BoardVO"%>
<%@page import="telinfoDAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 프로세스</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

BoardDAO ba= new BoardDAO();
String thisTitle=request.getParameter("joinTitle");
String thisContents=request.getParameter("joinContents");
String thisId=(String)session.getAttribute("sId");
ba.join(thisTitle, thisId, thisContents);
response.sendRedirect("boardList.jsp");
%>




</body>
</html>