<%@page import="telinfoVO.AdminVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="telinfoDAO.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 등록</title>
<style type="text/css">
	body {
		background-color: #fff;
    	margin: 0;
	}
	table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
}
table.type11 th {
  width: 155px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #0B6121 ;
}
table.type11 td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
p.title {
		text-align: center;
		font-size: 40px;
		font-weight: bold;
		letter-spacing: -6px;
		color:#0B6121;
	}
div.container {
		margin: 0 auto 0;
    	width: 600px;
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
	
.input2 {
  width: 200px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}	

.btn-type-02 {
		display: inline-block;
		width: 120px;
		font-size: 15px;
		font-weight: bold;
		height: 30px;
		/* line-height: 55px; */
		text-decoration: none;
		border-radius: 0;
		background-color: #0B6121;
		color: #FFF;
	}
</style>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

AdminDAO ad = new AdminDAO();
ArrayList<AdminVO> adArray=ad.getAllInfo();
%>
<p class="title">관리자 권한</p>
<center>
	<table class="type11">
		<th>등급</th><th>권한</th>
		<tr><td>1</td><td><pre>상품등록+전게시판 목록</pre></td>
		<tr><td>2</td><td><pre>1레벨+과일정보 보기 + 과일정보 수정 및 삭제</pre></td>
		<tr><td>3</td><td><pre>2레벨+회원목록 보기</pre></td>
		<tr><td>10</td><td><pre>마스터권한</pre></td>
	</table>
</center>

<div class="container">
	<div class="form-area">
			<!-- 관리자 정보입력 -->
		<table class="type11">
			<tr>
				<th scope="cols">아이디</th><th scope="cols">비밀번호</th><th scope="cols">등급</th>
			</tr>
<%
for(AdminVO imsi: adArray){%>
<tr>
<td> <%=imsi.getAdminId() %></td>
<td> <%=imsi.getAdminPw() %></td>
<td> <%=imsi.getAdminLevel() %></td>
<%} %>
</tr>
</table>
</div>
</div>
<br>

<div class="container">
		<p class="title">관리자 등록하기 </p>
		<div class="form-area">
			<!-- 과일정보입력 -->
			<form action="adminJoinInsertProcess.jsp" method="post">
			<table>
				<tr>
					<td>
						<span>
							아이디<input type="text" id="joinId" name="joinId" class="input-text" placeholder="10글자 이하"  maxlength="10" onfocusout="validateId()">
						</span>
						<div id="id_alert" class="alert">필수로 입력해야 합니다.</div>
					</td>
				</tr>

				<tr>
					<td>
						<span>
							비밀번호<input type="password" id="joinPw" name="joinPw" class="input-text" placeholder="4글자 이상 10글자 이하로 입력"  maxlength="10" onfocusout="validatePassword()">
						</span>
						<div id="password_alert" class="alert">필수로 입력해야 합니다.</div>
					</td>
				</tr>

				<tr>
					<td>
						<span>
							관리자등급<input type="text" id="joinLevel" name="joinLevel" class="input-text" placeholder="표 1~10 참고"  maxlength="10" onfocusout="validateLevel()">
						</span>
						<div id="level_alert" class="alert">필수로 입력해야 합니다.</div>
					</td>
				</tr>
			</table>	
				<br>
				<br>

		<input type="submit" value="관리자 등록" class="btn-type-01">
		</form>
		<br>
		
<form action="adminLogin.jsp">
<input type="submit" value="로그인 페이지로 이동" class="btn-type-01">
</form>

<br> <br>

<p class="title">관리자 삭제하기 </p>
<form action="adminDeleteProcess.jsp">
<input type="text" name="adminUser" class=input2 placeholder="마스터계정은 삭제안됨"><input type="submit" value="관리자 삭제" class="btn-type-02">
</form>


</body>


<script type="text/javascript">
	
function validateId() {
	var id = document.getElementById('joinId').value.trim();
	var alertEl = document.getElementById('id_alert');
	
	// 입력 여부 검증
	if (id.length == 0) {
		alertEl.innerHTML = '필수 정보입니다.';
		alertEl.style.display = 'block';
		
		return false;
	}
	
	// 길이 검증
	if (id.length>=10) {
		alertEl.innerHTML = '아이디는 10글자 이하로 입력해주세요.';
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
	var password = document.getElementById('joinPw').value.trim();
	
	var alertEl = document.getElementById('password_alert');
	
	
	// 비밀번호 입력 여부 검증
	if (password.length == 0) {
		alertEl.innerHTML = '필수 정보입니다.';
		alertEl.style.display = 'block';
		
		return false;
	}
	if (password.length < 4) {
		alertEl.innerHTML = '비밀번호는 4글자 이상 입력해주세요.';
		alertEl.style.display = 'block';
		
		return false;
	}
	if (password.length >= 10) {
		alertEl.innerHTML = '비밀번호는 10글자 이하로 입력해주세요.';
		alertEl.style.display = 'block';
		
		return false;
	}
}


function validateLevel() {
	var level = document.getElementById('joinLevel').value.trim();
	var alertEl = document.getElementById('level_alert');
	
	// 입력 여부 검증
	if (level.length == 0) {
		alertEl.innerHTML = '필수 정보입니다.';
		alertEl.style.display = 'block';
		
		return false;
	}
}
</script>		


</html>