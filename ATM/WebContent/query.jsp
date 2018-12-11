<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Query Balance</title>
</head>
<body>
<form method="post">
<select name="acc">
<option value="1">活期账户</option>
<option value="2">定期账户</option>
<option value="3">信用卡</option>
</select>
<input type="submit" value="查询">
</form>
<form action="service.jsp">
<input type="submit" value="选择其他服务">
</form>
<form action="index.jsp">
<input type="submit" value="退卡">
</form>

<div id="d1">
</div>
<script>
<%
	String acc =  request.getParameter("acc");
	String acctable="", sql="";
	int balance = 0, max_wd = 0;
	String username = (String)session.getAttribute("username");
%>
	var acc = <%=acc%>;
	if (acc == null)
	{
		document.getElementById("d1").innerHTML = "请选择账户";
	}
	else
	{
		<%
		String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost:3306/atmsystem";
		String USER = "root";
		String PASS = "cptbtptp";
		Connection conn = null;
		Statement stmt = null;
		try
		{
		    // Register JDBC driver
		    Class.forName(JDBC_DRIVER);
		
		    // Open a connection
		    conn = DriverManager.getConnection(DB_URL, USER, PASS);
		    stmt = conn.createStatement();
		    
		    // Execute a query
		    if (acc.equals("1"))
		    {
		    	acctable = "current_acc";
		    }
		    else if (acc.equals("2"))
		    {
				acctable = "deposit_acc";
		    }
		    else
		    {
		    	acctable = "credit_acc";
		    }
		    sql = "select balance, max_withdraw from " + acctable + " where username = " + username;
		    ResultSet per = stmt.executeQuery(sql);
		    while (per.next())
		    {
		       balance = per.getInt("balance");
		       max_wd = per.getInt("max_withdraw");
		    }
		    per.close();
		    stmt.close();
		    conn.close();
		}
		catch (SQLException se)
		{
		    // Handle errors for JDBC
		    se.printStackTrace();
		}
		catch (Exception e)
		{
		    // Handle errors for Class.forName
		    e.printStackTrace();
		}
		finally
		{
		    // finally block used to close resources
		    try
		    {
		        if (stmt != null)
		            stmt.close();
		    }
		    catch (SQLException se2)
		    {
		    } // nothing we can do
		    try
		    {
		        if (conn != null)
		            conn.close();
		    }
		    catch (SQLException se)
		    {
		        se.printStackTrace();
		    } // end finally try
		} // end try
		%>
		acc = acc.toString();
		var info;
		if(acc == "1")
			info = "活期账户";
		else if (acc == "2")
			info = "定期账户";
		else
			info = "信用卡";
		document.getElementById("d1").innerHTML = 
												"<table border=\"1\">"+
												"<tr><th>账户信息</th><th>实际余额</th><th>可取款数额</th></tr>"+
												"<tr>"+
												"<td>"+info+"</td>"+
												"<td>"+<%=balance%>+"</td>"+
												"<td>"+<%=max_wd%>+"</td>"+
												"</tr>"+
												"</table>";
	}
</script>
</body>
</html> 