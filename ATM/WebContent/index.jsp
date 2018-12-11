<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
</body>
<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%  
   request.setCharacterEncoding("utf-8");  
   response.setCharacterEncoding("utf-8");  
   response.setContentType("text/html; charset=utf-8");  
   response.setHeader("iso-8859-1","utf-8"); 
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Welcome!</h3>
	<form action="jump.jsp" method="post">
		账户<input name="username" type="text" value=""/> <br> 
		密码<input name="passwd" type="password" value=""/> <br> 
		<input type="submit" value="登陆" />
	</form>
</body>
</html>