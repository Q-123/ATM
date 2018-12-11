<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transfer Accounts</title>
</head>
<body>
<form method="post">
源账户
<select name="acc">
<option value="1">活期账户</option>
<option value="2">定期账户</option>
<option value="3">信用卡</option>
</select>
目标账户
<select name="tgt_acc">
<option value="1">活期账户</option>
<option value="2">定期账户</option>
<option value="3">信用卡</option>
</select>
转账金额<input type="text" name="money" value = 0> 
<input type="submit" value="转账">
</form>
<form action="service.jsp">
<input type="submit" value="选择其他服务">
</form>
<form action="index.jsp">
<input type="submit" value="退卡">
</form>

<div id="d1">
</div>
<div id="d2">
</div>
<div id="d3">
</div>
<div id="d4">
</div>
<script>
<%
	String acc =  request.getParameter("acc");
	String tgt_acc =  request.getParameter("tgt_acc");
	String money =  request.getParameter("money");
%>
	var acc = <%=acc%>;
	var tgt_acc = <%=tgt_acc%>;
	var money = <%=money%>;
	money = money.toString();
	if (acc == null)
	{
		document.getElementById("d1").innerHTML = "请选择源账户";
	}
	else if(acc == tgt_acc)
	{
		document.getElementById("d1").innerHTML = "源账户不能与目标账户相同";
	}
	if (tgt_acc == null)
	{
		document.getElementById("d2").innerHTML = "请选择目标账户";
	}
	if (money == 0)
	{
		document.getElementById("d3").innerHTML = "请输入金额";
	}
	else if (money > 10000)
	{
		document.getElementById("d3").innerHTML = "输入金额不能超过10000元";
	}
	if (acc != null && tgt_acc != null && money != 0 && acc != tgt_acc)
	{
		<%
		String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost:3306/atmsystem";
		String USER = "root";
		String PASS = "cptbtptp";
		Connection conn = null;
		Statement stmt = null;
		String acctable="", tgttable="", sql="";
		int balance = 0;
		String username = (String)session.getAttribute("username");
		try
		{
		    // Register JDBC driver
		    Class.forName(JDBC_DRIVER);
		
		    // Open a connection
		    conn = DriverManager.getConnection(DB_URL, USER, PASS);
		    stmt = conn.createStatement();
		    String acc1="",target="";
		    // Execute a query
		    if (acc.equals("1"))
		    {
		    	acctable = "current_acc";
		    	acc1="活期账户";
		    }
		    else if (acc.equals("2"))
		    {
				acctable = "deposit_acc";
				acc1="定期账户";
		    }
		    else
		    {
		    	acctable = "credit_acc";
		    	acc1="信用卡账户";
		    }
		    if (tgt_acc.equals("1"))
		    {
		    	tgttable = "current_acc";
		    	target="活期账户";
		    }
		    else if (tgt_acc.equals("2"))
		    {
				tgttable = "deposit_acc";
				target="定期账户";
		    }
		    else
		    {
		    	tgttable = "credit_acc";
		    	target="信用卡账户";
		    }
		    sql = "select balance from " + acctable + " where username = " + username;
		    ResultSet per = stmt.executeQuery(sql);
		    while (per.next())
		    {
		       balance = per.getInt("balance");
		    }
		    per.close();
		    int mon = Integer.valueOf(money);
		    balance -= 1.01*mon;
		    if (balance < 0)
		    {
		    	%>
		    	document.getElementById("d4").innerHTML = "当前账户余额不足";
		    	<%
		    }
		    else
		    {
			    sql = "update " + acctable + " set balance = " + balance + " where username = " + username;
			   	stmt.executeUpdate(sql);
			   	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		        String dateNow=df.format(new Date());// new Date()为获取当前系统时间
			   	sql = "insert into affairs values('"+username+"','"+acc1+"','转账支出',"+money+",'"+dateNow+"')";	//保存取款历史事务
		        stmt.executeUpdate(sql);
		        
		        dateNow=df.format(new Date());// new Date()为获取当前系统时间
		        sql = "insert into affairs values('"+username+"','"+target+"','转账收入',"+money+",'"+dateNow+"')";	//保存存款历史事务
		        stmt.executeUpdate(sql);
		        
			   	sql = "update " + tgttable + " set balance = balance + " + mon + " where username = " + username;
			   	stmt.executeUpdate(sql);
			   	%>
		    	document.getElementById("d4").innerHTML = "转账成功";
		    	<%
		    }
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
	}
</script>
</body>
</html>