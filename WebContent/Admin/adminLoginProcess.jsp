<%@page import="telinfoDAO.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 프로세스</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
//객체생성
AdminDAO ad = new AdminDAO();
String thisId=request.getParameter("userId");
String thisPw=request.getParameter("userPw");


//아이디가 틀리면 되돌려보냄

if(!(ad.idCheck(thisId))){
	session.setAttribute("adminIdCheck", "ok");
	response.sendRedirect("adminLogin.jsp");	
}
//비밀번호가 틀리면 돌려보냄
else if(!(ad.pwCheck(thisId,thisPw))){
	session.setAttribute("adminIdCheck", "");
	session.setAttribute("adminPwCheck", "ok");
	response.sendRedirect("adminLogin.jsp");
}

else{
session.setAttribute("adminId", thisId);
session.setAttribute("adminPw", thisPw);
session.setAttribute("adminIdCheck", "");
session.setAttribute("adminPwCheck", "null");
	response.sendRedirect("adminLogin.jsp");
}





%>
</body>
</html>