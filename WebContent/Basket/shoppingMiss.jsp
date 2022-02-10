<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>


<!-- jsp가 먼저 실행되고 자바스크립트가 되기때문에 알람창 뜨지않음 -->
<script type="text/javascript">
alert("로그인이 되어있지 않습니다");
location="../login.jsp";
</script>




</body>
</html>