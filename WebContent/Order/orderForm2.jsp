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
<title>주문</title>
<!-- <!-- Bootstrap core CSS -->
<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	body {
		background-color: #fff;
    	margin: auto;
	}
	table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: auto;
}
table.type11 th {
  width: 155px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #0B6121 ;
}
table.type11 td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
p.title {
		text-align: center;
		font-size: 40px;
		font-weight: bold;
		letter-spacing: -6px;
		color:#0B6121;
	}
	
.btn-type-01 {
		display: inline-block;
		width: 100px;
		font-size: 18px;
		letter-spacing: -1px;
		font-weight: bold;
		height: 60px;
		line-height: 55px;
		text-decoration: none;
		border-radius: 0;
		background-color: #0B6121;
		color: #FFF;

		
	}	
</style>



</head>
<jsp:include page="../nav.jsp"></jsp:include>
<body>

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
	response.sendRedirect("../Basket/shoppingMiss.jsp");
}
%>

	



<%

String basketDelCheck=(String)session.getAttribute("sBasketDelete");
basketDelCheck+="코드";
if(bk.basketCodeCheck(basketDelCheck)){
	out.println(basketDelCheck+"가 삭제되었습니다.");
	session.setAttribute("sBasketDelete", "null");
}
%>
	<p class="title">주문취소할 상품은 식품코드를 클릭하고 주문해주세요</p>
	<br>

<div class="container">
	
			
		<div class="form-area">
			<!-- 과일정보입력 -->
<table class="type11">
	<tr>
		<th scope="cols">식품코드</th><th scope="cols">식품명</th><th scope="cols">주문개수</th><th scope="cols">가격</th>
	</tr>

<!-- 식품코드를 값으로 넘김 -->
<%
for(BasketVO imsi: bkArray){ %>
<tr>
<td><a href="../Basket/shoppingDeleteProcess.jsp?fruitCode=<%=imsi.getFruitCode() %>">
				<%=imsi.getFruitCode() %></a></td>
<td> <%=imsi.getGoodsName() %></td>
<td> <%=imsi.getFruitCount() %></td>
<td> <%=imsi.getFruitPrice() %></td>
<%} %>
</tr>
</table>
<br><br>

<center>
<form action="orderProcess.jsp"  >
<input type="submit" value="주문" class="btn-type-01">
</form>

<br><br><br><br>
<h4><a href="../login.jsp">로그인 화면으로 돌아가기</a></h4>
</center>



</body>
</html>