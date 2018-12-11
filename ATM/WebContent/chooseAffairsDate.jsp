<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
   request.setCharacterEncoding("utf-8");  
   response.setCharacterEncoding("utf-8");  
   response.setContentType("text/html; charset=utf-8");  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="mycss/login.css" />	
<title>选择历史事务查询时间</title>
</head>
<body>
<form action="viewAffairs.jsp" method="post"> 
	<table border="1" align="center"> 
	<td>查询时间</td> 
	<td>
	<select name="curStatus">     
  	<option value="0">----------请选择----------</option>     
  	<option value="1">一天之内</option>
  	<option value="2">一周之内</option>
  	<option value="3">一月之内</option>
  	<option value="4">所有事务</option>
	</select>
	</td>
	<tr>
	<td><input type = "submit" value="查		询"/></td>
	</tr>
	</table>
</form>
</body>
</html>