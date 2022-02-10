<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
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
		color:#1fbc02;;
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
		background-color: #1fbc02;
		color: #FFF;
		
	}
</style>

</head>
<!-- Navigation -->
	<jsp:include page="main_nav.jsp"></jsp:include>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<body>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
//객체생성
TelInfoDAO tidao = new TelInfoDAO();

String thisNickName=request.getParameter("joinNickName");
String thisPw=request.getParameter("joinPw");
String thisPwCheck=request.getParameter("joinPwCheck");
String thisName=request.getParameter("joinName");
String thisTel=request.getParameter("joinTel");
String thisAddress=request.getParameter("joinAddress");
String thisId=(String)session.getAttribute("sId");

%>


<%
//비밀번호 입력한 두개가 맞나 체크
if(thisPw.equals(thisPwCheck) &&thisPw.length() >3   ){

	tidao.customDataChange(thisNickName,thisId,thisPw, thisName, thisTel, thisAddress);
	session.setAttribute("sPw", thisPw);
	out.println("정보수정 완료");
	out.println(thisNickName);
	out.println(thisId);
	out.println(thisPw);
	out.println(thisName);
	out.println(thisTel);
	out.println(thisAddress);
}
else{
	
	RequestDispatcher rd1=request.getRequestDispatcher("customerChange2.jsp");
	rd1.forward(request,response);
	session.setAttribute("sPwCheck", "on");

}
%>
<a href="login.jsp">로그인 화면으로 이동</a>


		<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	 
</body>
</html>