<%@page import="telinfoVO.FruitVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="telinfoDAO.fruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><!-- <!-- Bootstrap core CSS -->
<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>과일 매니저</title>
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
	.btn-type-02 {
		display: inline-block;
		width: 50px;
		font-size: 15px;
		font-weight: bold;
		height: 30px;
		/* line-height: 55px; */
		text-decoration: none;
		border-radius: 0;
		background-color: #0B6121;
		color: #FFF;
	}
	input {
  width: 200px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
</style>
<!-- Navigation -->
	<jsp:include page="../nav.jsp"></jsp:include>
</head>
<body>
<br>
<%
request.setCharacterEncoding("UTF-8");
//객체 생성
fruitDAO fr = new fruitDAO();
ArrayList<FruitVO> frArray=fr.getAllFruit();

%>



<!-- 삭제시 삭제된 식품코드 뜨게함 -->
<%
String thisFruitDelete=(String)session.getAttribute("sFruitDelete");
thisFruitDelete+="코드";
//식품코드제거세션이 살아있으면
	if(fr.fruitDeleteCheck(thisFruitDelete))
	out.println(thisFruitDelete+"의 과일이 삭제되었습니다."); 
	session.setAttribute("sFruitDelete", "null");
	
	%>

<!-- 수정시 수정한 식품코드 뜨게함 -->
<%
String thisFruitChange=(String)session.getAttribute("sFruitChange");
thisFruitChange+="코드";
String thisChangeOk=(String)session.getAttribute("sChangeOk");
thisChangeOk+="코드";
String thisChangeOkCode=(String)session.getAttribute("sChangeCode");
//식품코드제거세션이 살아있으면
	if(fr.fruitDeleteCheck(thisFruitChange))
	out.println(thisFruitChange+"의 과일이 수정되었습니다."); 
	

session.setAttribute("sFruitChange", "null");
	
 	
 	  if(fr.fruitChangeOk(thisChangeOk)){
		out.println(thisChangeOkCode+"는 존재하지 않습니다");
		 session.setAttribute("sChangeOk", "없다"); 
	}   
	%>

<!-- 전체 과일목록 출력 -->
<div class="container">
		<p class="title">전체과일목록</p>

		<div class="form-area">
			<!-- 과일정보입력 -->
<table class="type11">
	<tr>
		<th scope="cols">식품코드</th><th scope="cols">식품명</th><th scope="cols">생산연도</th><th scope="cols">제조사</th><th scope="cols">가격</th><th scope="cols">상품명</th><th scope="cols">재고수량</th><th scope="cols">이미지 이름</th>
	</tr>
<%
for(FruitVO imsi : frArray){ %>
	<tr>
		<td> <%=imsi.getFruitCode() %></td>
		<td> <%=imsi.getFruitName() %></td>
		<td> <%=imsi.getProductYear() %></td>
		<td> <%=imsi.getFruitMaker() %></td>
		<td> <%=imsi.getFruitPrice() %></td>
		<td> <%=imsi.getGoodsName() %></td>
		<td> <%=imsi.getFruitCount() %></td>
		<td> <%=imsi.getFruitImg() %></td>
<%} %>
	</tr>
</table>
</div>
</div>

<center>
	<form action="fruitDeleteProcess.jsp">
	<input type="text" name="fruitDelete"  placeholder="삭제 할 식품코드 입력"> <input type="submit" value="삭제" class="btn-type-02">
	</form>

 <br>
		<form action="fruitChangeGo.jsp">
	<input type="text" name="fruitChange"  placeholder="수정 할 식품코드 입력"> <input type="submit" value="수정" class="btn-type-02">
		</form>
</center>

<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>