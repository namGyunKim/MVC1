<%@page import="telinfoDAO.fruitDAO"%>
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

String thisCode=request.getParameter("fruitChange");
session.setAttribute("sChangeCode", thisCode);


fruitDAO fr = new fruitDAO();

//식품코드의 값이 없다면
if(!(fr.codeCheck(thisCode))){
	
	
	session.setAttribute("sChangeOk", "없다");
	session.setAttribute("sFruitChange", "null");
	response.sendRedirect("fruitManager.jsp");
}
else{
	RequestDispatcher rd1=request.getRequestDispatcher("fruitChangeForm.jsp");
	rd1.forward(request,response);

}

%>

</body>
</html>