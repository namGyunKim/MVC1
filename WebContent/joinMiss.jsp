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
<title>회원가입</title>
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
<!-- Navigation -->
	<jsp:include page="main_nav.jsp"></jsp:include>
	
<body>
<br>
<script type="text/javascript">
alert('비밀번호를 다시 입력하세요');
</script>
<form action="JoinInsertProcess.jsp" method="post">

<div class="container1">
		<p class="title">회원가입</p>
		<div class="form-area">
			<!-- ID, PWD -->
			<form action="JoinInsertProcess.jsp" method="post">
			<table>
					<tr>
					<td>
						<span>
							<input type="text" id="nickname" name="joinNickName" class="input-text" placeholder="닉네임을 입력하세요" maxlength="10 ">
						</span>
						<div id="id_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="text" id="id" name="joinId" class="input-text" placeholder="아이디를 입력해주세요" maxlength="10" onfocusout="validateId()">
							
						</span>
						<div id="id_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				</table>
				<!-- <button type="button" class="btn btn-primary btn-sm" id="_btnGetId" name="confirm_id" onclick="confirmId(this.form);">아이디확인</button> -->
						<div id="_rgetid"></div>
				<table>	
				<tr>
					<td>
						<span>
							<input type="password" id="password"  name="joinPw" class="input-text" placeholder="비밀번호를 입력해주세요" maxlength="10" onfocusout="validatePassword()">
						</span>
						<div id="password_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="password" id="check_password"  name="joinPwCheck"class="input-text" placeholder="비밀번호 재확인" maxlength="20" onfocusout="validatePassword()">
						</span>
						<div id="check_password_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="text" id="name"  name="joinName"class="input-text" placeholder="이름을 입력해주세요" >
						</span>
						<div id="name_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="text" id="tel"  name="joinTel"class="input-text" placeholder="전화번호를 입력하시오 예시 : 010-1111-2222" >
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="text" id="address"  name="joinAddress"class="input-text" placeholder="주소를 입력해주세요" >
						</span>
					</td>
				</tr>
			</table>
			<br>
			  <p><h6>이용약관</h6></p>
			      <label><input type="checkbox" name="agree1" value="agree1" required> (필수) 이용약관과 개인정보 수집 및 이용에 동의합니다.</label>
			      <br>
			      <label><input type="checkbox" name="agree2" value="agree2" required> (필수) 만 14세 이상입니다.</label>
			<br>
			<br>
			 <input type="submit" value="회원가입" class="btn-type-01">
</form>
</div>
</div>
</form>

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>


</body>
<script type="text/javascript">
	
	function validateId() {
		var id = document.getElementById('id').value.trim();
		var alertEl = document.getElementById('id_alert');
		
		// 입력 여부 검증
		if (id.length == 0) {
			alertEl.innerHTML = '필수 정보입니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		// 길이 검증
		if (id.length < 5) {
			alertEl.innerHTML = '아이디는 5글자 이상 입력해주세요.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		// 대소문자, 숫자 입력 검증
		if (!/^[A-Za-z0-9]*$/.test(id)) {
			alertEl.innerHTML = '아이디는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		alertEl.style.display = 'none';
	}
	
	function validatePassword() {
		var password = document.getElementById('password').value.trim();
		var cPassword = document.getElementById('check_password').value.trim();
		var alertEl = document.getElementById('password_alert');
		var cAlertEl = document.getElementById('check_password_alert');
		
		// 비밀번호 입력 여부 검증
		if (password.length == 0) {
			alertEl.innerHTML = '필수 정보입니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		// 비밀번호 길이 검증
		if (password.length < 5) {
			alertEl.innerHTML = '비밀번호는 4글자 이상 입력해주세요.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		// 비밀번호 대소문자, 숫자 입력 검증
		if (!/^[A-Za-z0-9!?#$%]*$/.test(password)) {
			alertEl.innerHTML = '비밀번호는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		// 비밀번호 확인 입력 여부 검증
		if (cPassword.length == 0) {
			cAlertEl.innerHTML = '필수 정보입니다.';
			cAlertEl.style.display = 'block';
			
			return false;
		}
		
		// 비밀번호 확인 길이 검증
		if (cPassword.length < 5) {
			cAlertEl.innerHTML = '비밀번호는 4글자 이상 입력해주세요.';
			cAlertEl.style.display = 'block';
			
			return false;
		}
		
		// 비밀번호 확인 대소문자, 숫자 입력 검증
		if (!/^[A-Za-z0-9]*$/.test(cPassword)) {
			cAlertEl.innerHTML = '비밀번호는 영문 대문자,소문자, 숫자만 입력 가능합니다.';
			cAlertEl.style.display = 'block';
			
			return false;
		}
		
		// 비밀번호, 비밀번호 확인 검증
		if (password != cPassword) {
			cAlertEl.innerHTML = '비밀번호가 일치하지 않습니다.';
			cAlertEl.style.display = 'block';
			
			return false;
		}
		
		alertEl.style.display = 'none';
		cAlertEl.style.display = 'none';
	}
	
	function validateName() {
		var name = document.getElementById('name').value.trim();
		var alertEl = document.getElementById('name_alert');
		
		// 입력 여부 검증
		if (name.length == 0) {
			alertEl.innerHTML = '필수 정보입니다.';
			alertEl.style.display = 'block';
			
			return false;
		}
		
		alertEl.style.display = 'none';
	}
	
	</script>
</html>


