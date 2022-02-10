<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <!-- Bootstrap core CSS -->
<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>상품등록</title>
<style type="text/css">
	body {
		background-color: #fff;
    	margin: 0;
	}
	div.container {
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
<!-- Navigation -->
	<jsp:include page="../nav.jsp"></jsp:include>
<body>
<br>
<div class="container">
		<p class="title">상품등록</p>
		<div class="form-area">
			<!-- 과일정보입력 -->
			<form action="fruitJoinProcess.jsp" method="post">
			<table>
					<tr>
					<td>
						<span>
							식품코드<input type="text" id="joinCode" name="joinCode" class="input-text" placeholder="예시: R0001"  maxlength="20 " onfocusout="validate_joinCode()">
						</span>
						<div id="code_alert" class="alert">필수로 입력해야 합니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							식품명<input type="text" id="joinFruitName" name="joinFruitName" class="input-text" placeholder="예시: 사과" maxlength="10" >
							
						</span>
					
					</td>
				</tr>
				<tr>
					<td>
						<span>
							제작연도<input type="text" id="joinPYear"  name="joinPYear" class="input-text" placeholder="예시: 2021" maxlength="20" >
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							제조사<input type="text" id="joinMaker"  name="joinMaker"class="input-text" placeholder="예시: (주)샘숭과일" maxlength="20" >
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							가격<input type="text" id="joinPrice"  name="joinPrice"class="input-text" placeholder="예시: 20000" >
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							상품명<input type="text" id="joinGoods"  name="joinGoods"class="input-text" placeholder="예시 : 사과" >
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							재고수량<input type="text" id="joinCount"  name="joinCount"class="input-text" placeholder="예시: 100"  onfocusout=validate_joinCount()>
						</span>
						<div id="count_alert" class="alert">숫자만 입력가능합니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							이미지파일이름<input type="text" id="joinImg"  name="joinImg"class="input-text" placeholder="예시: apple.jpg" >
						</span>
					</td>
				</tr>
			</table>
			<br>
			  <p></p>
      <label><input type="checkbox" name="agree1" value="agree1" required>상품등록 내용이 정확한지 확인해 주세요.</label>

			<br>
			<br>
			
			 <input type="submit" value="과일등록" class="btn-type-01">
			 <br>
			<br>

</form>

<form action="fruitAllGet.jsp"> 
<input type="submit" value="등록된 과일상품 보기" class="btn-type-01">
</form>

 <br>
 
<form action="fruitManager.jsp"> 
<input type="submit" value="상품 수정 ,삭제하기" class="btn-type-01">
</form>

</div>
</div>
	<!-- Footer -->
	<jsp:include page="../main_footer.jsp"></jsp:include>
</body>
<!--유효값 검증  -->
<script type="text/javascript">
	
	function validate_joinCode() {
		var code = document.getElementById('joinCode').value.trim();
		var alertEl = document.getElementById('code_alert');
		
		// 입력 여부 검증
		if (code.length == 0) {
			alertEl.innerHTML = '필수 정보입니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
	}
	
	
	
	function validate_joinCount() {
		var count = document.getElementById('joinCount').value.trim();
		var alertEl = document.getElementById('count_alert');
		
		if (!/^[0-9]*$/.test(count)) {
			alertEl.innerHTML = '재고수량은  숫자만 입력 가능합니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
	}
		
</script>		




</html>