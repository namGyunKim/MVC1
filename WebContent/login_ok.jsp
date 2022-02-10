<%@page import="telinfoDAO.TelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인_ok</title>
</head>
<body>

<script type="text/javascript">

</script>


	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String thisId = request.getParameter("userId");
		String thisPw = request.getParameter("userPw");

		/* 세션 */
		session.setAttribute("sId", thisId);
		session.setAttribute("sPw", thisPw);

		//에이잭스라서 아래꺼 없어도됨
		 	//RequestDispatcher rd1=request.getRequestDispatcher("login.html");
			//rd1.forward(request,response); 
	%>
	
	<%
	TelInfoDAO tidao = new TelInfoDAO();
	%>




</body>
</html>