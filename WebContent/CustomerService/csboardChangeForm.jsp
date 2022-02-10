<%@page import="telinfoDAO.CustomerServiceDAO"%>
<%@page import="telinfoVO.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>게시판 수정</title>

<style type="text/css">
	body {
		background-color: #fff;
    	margin: 0;
	}
	div.container {
		margin: auto;
    	/* width: 600px; */
	}
	p.title {
		text-align: center;
		font-size: 40px;
		font-weight: bold;
		letter-spacing: -6px;
		color:#0B6121;
	}
	
	.form-area table {
		margin: auto;
		background-color: #FFF;
    	border: 1px solid #dadada;
		margin-bottom: 15px;
		border-collapse: collapse;
		width: 1000px;
		height:1000px;
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
	.input-boardarea {
		 border: none;
		height: 500px;
		padding: 2px 0px;
		width: 100%;
		font-size: 14px;
		 
	}
	.input-boardarea2 {
		 border: none;
		height: 30px;
		width:180px;
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
		width: 50%;
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
	td.title_text{
	font-weight: bold;
	font-size: 20px;
		letter-spacing: -6px;
	}
	a:link {color: black;}
	a:visited{color:black;}
	a:hover {color:#0B6121; }
	a:active{color: #0B6121;}
	a{text-decoration: none;}
	
</style>

</head>
<body>
<br>
	<!-- Navigation -->
	<jsp:include page="../nav.jsp"></jsp:include>
<%
String thisNumber=request.getParameter("boardNumber");
session.setAttribute("sBoardNumber", thisNumber);
CustomerServiceDAO cs = new CustomerServiceDAO();
BoardVO boardV=cs.getNumberInfo(thisNumber);
%>


<!-- 스크롤바 왜인지 안됨 -->
<%-- <form action="boardChangeProcess.jsp">
<input type="text" placeholder="글제목" name="changeTitle" value=<%=boardV.getBoardTitle() %>><br>
<textarea rows="1" cols="100" name="changeTitle"><%=boardV.getBoardTitle() %></textarea><br>
<textarea rows="50" cols="100" name="changeContents"><%=boardV.getBoardContents() %></textarea>
<input type="text" placeholder="글내용" name="changeContents" value=<%=boardV.getBoardContents() %> style="width:800px;height:300px;font-size:15px;overflow-y:scroll;"><br>
<input type="submit" value="수정 완료">
</form>
<h3><a href="../login.jsp">로그인 화면으로 이동</a></h3>
<h3><a href="boardList.jsp">게시판 목록으로 이동</a></h3>
 --%>
<div class="container">
		<p class="title"> 수정사항을 작성해주세요</p>
		<div class="form-area">
		<br>
		<br>
		<br>
		<br>
		
		
	<form action="csboardChangeProcess.jsp" > 
			<table >
			<tr>
      <td>&nbsp;</td>
      <td  class="title-text">제목</td>

      <td><textarea name="changeTitle" id="changeTitle" placeholder="글제목"  class="input-boardarea2"  ><%=boardV.getBoardTitle() %></textarea></td>
      <td>&nbsp;</td>
     </tr>
  <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr> 
				
	
	 <tr>
      <td>&nbsp;</td>
      <td  class="title-text">문의사항</td>
      <td><textarea name="changeContents" id="changeContents" placeholder="내용을 입력하세요."  class="input-boardarea"  ><%=boardV.getBoardContents() %></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
      <tr align="center">
      <td>&nbsp;</td>
    	
		<td colspan="2">
		<input type="submit" value="글쓰기 등록" class="btn-type-01"> <br/> <br/>
    
      <td>&nbsp;</td>
				
			</table>
			</form>
		</div>
	</div>
			
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   	<br>	



	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>