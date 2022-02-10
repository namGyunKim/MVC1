<%@page import="telinfoDAO.BasketDAO"%>
<%@page import="telinfoVO.FruitVO"%>
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
String fruitCode=(String)session.getAttribute("orderFruitCode");
String fruitCount2=(String)session.getAttribute("orderFruitCount");
%>

<%=fruitCode %>
<%=fruitCount2 %>
<%
fruitDAO fr=new fruitDAO();
FruitVO fv=fr.getIdInfo(fruitCode);
BasketDAO bk=new BasketDAO();

%>

<%
String memid=(String)session.getAttribute("sId");
String goodsName=fv.getGoodsName();
int fruitPrice=fv.getFruitPrice();
%>

<%
if(bk.basketIsCode(fruitCode, memid)){
bk.basketAdd(memid, fruitCode, fruitCount2);
 response.sendRedirect("Basket/shopping.jsp"); 
}
else{
bk.join(memid, fruitCode, goodsName, fruitCount2, fruitPrice);
 response.sendRedirect("Basket/shopping.jsp"); 

}
%>
</body>
</html>