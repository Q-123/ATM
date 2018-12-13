<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户余额查询</title>

	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom:0;background-color: #FF9933">
		<h3>ATM System</h3>
   		<p>安全、便捷、可靠的在线交易系统</p>
	</div>
	
	<nav class="navbar navbar-inverse">
 		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="service.jsp"><span class="glyphicon glyphicon-home"> Home</span></a>
    		</div>
    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    			<ul class="nav navbar-nav">
        			<p class="navbar-text"><strong> 欢迎用户登录ATM系统</strong></p>		
      			</ul>
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="#"><span class="glyphicon glyphicon-cog"></span></a></li>
        			<li><a href="#"><span class="glyphicon glyphicon-repeat"></span></a></li>
        		</ul>
    		</div>
  		</div>
	</nav>
	
  	<div class="row">
    	<div class="col-sm-2">
    		<br>
			<ul class="nav nav-pills nav-stacked">
  				<li role="presentation" class="active"><a href="query.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-search"><strong> 余额</strong></span></a></li>
  				<li role="presentation" class="active"><a href="withdraw.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-log-out"><strong> 取款</strong></span></a></li>
  				<li role="presentation" class="active"><a href="deposit.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-log-in"><strong> 存款</strong></span></a></li>	
  				<li role="presentation" class="active"><a href="transfer.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-refresh"><strong> 转账</strong></span></a></li>
  				<li role="presentation" class="active"><a href="chooseAffairsDate.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-list-alt"><strong> 历史记录</strong></span></a></li>
  				<li role="presentation" class="active"><a href="resetpwd.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-wrench"><strong> 修改密码</strong></span></a></li>
  				<li role="presentation" class="active"><a href="index.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-off"><strong> 退卡</strong></span></a></li>
  				
			</ul>
		</div>
		
		<div class="col-sm-8">
			<!--查询历史记录-->
			<h3 class="text-warning" style="text-align:center"><strong>账户余额查询</strong></h3>
			<br>
			<form role="form" method="post">
				<table class="table table-bordered" align="center">
  					<div class="form-group">
  						<thead>
    					<tr>
      						<th>账户类型</th>
      						<th>操作</th>
    					</tr>
  						</thead>
    					<tbody>
    						<tr>
    							<th>
    							<select class="form-control" name="acc">
      							<option value="1">活期账户</option>
      							<option value="2">定期账户</option>
      							<option value="3">信用卡账户</option>
    							</select>
    							</th>
    							<th><button type="submit" class="btn btn-success">查询</button></th>
    						</tr>
    					</tbody>
  					</div>
				</table>
			</form>
			<br><br>
			<div class="well" id="d1">
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
		//document.getElementById("d1").innerHTML = "请选择账户";
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
												"<table class='table table-hover' align='center'>"+
							  					"<caption style='text-align:center'><h3>查询结果</h3></caption>"+
												"<thead><tr><th>账户信息</th><th>实际余额</th><th>可取款数额</th></tr></thead>"+
												"<tbody><tr>"+
												"<td>"+info+"</td>"+
												"<td>"+<%=balance%>+"</td>"+
												"<td>"+<%=max_wd%>+"</td>"+
												"</tr><tbody>"+
												"</table>";
	}
			</script>
		</div>
	</div>
	
</body>
</html>