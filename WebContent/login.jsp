<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <!-- Bootstrap core CSS -->
<link href="vendor/css/shop-homepage.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>로그인</title>
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


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인창</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
 	
    
    //로그아웃 버튼 숨김
    $(function(){
    	var uId = '<%=(String)session.getAttribute("sId")%>';
    	var idCheck = '<%=(String)session.getAttribute("idCheck")%>';
    	var pwCheck = '<%=(String)session.getAttribute("pwCheck")%>';
    	
    	$("#logOutForm").css("display","none");
    	$("#MainForm").css("display","none");
    	$("#CustomerChangeForm").css("display","none");
    	
    	$('#userId').val('');
		$('#userPw').val('');
		
		//null이면 로그인창뜨게
		if (uId =="null") {
			$('#loginForm').show();
			$('#logOutForm').hide();
		}
		else {
			$('#loginForm').hide();
			$('#logOutForm').show();
			$("#MainForm").show();
			$("#CustomerChangeForm").show()
		}
		
		if (idCheck=="ok") {
			alert("아이디가 존재하지않습니다.");
		}
		else if (pwCheck=="ok") {
			alert("비밀번호가 틀렸습니다.");
		}
		
    });
    	        
    </script>
</head>
	<!-- Navigation -->
	<jsp:include page="main_nav.jsp"></jsp:include>
<body>
	<br>
	<div class="container1">
		<p class="title">로그인</p>
		<div class="form-area">
    
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    %>
    
      <!-- ID, PWD -->
    <form id ="loginForm" action="loginProcess.jsp" method="post">
    
    <table>
					<tr>
					<td>
						<span>
							아이디<input type="text" id="userId" name="userId" class="input-text" placeholder="아이디를 입력하세요" maxlength="10 "onfocusout="validateId()">
						</span>
						<div id="id_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							비밀번호<input  type="password" id="userPw" name="userPw" class="input-text" placeholder="비밀번호를 입력해주세요" maxlength="10" onfocusout="validatePassword()" >					
						</span>
						<div id="password_alert" class="alert">필수 정보입니다.</div>
					</td>
				</tr>
				</table>
   			  <input type="submit" value="로그인" class="btn-type-01">
    			<br /> <br />
    </form>
    
    
    <form id="logOutForm" action="logoutProcess.jsp">
    
    </form>
    <br /> <br />
    <form id="CustomerChangeForm" action="customerChange.jsp">
	</form>
     <form id="MainForm" action="main.jsp">
    
     <br /> <br />
    </form>
    
   	</div>
	</div >
		<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	 
</body>

<script type="text/javascript">
function validateId() {
	var id = document.getElementById('userId').value.trim();
	var alertEl = document.getElementById('id_alert');
	
	// 입력 여부 검증
	if (id.length == 0) {
		alertEl.innerHTML = '필수 정보입니다.';
		alertEl.style.display = 'block';
		
		return false;
	}
}

function validatePassword() {
	var password = document.getElementById('userPw').value.trim();
	var alertEl = document.getElementById('password_alert');
	
	// 비밀번호 입력 여부 검증
	if (password.length == 0) {
		alertEl.innerHTML = '필수 정보입니다.';
		alertEl.style.display = 'block';
		
		return false;
	}
	
}
</script>	

</html>