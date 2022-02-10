<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="vendor/css/shop-homepage.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="WebContent/vendor/css/newstyle.css">
<!-- Custom styles for this template -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



<meta charset="UTF-8">
<title>메인</title>
<style>
p {
	margin: 20px 0px;
}

.main_container {
	display: flex;
	width: 100vw;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.main_container_form {
	width: 700px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 10px;
}

.button {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#select {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 25px;
	width: 180px;
	height: 80px;
	cursor: pointer;
	transition: all 2s;
}

#result {
	display: none;
	justify-content: center;
	align-items: center;
	font-size: 25px;
	width: 180px;
	height: 80px;
	cursor: default;
	transition: all 2s;
}

.check {
	padding: 10px 10px;
}
#bg {
  top: 0; 
  left: 50%;
  position: fixed;
  z-index:1;
  width:1920px;
  height:1281px;
  overflow:hidden;
  text-align:center;
  margin-left: -960px;
  /* transform:translateX(-1px); */
  opacity: 1;
}
.div {
  text-align:center;
}
.div.middle {
  width: 100%;
  height: 400px;
  clear: both;
  background-color: black;
  position:relative;
  z-index: 1;
}

</style>
</head>
<body>
	<% session.setAttribute("idCheck", ""); %>
	<!-- Navigation -->
	<jsp:include page="main_nav.jsp"></jsp:include>

 	<!-- Page Content -->
    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br>
    <!-- 뒤에 움직이는 배경 -->
	<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
		
      <div class="carousel-inner" role="listbox" id="bg">
        <div class="carousel-item active">
          <img class="d-block img-fluid" src="img/pumpkins-g096f92a5c_1920.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
          <img class="d-block img-fluid" src="img/fruit-g03f181d9c_1920.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img class="d-block img-fluid" src="img/wood-gf50c36611_1920.jpg" alt="Third slide">
        </div>
      </div>
      <!-- <img class="d-block img-fluid" src="img/main-txt.png" id="bg1" style="position: fixed; z-index:2"> -->
        <ol class="carousel-indicators" style="position: fixed; z-index:2">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <br><br><br><br><br><br><br><br><br><br>
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
      </div><!-- 뒤에 움직이는 배경 꿑 -->
    
      
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


    <!-- 아래 이미지박스 시작 -->
    <div class="roww">
    
	    <div class="box-area">
	    
		    <div class="left">
	        	<div class="img-mini">
	        	<!-- <a href="login.jsp" target="leftimg1"> -->
	        	<a href="productAll.jsp">
	            	<img class="img-mini" src="img/breakfast-4234067_1920_page-0001.jpg">
	            </a>
	            <!-- </a> -->
	            	<div class="img-mini img-text">
	            		<h3 class="left img-texth">상품리스트</h3><br>
	            		<p class="left img-textp"> 전체 상품 리스트 <br> 보러가기 </p><br><br><br><br>
	            	</div>
	            </div>
	        </div>
			<div class="right">
				<div class="img-mini">
					<a href="Board/boardList.jsp">
	            		<img class="img-mini" src="img/desktop-3820634_1920.jpg" id="rightimg1">
	            	</a>
	            	<div class="img-mini img-text">
	            		<h3 class="right img-texth"> 고객 센터 </h3><br>
	            		<p class="right img-textp">  <br>  </p><br><br><br><br>
	            	</div>
	       		</div>
			</div>
		</div> <!-- box-area end -->
	
		<div class="box-area">
	    
		    <div class="left">
	        	<div class="img-mini">
	        		<a href="monthFruit.jsp" >
	            		<img class="img-mini" src="img/background-3414801_1920.jpg" id="leftimg2">
	            	</a>
	            	<div class="img-mini img-text">
	            		<h3 class="left img-texth">월별 제철과일</h3><br>
	            		<p class="left img-textp"></p><br><br><br><br>
	            	</div>
	            </div>
	        </div>
			<div class="right">
				<div class="img-mini">
					<a href="CustomerService/csboardAllList.jsp">
	            		<img class="img-mini" src="img/white-1714170_1920.jpg" id="rightimg2">
	            	</a>
	            	<div class="img-mini img-text">
	            		<h3 class="right img-texth"> 게시판 </h3><br>
	            		<p class="right img-textp">실제 구매자들의 <br> 후기보러가기</p><br><br><br><br>
	            	</div>
	       		</div>
			</div>
			
		</div> <!-- box-area end -->
		
		
	
	    <div class="box-area">
	    
		    <div class="left">
	        	<div class="img-mini">
	        	<a href="kakaomap.jsp">
	            	<img class="img-mini" src="img/laptop-3076957_1920.jpg" style="opacity:0.5s">
	            </a>
	            	<div class="img-mini img-text">
	            		<h3 class="left img-texth">오는길</h3><br>
	            		<p class="left img-textp"> 일로오세요 <br> 어서요 </p><br><br><br><br>
	            	</div>
	            </div>
	        </div>
			<div class="right">
				<div class="img-mini">
	            	<img class="img-mini" src="img/breakfast-1804457_1920_page-0001.jpg">
	            	<div class="img-mini img-text">
	            		<h3 class="right img-texth"> 롤모델 </h3><br>
	            		<p class="right img-textp"> 이순신, 세종대왕, 류성룡, 서영준 </p><br><br><br><br>
	            	</div>
	       		</div>
			</div>
		</div> <!-- box-area end -->
	
	</div> <!-- roww end -->
	<!-- 아래 이미지박스 end -->
	
	<!-- Footer -->
	<div class="box-area">
		<jsp:include page="main_footer.jsp"></jsp:include>
	</div>

</body>
</html>























