<%@page import="telinfoDAO.CustomerServiceDAO"%>
<%@page import="telinfoVO.BoardVO"%>
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
CustomerServiceDAO cs = new CustomerServiceDAO();
String thisTitle=request.getParameter("changeTitle");
String thisContents=request.getParameter("changeContents");
int thisNumber=Integer.parseInt((String)session.getAttribute("sBoardNumber"));

cs.boardDataChange(thisTitle, thisContents, thisNumber);
response.sendRedirect("csboardAllList.jsp");

%>


</body>
</html>