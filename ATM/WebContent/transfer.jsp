<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("utf-8");  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户转账操作</title>

	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	
	<script>
	$().ready(function() {
	// 在键盘按下并释放及提交后验证提交表单
	  $("#tranferForm").validate({
		    rules: {
		      inputMoney: {
		    	required: true,
		    	range: [0,10000]
		      }
		    },
		    messages: {
		      inputMoney: {
			    required: "请输入金额",
			    range: "最大金额不能超过10000"
		      }
		    }
		});
	    $("#cancelButton").click(function(){
			event.preventDefault();
			$("#inputMoney").val("");
		});
	});
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
  				<li role="presentation" class="active"><a href="deposit.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-log-in"><strong> 存款</strong></span></a></li>	
  				<li role="presentation" class="active"><a href="transfer.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-refresh"><strong> 转账</strong></span></a></li>
  				<li role="presentation" class="active"><a href="chooseAffairsDate.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-list-alt"><strong> 历史记录</strong></span></a></li>
  				<li role="presentation" class="active"><a href="resetpwd.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-wrench"><strong> 修改密码</strong></span></a></li>
  				<li role="presentation" class="active"><a href="index.jsp">&nbsp&nbsp&nbsp&nbsp<span class="glyphicon glyphicon-off"><strong> 退卡</strong></span></a></li>
  				
			</ul>
		</div>
		
		<div class="col-sm-8">
			<!--查询历史记录-->
			<h3 class="text-danger" style="text-align:center"><strong>账户转账</strong></h3>
			<br>
			<form class="form-horizontal" id="tranferForm" role="form" method="post">
				<table class="table table-bordered" align="center">
  					<div class="form-group">
  						<thead>
    					<tr>
      						<th>源账户</th>
      						<th>目标账户</th>
      						<th>转账金额</th>
      						<th>操作</th>
    					</tr>
  						</thead>
    					<tbody>
    						<tr>
    							<th>
    							<select name="acc" class="form-control">
      							<option value="1">活期账户</option>
      							<option value="2">定期账户</option>
      							<option value="3">信用卡账户</option>
    							</select>
    							</th>
    							<th>
    							<select name="tgt_acc" class="form-control">
      							<option value="1">活期账户</option>
      							<option value="2">定期账户</option>
      							<option value="3">信用卡账户</option>
    							</select>
    							</th>
    							<th>
    								<div class="input-group">
            							<span class="input-group-addon">$</span>
            							<input id="inputMoney" name="inputMoney" type="text" class="form-control" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
            							<span class="input-group-addon">.00</span>
        							</div>
    							</th>
    							<th>
    							<button type="submit" class="btn btn-success">确定</button>&nbsp&nbsp
    							<button id="cancelButton" class="btn btn-default">取消</button>
    							</th>
    						</tr>
    					</tbody>
  					</div>
				</table>
			</form>
			<div id="d4">
			</div>
<%
	String acc =  request.getParameter("acc");
	String tgt_acc =  request.getParameter("tgt_acc");
	String money =  request.getParameter("inputMoney");
	if (acc == null)
	{
		acc = "0";
		tgt_acc = "0";
		money = "0";
	}
%>
<script>
	var acc = <%=acc%>;
	var tgt_acc = <%=tgt_acc%>;
	var money = <%=money%>;
	if(acc != 0)
	{
		if (acc == tgt_acc)
		{
			alert("源账户不能与目标账户相同！");
			location.href="transfer.jsp";
		}
		else if (money == 0)
		{
			alert("取款金额不能为零！");
			location.href="transfer.jsp";
		}
	}
</script>
<%
	
	int mon = Integer.valueOf(money);
	if (acc != "0" && !acc.equals(tgt_acc) && mon > 0 && mon <= 10000)
	{
		String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost:3306/atmsystem?useUnicode=true&characterEncoding=UTF-8";
		String USER = "root";
		String PASS = "123456";
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
		    
		    balance -= 1.01*mon;
		    if (balance < 0)
		    {
		    	%>
		    	<script>
		    	alert("当前账户余额不足!");
		    	location.href="transfer.jsp";
		    	</script>
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
			   	<script>
		    	alert("转账成功！");
		    	location.href="transfer.jsp";
		    	</script>
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
	}

%>
		</div>
	</div>
	
</body>
</html>