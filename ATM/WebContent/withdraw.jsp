<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户取款</title>

	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	
	<script>
	$().ready(function() {
		// 在键盘按下并释放及提交后验证提交表单
		  $("#withdrawForm").validate({
			    rules: {
			      money: {
			    	required: true,
			    	range: [0,2000]
			      }
			    },
			    messages: {
			      money: {
				    required: "请输入金额",
				    range: "最大金额不能超过2000"
			      }
			    }
			});
		    $("#cancelButton").click(function(){
				event.preventDefault();
				$("#money").val("");
			});
		});
	function setmoney(value)
	{
		document.getElementById("money").value = value;
	}
	</script>
	<style>
		.error{
			color:red;
		}
	</style>
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
  				<li role="presentation" class="active"><a href="#">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-log-in"><strong> 存款</strong></span></a></li>	
  				<li role="presentation" class="active"><a href="transfer.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-refresh"><strong> 转账</strong></span></a></li>
  				<li role="presentation" class="active"><a href="chooseAffairsDate.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-list-alt"><strong> 历史记录</strong></span></a></li>
  				<li role="presentation" class="active"><a href="resetpwd.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-wrench"><strong> 修改密码</strong></span></a></li>
  				<li role="presentation" class="active"><a href="index.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-off"><strong> 退卡</strong></span></a></li>
  				
			</ul>
		</div>
		
		<div class="col-sm-8">
			<!--查询历史记录-->
			<h3 class="text-warning" style="text-align:center"><strong>用户取款</strong></h3>
			<br>
			<form class="form-horizontal" id="withdrawForm" role="form">
				<table class="table table-bordered" align="center">
  					<div class="form-group">
  						<thead>
    					<tr>
      						<th>账户类型</th>
      						<th>
      							<select name="acc" class="form-control">
      							<option value="1">活期账户</option>
      							<option value="2">定期账户</option>
      							<option value="3">信用卡账户</option>
    							</select>
      						</th>
    					</tr>
  						</thead>
    					<tbody>
    						<tr>
    							<th>选择金额</th>
    							<th>
    								<input type="button" class="btn btn-primary" value="500" onclick="setmoney(500)">&nbsp&nbsp&nbsp&nbsp
									<input type="button" class="btn btn-success" value="1000" onclick="setmoney(1000)">&nbsp&nbsp&nbsp&nbsp
									<input type="button" class="btn btn-info" value="1500" onclick="setmoney(1500)">&nbsp&nbsp&nbsp&nbsp
									<input type="button" class="btn btn-warning" value="2000" onclick="setmoney(2000)">
    							</th>
    						</tr>
    						<tr>
    							<th>输入金额</th>
    							<th>
    								<div class="input-group">
            							<span class="input-group-addon">$</span>
            							<input id="money" name="money" type="text" class="form-control" placeholder="最大金额不能超过2000元">
            							<span class="input-group-addon">.00</span>
        							</div>
    							</th>
    						</tr>
    						<tr>
    							<th>操作</th>
    							<th><button type="submit" class="btn btn-success">取款</button>&nbsp&nbsp
    							<button id="cancelButton" class="btn btn-default">取消</button>
    							</th>
    						</tr>
    					</tbody>
  					</div>
				</table>
			</form>
<script>
<%
String acc =  request.getParameter("acc");
String money = request.getParameter("money");

if (acc == null)
	acc = "1";
if (money == null)
	money = "0";
String username = (String)session.getAttribute("username");
%>
var acc = <%=acc%>;
var money = <%=money%>;
	if (money == 0){
	
	}
	else if (money % 100 != 0){
		
		alert("取款金额必须是整百!");
	}
</script>
<%
	int mon = Integer.parseInt(money);
	if (mon != 0 && mon%100 == 0)
	{
		
		String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost:3306/atmsystem";
		String USER = "root";
		String PASS = "cptbtptp";
		Connection conn = null;
		Statement stmt = null;
		String acctable="", sql="";
		int balance = 0, max_wd = 0;
		int newbal=0;
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
		    if (max_wd < mon)
		    {
		    	%>
		    	<script type="text/javascript">
		    		alert("超出一天最大取款累计金额5000元!");
		    	</script>
				<%
			}
		    else
		    {
		    	max_wd -= mon;
			    if (acc.equals("1"))
			 	{
			 	    sql = "select withdraw_times from current_acc where username = " + username;
			 	    per =  stmt.executeQuery(sql);
			 	    int times=0, cut=mon;
			 	    while (per.next())
			 	    {
			 	    	times = per.getInt("withdraw_times");
			 	    }
			 	    
			 	    per.close();
			 	    if (times >= 5)
			 	    {
			 	    	cut += 2;	
			 	    }
			 	    newbal = balance - cut;
			 	    if (newbal < 0)
			 		{
			 		    %>
			 		    <script type="text/javascript">
							alert("当前账户余额不足!");
						</script>
						<%
			 		}
			 	    else
			 	    {
			 	    	
			 	    	times++;
			 	    	
			 	    	sql = "update current_acc set balance = " + newbal + " ,max_withdraw = " + max_wd + " ,withdraw_times = " + times + 
			 	    		  " where username = " + username;
			 	    	stmt.executeUpdate(sql);
			 	    	
			 	    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				        String dateNow=df.format(new Date());// new Date()为获取当前系统时间
					   	sql = "insert into affairs values('"+username+"','活期账户','取款',"+mon+",'"+dateNow+"')";	//保存取款历史事务
				        stmt.executeUpdate(sql);
			 	    	
			 	    	%>
			 	    	<script type="text/javascript">
						alert("取款成功!"); location.href="withdraw.jsp";
						</script>
						<%
			 	    }
			 	 }	  
			 	 else if (acc.equals("2"))
			 	 {
			 	    sql = "select due_date from deposit_acc where username = " + username;
			 	    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			 	    String dateNow = df.format(new Date());// new Date()为获取当前系统时间
			 	    String dateacc=null;
			 	    per = stmt.executeQuery(sql);
			 	    int cut=mon;
			 	    while (per.next())
			 	    {
			 	        java.sql.Date date = per.getDate("due_date");
			 	        dateacc = df.format(date);
			 	    }
			 	    per.close();
			 	    if (dateacc.compareTo(dateNow) > 0)
			 	    {
			 	    	cut += 10;
			 	    }
			 	    newbal = balance - cut;
			 	    if (newbal < 0)
			 		{
			 		    %>
						<script type="text/javascript">
							alert("当前账户余额不足!");
						</script>
						<%
			 		}
			 	    else
			 	    {
			 	    	sql = "update deposit_acc set balance = " + newbal + " ,max_withdraw = " + max_wd + 
			 	    		  " where username = " + username;
			 	    	stmt.executeUpdate(sql);
			 	    	
			 	    	SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				        String dateNow1=df1.format(new Date());// new Date()为获取当前系统时间
					   	sql = "insert into affairs values('"+username+"','定期账户','取款',"+mon+",'"+dateNow1+"')";	//保存取款历史事务
				        stmt.executeUpdate(sql);
			 	    	
			 	    	%>
						<script type="text/javascript">
							alert("取款成功!"); location.href="withdraw.jsp";
						</script>
						<%
			 	    }
			 	}
			 	else
			 	{
			 		int overdraft = 0;
			 	    sql = "select overdraft from credit_acc where username = " + username;
			 	    per = stmt.executeQuery(sql);
			 	    while (per.next())
			 	    {
			 	    	overdraft = per.getInt("overdraft");
			 	    }
			 	    per.close();
			 	    if (balance - mon < -2000)
			 	    {
			 	    	%>
						<script type="text/javascript">
							alert("当前账户余额不足!");
						</script>
						<%
			 	    }
			 	    else
			 	    {
			 	    		
			 	    	newbal = balance - mon;
			 	   		if (newbal < 0)
			 	   		{
			 	   			overdraft =2000 + newbal;
			 	   		}
			     		sql = "update credit_acc set balance = " + newbal + " ,max_withdraw = " + max_wd + " ,overdraft = " + overdraft +
			    			  " where username = " + username;
		 	    		stmt.executeUpdate(sql);
		 	    		
		 	    		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				        String dateNow=df.format(new Date());// new Date()为获取当前系统时间
					   	sql = "insert into affairs values('"+username+"','信用卡账户','取款',"+mon+",'"+dateNow+"')";	//保存取款历史事务
				        stmt.executeUpdate(sql);
		 	    		
		 	    		%>
						<script type="text/javascript">
							alert("取款成功!"); location.href="withdraw.jsp";
						</script>
						<%
			 	    }
			 	}
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
	}
%>
		</div>
	</div>
	
</body>
</html>