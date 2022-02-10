<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><!-- <!-- Bootstrap core CSS -->
<link href="vendor/css/shop-homepage.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>정보수정을 위한 비밀번호 재확인</title>
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

%>

	<div class="container1">
		<p class="title">정보수정</p>
		<div class="form-area">
    
	<form action="pwCheck.jsp">
	  <table>
					<tr>
					<td>
						<span>
							비밀번호확인<input type="password" id="pwCheck" name="pwCheck" class="input-text" placeholder="비밀번호를 입력하세요" maxlength="10 " onfocusout="validatePassword()">
						</span>
						<div id="password_alert" class="alert">비밀번호가 입력되지 않았습니다.</div>
					</td>
				</tr>
	</table>
	<input type="submit" value="확인" class="btn-type-01">

	</form>

		</div>
	</div>
		<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">


function validatePassword() {
	var password = document.getElementById('pwCheck').value.trim();
	var alertEl = document.getElementById('password_alert');
	
	// 비밀번호 입력 여부 검증
	if (password.length == 0) {
		alertEl.innerHTML = '비밀번호가 입력되지 않았습니다.';
		alertEl.style.display = 'block';
		
		return false;
	}
	
}
</script>	
</html>