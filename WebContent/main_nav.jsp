<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

TelInfoDAO tidao = new TelInfoDAO();

String thisId=(String)session.getAttribute("sId");


%>
<% if(tidao.idCheck(thisId)) {%>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-green fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <a href="main.jsp"><img src="img/unknown.png" style="width:50px;height:50px;align:left;">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="main.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logoutProcess.jsp">로그아웃</a>
          </li>
                    <li class="nav-item">
            <a class="nav-link" href="customerChange.jsp">정보수정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Basket/shopping.jsp">장바구니</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<% } else {%>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-green fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
      <a href="main.jsp"><img src="img/unknown.png" style="width:50px;height:50px;align:left;">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="main.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
         
	          <li class="nav-item">
	            <a class="nav-link" href="join.jsp">회원가입</a>
	          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Basket/shopping.jsp">장바구니</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<% } %>