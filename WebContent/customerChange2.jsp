<%@page import="java.util.ArrayList"%>
<%@page import="telinfoVO.TelInfoVO"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><html>
<head><!-- <!-- Bootstrap core CSS -->
<link href="vendor/css/shop-homepage.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>정보수정</title>
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


<!-- Navigation -->
	<jsp:include page="main_nav.jsp"></jsp:include>
<meta charset="UTF-8">

</head>
<body>
<br>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
//객체생성
TelInfoDAO tidao = new TelInfoDAO();

String thisId=(String)session.getAttribute("sId");

 TelInfoVO customInfo =tidao.getIdInfo(thisId);

 

 //String nnn=customInfo.getMemNickName()

%>

<script type="text/javascript">
function real() {
	var link = 'customerDeleteProcess.jsp';
	if (!confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
        alert("회원탈퇴 취소");
    } else {
    
    	window.open('customerDeleteProcess.jsp');

    }
}
</script>




<!-- 중복체크는 alter로 띄울까 -->


</form>



	<div class="container1">
		<p class="title">정보수정</p>
		<div class="form-area">
		
			<!-- ID, PWD -->
		<form action="changeCustomerProcess.jsp" method="post" id="changeForm" >
			<table>
					<tr>
					<td>
						<span>
							<input type="text" id="joinnickname" name="joinNickName" class="input-text" placeholder="닉네임을 입력하세요" maxlength="10 "
							value=<%=customInfo.getMemNickName() %>>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="password" id="joinPw"  name="joinPw" class="input-text" placeholder="4-10글자 비밀번호를 입력해주세요" maxlength="10" onfocusout="validatePassword()">
						</span>
						<div id="password_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="password" id="joinPwCheck"  name="joinPwCheck"class="input-text" placeholder="비밀번호 재확인" maxlength="10" onfocusout="validatePassword()">
						</span>
						<div id="check_password_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="text" id="name"  name="joinName"class="input-text" placeholder="이름을 입력해주세요" 
							        value=<%=customInfo.getMemName() %> >
						</span>
				
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="text" id="tel"  name="joinTel"class="input-text" placeholder="전화번호를 입력하시오 예시 : 010-1111-2222"
							value=<%=customInfo.getMemTel() %> >
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<input type="text" id="address"  name="joinAddress"class="input-text" placeholder="주소를 입력해주세요" 
							value=<%=customInfo.getMemAddress() %>>
						</span>
					</td>
				</tr>
			</table>
            <input type="submit" value="정보수정완료" class="btn-type-01"> 
             </form>
            </br> </br>
          
             <input type="button" onclick="real()" value="회원탈퇴" class="btn-type-01">
	
	</div>
	</div>






<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">


function validatePassword() {
	var password = document.getElementById('joinPw').value.trim();
	var cPassword = document.getElementById('joinPwCheck').value.trim();
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

</script>	
</html>