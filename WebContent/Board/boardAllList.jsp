<%@page import="telinfoVO.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="telinfoDAO.BoardDAO"%>
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
</style>

<meta charset="UTF-8">
<title>게시판 리스트</title>
</head>
<body>
<br>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String thisId=(String)session.getAttribute("sId");
BoardDAO board=new BoardDAO();
ArrayList<BoardVO> boardArray=board.getAllBoard();
%>

<div class="container">
		<p class="title">전체 문의사항 </p>
		삭제하려면 글번호 수정하려면 글 제목을 클릭해주세요

		<div class="form-area">
			<!-- 과일정보입력 -->
			<table class="type11">
<!-- 게시판 목록  -->
	<tr>
		<th scope="cols">No</th><th scope="cols">제목</th><th scope="cols">작성자</th><th scope="cols">작성일</th><th scope="cols">내용</th>
	</tr>
          

<%
for(BoardVO imsi: boardArray){ %>
<tr>
	<td><%=imsi.getBoardNumber() %></td>
	<td><%=imsi.getBoardTitle() %></td>
	<td> <%=imsi.getBoardName() %></td>
	<td><%=imsi.getBoardWriteDay() %></td>
	<td><%=imsi.getBoardContents() %></td>
<%} %>
			</tr>
		</table>
	<br>
<br>
<!-- 게시판 페이징 영역 -->
<ul>
            <li>
                <div id="divPaging">
                    <div>◀</div>
                       <div><b>1</b></div>
                    <div>2</div>
                    <div>3</div>
                    <div>4</div>
                    <div>5</div>
                    <div>▶</div>
                </div>
            </li>
       </ul>
       
       
      <br>
      <br>
      <br>
       
    </div>    

</div>
<center>

<h3><a href="../Admin/adminLogin.jsp">관리자 로그인 화면으로 이동</a></h3>
</center>
</body>
</html>