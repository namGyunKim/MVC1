<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 프로세스</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
//객체생성
TelInfoDAO tidao = new TelInfoDAO();
String thisId=request.getParameter("userId");
String thisPw=request.getParameter("userPw");


//아이디가 틀리면 되돌려보냄

if(!(tidao.idCheck(thisId))){
	session.setAttribute("idCheck", "ok");
	response.sendRedirect("login.jsp");	
}
//비밀번호가 틀리면 돌려보냄
else if(!(tidao.pwCheck(thisId,thisPw))){
	session.setAttribute("idCheck", "");
	session.setAttribute("pwCheck", "ok");
	response.sendRedirect("login.jsp");
}

else{
session.setAttribute("sId", thisId);
session.setAttribute("sPw", thisPw);
session.setAttribute("idCheck", "");
session.setAttribute("pwCheck", "null");
	response.sendRedirect("main.jsp");
}





%>

</body>
</html>