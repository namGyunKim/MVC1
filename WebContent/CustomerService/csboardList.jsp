<%@page import="telinfoDAO.CustomerServiceDAO"%>
<%@page import="telinfoVO.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">


<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
   

    #divPaging > div {
        float:left;
        width: 30px;
        margin: auto;
        text-align:center;
}

  body {
		background-color: #fff;
    	margin: auto;
	}
	table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  /* margin: 20px 10px; */
  margin: auto;
  
}
table.type11 th {
  width: 250px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #0B6121 ;
}
table.type11 td {
  width: 250px;
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
	a:link {color: black;}
	a:visited{color:black;}
	a:hover {color:#0B6121; }
	a:active{color: #0B6121;}
	a{text-decoration: none;}
	



 ul{

    list-style:none;

    list-style-type:none;
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

</style>
</head>
<body>
<br>
	<!-- Navigation -->
	<jsp:include page="../nav.jsp"></jsp:include>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String thisId=(String)session.getAttribute("sId");
CustomerServiceDAO cs = new CustomerServiceDAO();
ArrayList<BoardVO> boardArray=cs.getNameBoard(thisId);
%>

	<div class="container">
		<p class="title">게시판</p>
		

		<div class="form-area">
			<!-- 과일정보입력 -->
			<table class="type11">
<!-- 게시판 목록  -->
	<tr>
		<th scope="cols">No</th><th scope="cols">제목</th><th scope="cols">작성자</th><th scope="cols">작성일</th><th scope="cols">내용</th>
	</tr>
          
<!--게시물 출력  -->

<!-- 식품코드를 값으로 넘김 -->
<%
for(BoardVO imsi: boardArray){ %>
<tr>
<td><a href="csboardDeleteProcess.jsp?boardNumber=<%=imsi.getBoardNumber() %>">
				<%=imsi.getBoardNumber() %></a></td>
<td><a href="csboardChangeForm.jsp?boardNumber=<%=imsi.getBoardNumber() %>">
				<%=imsi.getBoardTitle() %></a></td>

<td> 	<%=imsi.getBoardName() %></td>
<td> 	<%=imsi.getBoardWriteDay() %></td>
<td> 	<%=imsi.getBoardContents() %></td>
<%} %>
</tr>
</table>
<center>
<div align="center">
	<div>
	<ul>
		<li>
			<div id="divPaging" style="display: inline;">
				<p>◀  1 2 3 4 5  ▶ </p>
        	</div>
    	</li>
	</ul>
      
      <br>
      <br>
      <br>
      </div>
</div> 
      <p>삭제하려면 글번호 수정하려면 글 제목을 클릭해주세요</p>
		<a href="../CustomerService/csboardJoin.jsp">
			<input type="submit" value="글쓰기 등록" class="btn-type-01">
		</a><br>
		<a href="../main.jsp">
			<input type="submit" value="메인으로 이동" class="btn-type-01">
		</a>
</center>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>