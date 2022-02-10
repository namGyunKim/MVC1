<%@page import="telinfoDAO.fruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과일 추가</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
fruitDAO fr = new fruitDAO();

String ThisCode=request.getParameter("joinCode");
String ThisName=request.getParameter("joinFruitName");
String ThisPYear=request.getParameter("joinPYear");
String ThisMaker=request.getParameter("joinMaker");
int ThisPrice=Integer.parseInt(request.getParameter("joinPrice"));
String ThisGoods=request.getParameter("joinGoods");
int ThisCount=Integer.parseInt(request.getParameter("joinCount"));
String ThisImg=request.getParameter("joinImg");


//식품코드체크
if(fr.codeCheck(ThisCode)){
	out.println("동일한 식품코드가 존재합니다");
	RequestDispatcher rd1=request.getRequestDispatcher("furitJoinMiss.jsp");
	rd1.forward(request,response);

}
else{
//상품등록에 성공시
if(fr.join(ThisCode, ThisName, ThisPYear, ThisMaker, ThisPrice, ThisGoods, ThisCount,ThisImg)){
out.println("상품이 등록되었습니다.");	
}
else{
	out.println("상품등록 실패!");
}
	
}


%><br>
<a href="furitJoin.jsp">추가로 등록하시겠습니까?</a><br>





</body>
</html>