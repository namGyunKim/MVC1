<%@page import="telinfoVO.FruitVO"%>
<%@page import="telinfoDAO.fruitDAO"%>
<%@page import="telinfoDAO.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 등록 프로세스</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");


BasketDAO bk = new BasketDAO();
fruitDAO fr = new fruitDAO();


/* String memid=(String)session.getAttribute("sId");
String fruitCode=request.getParameter("fruitCode");
int orderCount=Integer.parseInt(request.getParameter("orderCount"));
//식품코드를 값으로 넘겨서 식품의 전체정보를 받아옴
FruitVO fruitInfo = fr.getIdInfo(fruitCode);
String goodsName= fruitInfo.getGoodsName();
int fruitCount=fruitInfo.getFruitCount();
int fruitPrice=fruitInfo.getFruitPrice(); */



/* if(bk.basketIsCode(fruitCode)){
bk.basketAdd(memid, fruitCode,orderCount);		
 response.sendRedirect("shopping.jsp"); 
}
else{
bk.join(memid, fruitCode, goodsName, orderCount, fruitPrice);
 response.sendRedirect("shopping.jsp"); 
	
} */

String fruitCode = (String)session.getAttribute("thisCode");
String fruitGoodsName = request.getParameter("thisName");
String ssssum = String.valueOf(request.getParameter("test"));
int fruitCounttest = Integer.parseInt(ssssum);

/* String goodsName = (String)session.getAttribute("fruitGoodsName");
String ssssumm = String.valueOf(request.getParameter("ssssumm"));
int fruitPrice =  Integer.parseInt(ssssumm);
 */
 out.println(fruitCounttest);
 out.println(fruitCode);
 out.println(fruitGoodsName);
/*
out.println(goodsName);
out.println(fruitPrice);
 */
%>


</body>
</html>