<%@page import="telinfoVO.BasketVO"%>
<%@page import="telinfoDAO.BasketDAO"%>
<%@page import="telinfoVO.FruitVO"%>
<%@page import="telinfoDAO.fruitDAO"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑하기</title>
<!-- <!-- Bootstrap core CSS -->
<link href="../vendor/css/shop-homepage.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../vendor/10-11.css" />

<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../vendor/10-11.js"></script>  
</head>
<style type="text/css">
div.container1 {
  margin: 0 auto 0;
  width: 800px;
}
div.text-md {
  display: table-cell; 
  vertical-align: middle;
}
p.title {
  text-align: center;
  font-size: 40px;
  font-weight: bold;
  letter-spacing: -6px;
  color:#0B6121;
}
span {
  text-align: center;
}
p.title2 {
	text-align: center;
	line-height: 35px;
}
</style>

<body>
<br>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String fruitCode=request.getParameter("fruitCode");

TelInfoDAO tf= new TelInfoDAO();
fruitDAO fr = new fruitDAO();
FruitVO fv= null;
//모든 과일의 정보
ArrayList<FruitVO> frArray=fr.getAllFruit();
String uId=(String)session.getAttribute("sId");

BasketDAO bk = new BasketDAO();
ArrayList<BasketVO> bkArray=bk.getIdBasket(uId);
int cnt=0;
String p_price="";
int sumtotal=0;
%>

<%
//로그인상태가 아니라면
if( !(tf.idCheck(uId))    ){
	response.sendRedirect("shoppingMiss.jsp");
}
%>

	<!-- Navigation -->
	<jsp:include page="../nav.jsp"></jsp:include>

<div class="container1">
	<p class="title">장바구니</p>
    <form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
    
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv text-md">
                        <div class="check">선택</div>
                     <!--    <div class="img">이미지</div>  -->
                        <div class="pcode">식품코드</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
           <%
			for(BasketVO imsi: bkArray){ %>     
			<% fv=fr.getIdInfo(imsi.getFruitCode()); 
				String fruitPrice= Integer.toString(fv.getFruitPrice());
				int total= imsi.getFruitCount() * Integer.parseInt(fruitPrice);
				cnt++;
				sumtotal+=total;
				p_price="p_price";
				p_price=p_price+ Integer.toString(cnt);
				
				%>
           <div class="row data">
                    <div class="subdiv text-md">
                        <div class="check"><p class="title2"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();">&nbsp;</p></div>
                        <!-- <div class="img"><img src="../img/b.jpg" width="60"></div> -->
                        <div class="pcode"><p class="title2"> <%=imsi.getFruitCode() %></p></div>
                        <div class="pname"><p class="title2"><%=imsi.getGoodsName() %></p></div>
                    </div>
                    <div class="subdiv text-md">
                        <div class="basketprice"><p class="title2"><input type="hidden" name=<%=p_price %> id=<%=p_price %> class="p_price" ><%=fruitPrice%></p></div>
                        <div class="num">
                            <div class="updown">
                                <p class="title2">
                                	<input type="hidden" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num"  onkeyup="javascript:basket.changePNum(1);"><%=imsi.getFruitCount() %>
                                </p>
                            </div>
                        </div>
                        	<div class="sum" >
                        		<p class="title2"><input type="hidden" name="price2" id="price2" class="p_price"><%=total%>
                        	</p></div>
                    </div>
                    <div class="subdiv text-md">
                        <div class="basketcmd">
                        <p class="title2">
                        <a href="shoppingDeleteProcess.jsp?fruitCode=<%=imsi.getFruitCode() %>" class="abutton" onclick="javascript:basket.delItem();">삭제</a></p></div>
                    </div>
                </div>             
                
	<%} %>
	</div>
	<br>
	<div class="right-align basketrowcmd">     
			      
                <a href="../Order/orderBasketAllDelete.jsp" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
                <a href="../productAll.jsp" class="abutton" >상품 더 보기</a><br><br>
            
	<div class="basketprice">
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: <%=cnt %>개</div>
            <div class="bigtext right-align  blue summoney" id="sum_p_price">합계금액: <%=sumtotal %>원</div>
	</div>
    </div>
        <!--     <div id="goorder" class="">
                <div class="clear"></div> -->
                <div class="buttongroup center-align cmd">
                    <% session.setAttribute("totalPrice",sumtotal); %>
                    <a href="../Pay/pay.jsp">선택한 상품 주문</a>
           </div>
        </form>
</div>




</body>
</html>