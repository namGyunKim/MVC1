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
<title>kakao map</title>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3480aad82ddee570ca21fc7b904de9bd"?></script>
<script>
        window.onload = function() {
                var joongang1 = new daum.maps.LatLng(37.571002, 126.992526);
                var marker = new daum.maps.Marker({ position: joongang1 });
                var mapDesign1 = { zoom:15, center: joongang1, mapTypeId: daum.maps.MapTypeId.ROADMAP};
                var map = new daum.maps.Map(document.getElementById("jido1"), mapDesign1);
                marker.setMap(map)
        }
</script>

<style type="text/css">
	body {
		background-color: #f5f6f7;
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
</style>

</head>
<body>
<br>
<div class="container1">
	<p class="title">오는길</p>
	<!-- Navigation -->
	<jsp:include page="main_nav.jsp"></jsp:include>
	
        <div  id="jido1" style="width:600px; height:600px">
                here is he map<br>
                no https no kakaomap<br>
                need domain<br>
        </div>
</div>        
    <!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>