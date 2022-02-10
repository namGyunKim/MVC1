<%@page import="telinfoVO.AdminVO"%>
<%@page import="telinfoDAO.AdminDAO"%>
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

AdminDAO ad=new AdminDAO();
String thisId=request.getParameter("adminUser");
AdminVO av=ad.getIdInfoLevel(thisId);

//마스터계정이면 삭제 안함
if(av.getAdminLevel()==10){
response.sendRedirect("adminJoin.jsp");
	
}
else{
ad.deleteAdmin(thisId);
response.sendRedirect("adminJoin.jsp");
	
}
%>

</body>
</html>