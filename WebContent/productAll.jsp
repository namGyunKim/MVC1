<%@page import="telinfoVO.BasketVO"%>
<%@page import="telinfoDAO.BasketDAO"%>
<%@page import="telinfoVO.FruitVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="telinfoDAO.fruitDAO"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <!-- Bootstrap core CSS -->
<link href="vendor/css/shop-homepage.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>상품구매</title>
<style type="text/css">
body {
  background-color: #fff;
  margin: 0;
}
div.container1 {
  margin: 0 auto 0;
  width: 600px;
}
p.title {
  text-align: center;
  font-size: 40px;
  font-weight: bold;
  letter-spacing: -6px;
  color:#0B6121;
}

.form-area table {
  background-color: #FFF;
  border: 1px solid #dadada;
  margin-bottom: 15px;
  border-collapse: collapse;
  width: 100%;
}
.form-area table:last-child {
  margin-bottom: 0;
}
.form-area table tr td {
  border-bottom: 1px solid #f0f0f0;
  padding: 5px 10px;
}
.form-area table tr:last-child td {
  border-bottom: 1px solid #dadada;
}
.input-text {
  border: none;
  height: 30px;
  padding: 2px 0px;
  width: 100%;
  font-size: 14px;
}
.input-text.birth {
  width: 180px;
}
.form-area table tr td select {
  width: 180px;
  border: none;
  height: 30px;
  padding: 2px 0px;
 font-size: 14px;
}
.form-area table tr td .alert {
  color: #ef0003;
  font-size: 12px;
  margin: 5px 0;
  display: none;
}
.button-area {
  text-align: center;
  padding: 10px 0;
}
.btn-type-01 {
  display: inline-block;
  width: 100%;
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
.card-w {
  position: relative;
  width: 100%;
  padding-top: 15px;
  padding-right: 15px;
  padding-left: 15px;
}
.container2 {
  width:200px;
  height: 260px;
  float: left;
}
</style>

</head>
	<!-- Navigation -->
	<jsp:include page="main_nav.jsp"></jsp:include>
	
<body>
<br>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

TelInfoDAO tf= new TelInfoDAO();
fruitDAO fr = new fruitDAO();
//모든 과일의 정보
ArrayList<FruitVO> frArray=fr.getAllFruit();
String uId=(String)session.getAttribute("sId");
String jpg = null;
String price;


BasketDAO bk = new BasketDAO();
ArrayList<BasketVO> bkArray=bk.getIdBasket(uId);

%>

	<div class="container1">
		<p class="title">상품 리스트</p>
		<hr style="border:solid 1px #e9e9e9;">
	</div><!-- container1 end -->
	
	
	<div class="container1">
	
	<!-- 식품코드를 값으로 넘김 -->
	<%
	for(FruitVO imsi: frArray){%>
	<%
		String thisName = imsi.getGoodsName();
		int thisPrice = imsi.getFruitPrice();
		int thisCount = imsi.getFruitCount();
		String mv = null;
	%>
	<%
	if(imsi.getGoodsName().equals("사과")) {
		jpg="apples-gf0dcd13a8_1920";
		mv = "product/productApple";
	}else if(imsi.getGoodsName().equals("배")){
		jpg="pear-gc96e84ef7_1920";
		mv = "product/productPear";
	}else if(imsi.getGoodsName().equals("오렌지")){
		jpg="clementines-gc7ab8893d_1920";
		mv = "product/productOrange";
	}else if(imsi.getGoodsName().equals("포도")){
		jpg="grapes-g611a32c2f_1920";
		mv = "product/productGrape";
	}else if(imsi.getGoodsName().equals("복숭아")){
		jpg="peaches-gffec9d744_1920";
		mv = "product/productPeach";
	}else if(imsi.getGoodsName().equals("레몬")){
		jpg="lemons-ga69319cef_1920";
		mv = "product/productLemon";
	}else if(imsi.getGoodsName().equals("체리")){
		jpg="cherry-g3c03cfa6b_1920";
		mv = "product/productCherry";
	}else if(imsi.getGoodsName().equals("딸기")){
		jpg="strawberries-gdfa15117c_1920";
		mv = "product/productStrawberry";
	}else if(imsi.getGoodsName().equals("석류")){
		jpg="pomegranate-gbfb86db9e_1920";
		mv = "product/productPomegranate";
	}else if(imsi.getGoodsName().equals("블루베리")){
		jpg="blueberries-g9d4ebd259_1920";
		mv = "product/productBlueberry";
	}else if(imsi.getGoodsName().equals("바나나")){
		jpg="bananas-g6e2b0d2d4_1920";
		mv = "product/productBanana";
	}else if(imsi.getGoodsName().equals("파인애플")){
		jpg="pineapple-gadbf9af40_1920";
		mv = "product/productPineapple";
	}%>
		
	<div class="container2">
	<div class="row">
          <div class="card-w">
            <div class="card h-100">
					<a href="<%=mv %>.jsp"><img src="fruit/img/<%= jpg %>.jpg" alt=""></a>
        	<div class="card-body" align="center">
        		<h5 class="card-title">
                	<a href="<%=mv %>.jsp"><%= thisName %></a>
                </h5>
                <h5>가격 : <%= thisPrice %></h5>
                <p class="card-text">재고 : <%= thisCount %></p>
            </div>
			</div>
		</div>
	</div>
	</div><!-- container2 end -->
	<%} %>        
	</div>  

	
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>




</body>
</html>

