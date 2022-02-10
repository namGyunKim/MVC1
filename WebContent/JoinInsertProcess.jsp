<%@page import="com.sun.org.apache.xpath.internal.operations.And"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 고객 추가</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
//객체생성
TelInfoDAO tidao = new TelInfoDAO();

String thisNickName=request.getParameter("joinNickName");
String thisId=request.getParameter("joinId");
String thisPw=request.getParameter("joinPw");
String thisPwCheck=request.getParameter("joinPwCheck");
String thisName=request.getParameter("joinName");
String thisTel=request.getParameter("joinTel");
String thisAddress=request.getParameter("joinAddress");



//아이디 중복체크
if(tidao.idCheck(thisId)){
	session.setAttribute("idCheck","");
	RequestDispatcher rd1=request.getRequestDispatcher("idMiss.jsp");
	rd1.forward(request,response);
}
//비밀번호 입력한거 두개가 맞나 체크 및 4글자이상인지
else if(thisPw.equals(thisPwCheck) &&thisPw.length() >3   ){

tidao.join(thisNickName,thisId,thisPw,thisName,thisTel,thisAddress);
session.setAttribute("sid",thisId);
RequestDispatcher rd1=request.getRequestDispatcher("login.jsp");
rd1.forward(request,response);
}else{
	RequestDispatcher rd1=request.getRequestDispatcher("joinMiss.jsp");
	rd1.forward(request,response);
}



%>
</body>
</html>