<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset Password</title>
</head>
<body>
<form method="post">
旧密码<input name="oldpwd" type="text"> <br>
新密码<input name="passwd" type="text"> <br>
确认密码<input name="newpwd" type="text"> <br>
<input type="submit" value="确定">
</form>
<form action="service.jsp">
<input type="submit" value="选择其他服务">
</form>
<form action="index.js">
<input type="submit" value="退卡">
</form>
<div id="d1" style="color:red">

</div>
<%
	String passwd = request.getParameter("passwd");
	String username = (String)session.getAttribute("username"); 
%>
<script>
	var passwd = <%=passwd%>;
	if (passwd == null)
	{
		document.getElementById("d1").innerHTML = "请输入六位密码";
	}	
	else
	{
		passwd = passwd.toString();
		if(passwd.length != 6)
		{
			document.getElementById("d1").innerHTML = "密码长度错误！"
		}
		else
		{
			<%
			String JDBC_DRIVER = "com.mysql.jdbc.Driver";
			String DB_URL = "jdbc:mysql://localhost:3306/atm";
			String USER = "root";
			String PASS = "123456";
			Connection conn = null;
			Statement stmt = null;
		    try {
		        // Register JDBC driver
		        Class.forName(JDBC_DRIVER);

		        // Open a connection
		        conn = DriverManager.getConnection(DB_URL, USER, PASS);

		        // Execute a query
		        stmt = conn.createStatement();
		        String sql;
		        sql = "update users set passwd = " + passwd + " where username = " + username;
		        int n = stmt.executeUpdate(sql);
		        if (n == 1)
		        {
		        	%>
		        	document.getElementById("d1").innerHTML = "修改密码成功"
		        	<%
		        }
		        else
		        {
		        	%>
		        	document.getElementById("d1").innerHTML = "修改密码失败"
		        	<%
		        }
		        stmt.close();
		        conn.close();
		    } catch (SQLException se) {
		         // Handle errors for JDBC
		         se.printStackTrace();
		    } catch (Exception e) {
		         // Handle errors for Class.forName
		         e.printStackTrace();
		    } finally {
		         // finally block used to close resources
		         try {
		            if (stmt != null)
		                stmt.close();
		         } catch (SQLException se2) {
		         } // nothing we can do
		         try {
		            if (conn != null)
		                 conn.close();
		         } catch (SQLException se) {
		             se.printStackTrace();
		         } // end finally try
		    } // end try
			%>
			
		}
	}
		
</script>
</body>
</html>