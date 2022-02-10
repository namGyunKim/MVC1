<%@page import="telinfoDAO.BasketDAO"%>
<%@page import="sun.font.Script"%>
<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 프로세스</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

TelInfoDAO tf = new TelInfoDAO();
BasketDAO bk = new BasketDAO();
String thisId=(String)session.getAttribute("sId");


if(bk.BasketAllDelete(thisId)){
    tf.deleteCustomer2(thisId);
    session.setAttribute("sId", "null");
    session.setAttribute("sPw", "");
    session.setAttribute("idCheck", "");
    session.setAttribute("pwCheck", "");
    response.sendRedirect("login.jsp");

}
else
   out.println("삭제실패");

%>

<script type="text/javascript">
window.close();
</script>




</body>
</html>