<%@page import="telinfoVO.BasketVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@page import="telinfoDAO.BasketDAO"%>
<%@page import="telinfoDAO.fruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 프로세스</title>

<!-- <!-- Bootstrap core CSS -->
<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../vendor/10-11.css" />

<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../vendor/10-11.js"></script>

<style type="text/css">
div.container1 {
  margin: 0 auto 0;
  width: 800px;
}
</style>



</head>

	<jsp:include page="../nav.jsp"></jsp:include>
<body>
<br>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

fruitDAO fr = new fruitDAO();
BasketDAO bk = new BasketDAO();
TelInfoDAO tf = new TelInfoDAO();
String uId=(String)session.getAttribute("sId");
//총 주문 가격
int orderSum=0;
//해당 유저의 모든 장바구니 목록
ArrayList<BasketVO> bkArray=bk.getIdBasket(uId);

%>


<%
for(BasketVO imsi: bkArray){
	bk.basketOrder(imsi.getFruitCode());
}
%>

<br><br><br><br><br><br><br>
<div class="container1">
	<div align="center">
		<h2><%=uId %>고객님 주문완료되었습니다.</a></h2><br>
		
	  	<a href="../main.jsp" class="abutton">메인화면으로 이동</a>
		<a href="../productAll.jsp" class="abutton">상품리스트로 이동</a>
		<!-- <a href="orderBasketAllDelete.jsp" class="abutton">장바구니 삭제</a> -->
		
	</div>
	
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>