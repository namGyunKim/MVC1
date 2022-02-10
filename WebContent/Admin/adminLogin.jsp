<%@page import="telinfoVO.AdminVO"%>
<%@page import="telinfoDAO.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style type="text/css">
	body {
		background-color: #fff;
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
table.type09 {
  border-collapse: collapse;
  text-align: center;
  line-height: 1.5;

}
table.type09 thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color:black;
  border-bottom: 3px solid #0B6121;
}
table.type09 tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
table.type09 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}


</style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script>
 	
    
    //로그아웃 버튼 숨김
    $(function(){
    	var uId = '<%=(String)session.getAttribute("adminId")%>';
    	var idCheck = '<%=(String)session.getAttribute("adminIdCheck")%>';
    	var pwCheck = '<%=(String)session.getAttribute("adminPwCheck")%>';
    	
    	$("#logOutForm").css("display","none");
    	/* $('#userId').val(uId); */
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
<body>
	
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String thisAdminId=(String)session.getAttribute("adminId");
AdminDAO ad=new AdminDAO();
AdminVO av= ad.getIdInfoLevel(thisAdminId);
%>
<div class="container1">
		<p class="title">관리자 계정</p>
		<div class="form-area">

   <!-- ID, PWD -->
   <form id ="loginForm" action="adminLoginProcess.jsp" method="post">
    
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
    
<form id="logOutForm" action="adminlogoutProcess.jsp">
    
    <input type="submit" value ="로그아웃" class="btn-type-01">
    </form>
 </div>
 </div>
 
 <br><br><br>

<center>
 <table class="type09">
 <thead><tr><th scope="cols">
<%
if(ad.idCheck(thisAdminId)) {
	%>
	<% 
	out.println(av.getAdminLevel()+"레벨 계정입니다");
	//마스터계정이면
	if(av.getAdminLevel()==10){%></th></tr></thead> 
		<a href="adminJoin.jsp">관리자 계정 등록</a> 
	<% }//10레벨-end
	
	if(av.getAdminLevel()>=1){%>
	<tbody>
	<tr><td>
	<a href="../fruit/furitJoin.jsp">상품 등록</a></td></tr>
	<tr><td>
	<a href="../Board/boardAllList.jsp">전 게시판 목록</a></td></tr>
<% }//1레벨이상-end
	if(av.getAdminLevel()>=2){%>
	<tr><td>
	<a href="../fruit/fruitAllGet.jsp">과일정보 보기</a>
	</td></tr>
	<tr><td>
	<a href="../fruit/fruitManager.jsp">과일정보 수정및 삭제</a>
	</td></tr>
	<% }//2레벨이상-end
	if(av.getAdminLevel()>=3){%>
	<tr><td>
	<a href="../managerAllView.jsp">회원목록 보기</a>
	</td></tr>
	<% }//3레벨이상-end
}//로그인시-end%>
    </tbody>
   </table>
   </center>
    
</body>
</html>