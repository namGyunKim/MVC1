<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String pw1=(String)session.getAttribute("sPw");
String pw2=request.getParameter("pwCheck");

if(pw1.equals(pw2)){
	RequestDispatcher rd1=request.getRequestDispatcher("customerChange2.jsp");
	rd1.forward(request,response);
}

else{
	RequestDispatcher rd1=request.getRequestDispatcher("customerChange.jsp");
	rd1.forward(request,response);
}
%>



</body>
</html>