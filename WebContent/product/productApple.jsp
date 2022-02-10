<%@page import="telinfoVO.BasketVO"%>
<%@page import="telinfoDAO.BasketDAO"%>
<%@page import="telinfoVO.FruitVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="telinfoDAO.fruitDAO"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <!-- Bootstrap core CSS -->
<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../vendor/10-11.css" />

<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../vendor/10-11.js"></script>  
<script type="text/javascript"> 
function cancle() {
	self.close(); 
	} 
function goSubmit() {
	$("#orderform").submit(); 
	} 
	
function search(){
	  document.frm.action = "search.jsp";
	  document.frm.method = "post";
	  document.frm.submit();
	}
function baskett() {

	
	var counttt = document.getElementById("p_num1").value;
	location.href="../Basket/callOrder4.jsp?counttt="+counttt+"";
}

</script>


<meta charset="UTF-8">
<title>상품구매</title>
<style type="text/css">
body {
  background-color: #fff;
  margin: 0;
}
div.container1 {
  margin: 0 auto 0;
  width: 800px;
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
.btn-type-02 {
  display: inline-block;
  width: auto;  
  font-size: 18px;
  letter-spacing: -1px;
  font-weight: bold;
  height: 40px;
  line-height: 55px;
  text-decoration: none;
  border-radius: 0;
  background-color: #0B6121;
  color: #FFF;
  vertical-align: middle;
}
.firstbox {
  width: 400px;
  height: 400px;
  background-color: white;
  float:left
}
.firstbox-img {
  width: 350px;
  height: 350px;
  background-color: white;
  float: left;
  position:relative;
  left: 25px;
  top: 40px;
}
.secondbox1 {
  width: 400px;
  height: 330px;
  background-color: white;
  float:left;
}
.secondbox2 {
  width: 300px;
  height: 70px;
  background-color: white;
  float:left;
}
.secondbox2-1 {
  width: 100px;
  height: 70px;
  background-color: white;
  float:left;
  text-align: right;
}
.thirdbox {
  width: 400px;
  height: 150px;
  float:left;
}
.fourthbox {
  width: 200px;
  height: 150px;
  background-color: white;
  float:left;
}
.fourthbox-1 {
  width: 200px;
  height: 150px;
  background-color: white;
  float:left;
  text-align: right;
}
.fivebox {
  width: 800px;
  height: 250px;
  float: left;
  background-color: white;
  border-top: 1px solid #A4A4A4;
}

</style>

</head>
	<!-- Navigation -->
	<jsp:include page="../nav.jsp"></jsp:include>
<body>
<br>
<!-- <script type="text/javascript">
function basket.p_sum() {
	
}
</script> -->
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

TelInfoDAO tf= new TelInfoDAO();
fruitDAO fr = new fruitDAO();
FruitVO fv= null;
//모든 과일의 정보
ArrayList<FruitVO> frArray=fr.getAllFruit();
String uId=(String)session.getAttribute("sId");
String jpg=null;
String thisName = "사과";
String thisFruit = "apple";
int cnt=0;
String p_price="";

BasketDAO bk = new BasketDAO();
ArrayList<BasketVO> bkArray=bk.getIdBasket("uId");

%>



				
<!-- 식품코드를 값으로 넘김 -->
<%
for(FruitVO imsi: frArray){ %>
<% fv=fr.getIdInfo(imsi.getFruitCode()); 
String fruitPrice= Integer.toString(fv.getFruitPrice());
int total= imsi.getFruitCount() * Integer.parseInt(fruitPrice);
int Count=0;

%>
<%
//if(thisName.equals(request.getParameter("fruitName"))){ %>
<%if(imsi.getGoodsName().equals(thisName)) {%>
<% session.setAttribute("sFruitCode", imsi.getFruitCode());  %>

	<div class="container1">
	<p class="title">상품 주문</p>
	<div>
		<div class="firstbox">
			<div class="firstbox-img">
				<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
	      			<div class="carousel-inner" role="listbox">
			        	<div class="carousel-item active">
			       			<img class="d-block img-fluid" src="../fruit/img/<%= thisFruit %>/<%= thisFruit %>1.jpg" alt="First slide" style="width:350px;height:320px;">
			        	</div>
				        <div class="carousel-item">
				        	<img class="d-block img-fluid" src="../fruit/img/<%= thisFruit %>/<%= thisFruit %>2.jpg" alt="Second slide" style="width:350px;height:320px;">
				        </div>
				        <div class="carousel-item">
				        	<img class="d-block img-fluid" src="../fruit/img/<%= thisFruit %>/<%= thisFruit %>3.jpg" alt="Third slide" style="width:350px;height:320px;">
				        </div>
		     		</div>
		     		<ol class="carousel-indicators">
			          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			        </ol>
			        <div>
			        	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					        <span class="carousel-control-prev-icon" aria-hidden="true" style="position: fixed;"></span>
					        <span class="sr-only">Previous</span>
				        </a>
			        	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					        <span class="carousel-control-next-icon" aria-hidden="true" style="position: fixed;"></span>
					        <span class="sr-only">Next</span>
				        </a>
		      	  	</div>
				</div>
        
			</div><!-- firstbox-img end -->
		</div><!-- firstbox end -->
		
		<div class="secondbox1">
			<br><br>
			<h3> <%=imsi.getGoodsName() %> </h3><br>
			<p> 상품설명 </p>
			<p> 백설공주가 먹고 기절한 사과 </p>
			
		</div>
		<div class="secondbox2">
			<p style="font-weight:bold;"> <br>가격</p>
			<hr style="border:solid 1px #e9e9e9;" >
		</div>
		<div class="secondbox2-1">
		<p style="font-weight:bold;"><br>
			 <%=imsi.getFruitPrice() %> 원</p>
		<hr style="border:solid 1px #e9e9e9;" >
		</div>
		<div class="thirdbox">
		</div>
		<div class="fourthbox">
			<p style="font-weight:bold;"> 주문수량 <br><br>
			 총 상품 금액</p>
			<!-- 구매하기 -->
			<!-- <form action="../Basket/callOrder2.jsp" method="post" style="display: inline;">
				<input type="submit" value="구매하기" class="btn-type-02">
			</form>  -->
			<!-- 장바구니담기 -->
			<!-- <form action="#" method="post" style="display: inline;">
				<input type="submit" value="장바구니에 담기" class="btn-type-02" style="left:150px;">
			</form> -->
		</div>
		<div class="fourthbox-1">
		<form action="../Basket/callOrder3.jsp" method="post" style="display: inline;">
			 <form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
 				<div class="subdiv">
                	<div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="<%=imsi.getFruitPrice() %>"></div>
						<div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="<%=Count %>" onkeyup="javascript:basket.changePNum(1);">
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum" style="font-weight: bold;">원</div>
                        
                    </div><br>
                    
					<input type="submit" value="구매하기"  class="abutton">
					<input type="button" value="장바구니 담기" onclick="baskett()">
					
				</form>				 
				</form> 
		
		</div>
		
		
	</div>
	</div><!-- container1 end -->

		
<% } %> <!-- if문 끝 -->
<% } %>	<!-- for문 끝 -->
	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>


</body>
</html>