<%@page import="telinfoVO.FruitVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="telinfoDAO.fruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><!-- <!-- Bootstrap core CSS -->
<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>전체과일목록</title>
<style type="text/css">
	body {
		background-color: #fff;
    	margin: 0;
	}
	table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
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
</style>

</head>
<!-- Navigation -->
	<jsp:include page="../nav.jsp"></jsp:include>
</head>
<body>
<br>
<%
request.setCharacterEncoding("UTF-8");
//객체 생성
fruitDAO fr = new fruitDAO();
ArrayList<FruitVO> frArray=fr.getAllFruit();

%>

<div class="container">
		<p class="title">전체과일목록</p>

		<div class="form-area">
			<!-- 과일정보입력 -->
<table class="type11">
	<tr>
		<th scope="cols">식품코드</th><th scope="cols">식품명</th><th scope="cols">생산연도</th><th scope="cols">제조사</th><th scope="cols">가격</th><th scope="cols">상품명</th><th scope="cols">재고수량</th><th scope="cols">이미지 이름</th>
	</tr>
<%
for(FruitVO imsi : frArray){ %>
	<tr>
		<td> <%=imsi.getFruitCode() %></td>
		<td> <%=imsi.getFruitName() %></td>
		<td> <%=imsi.getProductYear() %></td>
		<td> <%=imsi.getFruitMaker() %></td>
		<td> <%=imsi.getFruitPrice() %></td>
		<td> <%=imsi.getGoodsName() %></td>
		<td> <%=imsi.getFruitCount() %></td>
		<td> <%=imsi.getFruitImg() %></td>
<%} %>
	</tr>
</table>
</div>
</div>
<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>