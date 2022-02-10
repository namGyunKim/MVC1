<%@page import="telinfoDAO.BasketDAO"%>
<%@page import="telinfoVO.BasketVO"%>
<%@page import="telinfoDAO.fruitDAO"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑하기</title>
</head>
<body>
<br>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

TelInfoDAO tf= new TelInfoDAO();
fruitDAO fr = new fruitDAO();
BasketDAO bk = new BasketDAO();
String uId=(String)session.getAttribute("sId");
//해당 유저의 모든 장바구니 목록
ArrayList<BasketVO> bkArray=bk.getIdBasket(uId);

%>

<%
//로그인상태가 아니라면
if( !(tf.idCheck(uId))    ){
	response.sendRedirect("shoppingMiss.jsp");
}
%>


<h2>삭제하려는 식품코드를 클릭해주세요</h2>
<h3><a href="../login.jsp">로그인 화면으로 돌아가기</a></h3>

<%

String basketDelCheck=(String)session.getAttribute("sBasketDelete");
basketDelCheck+="코드";
if(bk.basketCodeCheck(basketDelCheck)){
	out.println(basketDelCheck+"가 삭제되었습니다.");
	session.setAttribute("sBasketDelete", "null");
}
response.sendRedirect("shopping.jsp");
%>


<table border="2">
<tr>
<th>식품코드</th><th>상품명</th><th>주문개수</th><th>가격</th>
</tr>

<!-- 식품코드를 값으로 넘김 -->
<%
for(BasketVO imsi: bkArray){ %>
<tr>
<td><a href="shoppingDeleteProcess.jsp?fruitCode=<%=imsi.getFruitCode() %>">
				<%=imsi.getFruitCode() %></a></td>
<td> <%=imsi.getGoodsName() %></td>
<td> <%=imsi.getFruitCount() %></td>
<td> <%=imsi.getFruitPrice() %></td>
<%} %>
</tr>
</table>


</body>
</html>