<%@page import="telinfoDAO.fruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일삭제 프로세스</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

fruitDAO fr = new fruitDAO();

String thisFruitCode=request.getParameter("fruitDelete");


//식품코드의 값이 없다면
if(!(fr.codeCheck(thisFruitCode))){
	
	session.setAttribute("sFruitDelete", "null");
	response.sendRedirect("fruitManager.jsp");
}
//식품코드 삭제하면
else if(fr.deleteFruit(thisFruitCode)){
	session.setAttribute("sFruitDelete", thisFruitCode);
	response.sendRedirect("fruitManager.jsp");
	
}


%>

</body>
</html>