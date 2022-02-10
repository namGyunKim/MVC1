<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

TelInfoDAO tidao= new TelInfoDAO();
String thisId=request.getParameter("joinId");


boolean result= tidao.confirmId(thisId);

if(result){ %>
<center>
<br/ ><br/ >
<h4>이미 사용중인 ID입니다.</h4>
</center>
<% } else{ %>
<center>
<br/ ><br/ >
<h4>사용할 수 있는 ID입니다.</h4>
</center>
<% }  %> --%>
</body>
</html>