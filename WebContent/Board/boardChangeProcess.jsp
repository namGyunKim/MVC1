<%@page import="telinfoVO.BoardVO"%>
<%@page import="telinfoDAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 체이지 프로세스</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

BoardDAO board =new BoardDAO();
String thisTitle=request.getParameter("changeTitle");
String thisContents=request.getParameter("changeContents");
int thisNumber=Integer.parseInt((String)session.getAttribute("sBoardNumber"));

board.boardDataChange(thisTitle, thisContents, thisNumber);
response.sendRedirect("boardList.jsp");

%>


</body>
</html>