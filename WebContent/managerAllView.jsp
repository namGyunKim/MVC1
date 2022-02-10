<%@page import="telinfoVO.TelInfoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원전체명단</title>
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
  margin: auto;
  width: 60%;
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
</style>
</head>

<body>




<%
request.setCharacterEncoding("UTF-8");
//객체 생성
TelInfoDAO tidao = new TelInfoDAO();
ArrayList<TelInfoVO> tiArray =tidao.getAllInfo();

%>
<br>
<div class="container">
		<p class="title">고객 전체 명단</p>

		<div class="form-area">
			<!-- 고객정보 -->
<table class="type11">
	<tr>
		<th scope="cols">닉네임</th><th scope="cols">아이디</th><th scope="cols">비밀번호</th><th scope="cols">이름</th><th scope="cols">전화번호</th><th scope="cols">주소</th>
	</tr>

<%
for(TelInfoVO imsi : tiArray){ %>
<tr>
<td> <%=imsi.getMemNickName() %></td>
<td> <%=imsi.getMemId() %></td>
<td> <%=imsi.getMemPw() %></td>
<td> <%=imsi.getMemName() %></td>
<td> <%=imsi.getMemTel() %></td>
<td> <%=imsi.getMemAddress() %></td>
<%} %>
</tr>
</table>
</div>
</div>

</body>
</html>