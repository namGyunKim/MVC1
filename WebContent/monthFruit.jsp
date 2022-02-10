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
<title>Month Fruit</title>

<style type="text/css">
body {
  background-color: #f5f6f7;
  margin: 0;
}
div.container1 {
  margin: 0 auto 0;
  width: 600px;
}
div.text-md {
  display: table-cell; 
  vertical-align: middle;
  height: 160px;
}
p.title {
	text-align: center;
	font-size: 40px;
	font-weight: bold;
	letter-spacing: -6px;
	color: #0B6121;
}
p.title1 {

	text-align: left;
	font-size: 18px;
	font-weight: bold;
	/* font-weight: bold; */
	/* letter-spacing: -6px; */
	color: #0B6121;
	line-height: 35px;
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
.box-area-a {
  width: 600px;
  height: 160px;
}
.box-area-aa {
  width: 160px;
  height: 160px;
  float: left;
}
.box-area-aaa {
  width: 430px;
  height: 160px;
  float: right;
  vertical-align: middle;
  border-bottom: 1px solid #0B6121;
}

.img-f {
  top: 5px;
  width: 158px;
  height: 158px;
}
</style>

</head>
<body>
<br>
	<!-- Navigation -->
	<jsp:include page="main_nav.jsp"></jsp:include>
	
<div class="container1">
	<p class="title">제철과일</p>
	<div class="box-area-a">
		<div class="box-area-aa">
			<img class="img-f" src="img/spring.jpg">
		</div>
		<div class="box-area-aaa">
			<div class="text-md">
				<p class="title1">3월 : 딸기 <br>
				4월 : 딸기<br>
				5월 : 매실 오디</p>
			</div>
		</div>
	</div>
	<div class="box-area-a">
		<div class="box-area-aa">
			<img class="img-f" src="img/summer.jpg">
		</div>
		<div class="box-area-aaa">
			<div class="text-md">
				<p class="title1">6월 : 매실 오디 참외 복숭아<br>
				7월 : 참외 토마토 수박 복숭아 포도 자두<br>
				8월 : 참외 토마토 수박 복숭아 포도 자두</p>
			</div>
		</div>
	</div>
	<div class="box-area-a">
		<div class="box-area-aa">
			<img class="img-f" src="img/fall.jpg">
		</div>
		<div class="box-area-aaa">
			<div class="text-md">
				<p class="title1">9월 : 석류 배 감<br>
				10월 : 석류 배 사과 감 귤 <br>
				11월 : 석류 배 사과 감 귤 한라봉 유자</p>
			</div>
		</div>
	</div>
	<div class="box-area-a">
		<div class="box-area-aa">
			<img class="img-f" src="img/winter.jpg">
		</div>
			<div class="box-area-aaa">
				<div class="text-md">
				<p class="title1">12월 : 딸기 석류 사과 한라봉 유자 <br>
				1월 : 딸기 귤 레몬<br>
				2월 : 딸기 귤 레몬</p>
			</div>
		</div>
	</div>



</div>        
    <!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>