<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>

	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	
	<script>
	$().ready(function() {
	// 在键盘按下并释放及提交后验证提交表单
	  $("#signupForm").validate({
		    rules: {
		      oldPassword: {
		    	required: true,
		    	minlength: 6,
		    	maxlength: 6
		      },
		      password: {
		        required: true,
		        minlength: 6,
		        maxlength: 6,
		        equalTo: "#oldPassword"
		      },
		      confirm_password: {
		        required: true,
		        minlength: 6,
		        maxlength: 6,
		        equalTo: "#password"
		      }
		    },
		    messages: {
		      oldPassword: {
			    required: "请输入密码",
			    maxlength: "密码长度为6位数字",
			    minlength: "密码长度为6位数字"
			  },
		      password: {
		        required: "请输入密码",
		        maxlength: "密码长度为6位数字",
		        minlength: "密码长度为6位数字",
		        equalTo: "新密码不能与旧密码相同"
		      },
		      confirm_password: {
		        required: "请输入密码",
		        maxlength: "密码长度为6位数字",
		        minlength: "密码长度为6位数字",
		        equalTo: "两次密码输入不一致"
		      }
		    }
		});
	    $("#cancelButton").click(function(){
			event.preventDefault();
			$("#oldPassword").val("");
			$("#password").val("");
			$("#confirm_password").val("");
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
			<form class="form-horizontal" id="signupForm" role="form" method="post">
			<h3 class="text-info" style="text-align:center"><strong>修改密码</strong></h3>
			<br><br>
				<div class="form-group">
					<label for="oldPassword" class="col-sm-2 control-label">旧密码</label>
					<div class="col-sm-8">
						<input id="oldPassword" name="oldPassword" type="password" class="form-control" placeholder="请输入用户密码" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
					</div>
				</div>
					
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-8">
						<input id="password" name="password" type="password" class="form-control" placeholder="请输入新密码" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
					</div>
				</div>
					
				<div class="form-group">
					<label for="confirm_password" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-8">
							<input id="confirm_password" name="confirm_password" type="password" class="form-control" placeholder="请确认密码" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
						</div>
					</div>
		
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8">
							<table align="center">
								<tbody>
									<tr>
										<td><button type="submit" name="submit" class="btn btn-success">确定</button></td>
										<td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
										<td><button id="cancelButton" class="btn btn-default">取消</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</form>
				<div id="d1" style="color:red">
				</div>
<%
String oldPasswd = request.getParameter("oldPassword");
String passwd = request.getParameter("password");
//String username = (String)session.getAttribute("username");
if (oldPasswd != null && passwd != null)
{
	if (oldPasswd.equals(passwd))
	{
		%>
    	<script type="text/javascript">
		    alert("新密码与旧密码不能相同");
		    location.href="resetpwd.jsp";
		</script>
    	<%
	}
	else
	{
		String username = "20150801";
		String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost:3306/atmsystem";
		String USER = "root";
		String PASS = "123456";
		Connection conn = null;
		Statement stmt = null;
		try
		{
		    // Register JDBC driver
		    Class.forName(JDBC_DRIVER);

		    // Open a connection
		    conn = DriverManager.getConnection(DB_URL, USER, PASS);

		    // Execute a query
		    stmt = conn.createStatement();

		    String sql;
		    sql = "select passwd from users where username = '" + username + "'";
		    ResultSet per = stmt.executeQuery(sql);
		    per.first();
		    String p = per.getString(1);
		    if (p.equals(oldPasswd))
		    {
		        sql = "update users set passwd = '" + passwd + "' where username = '" + username + "'";
		        stmt.executeUpdate(sql);
		        %>
		    	<script type="text/javascript">
				    alert("修改密码成功");
				    location.href="resetpwd.jsp";
				</script>
		    	<%
		    }
		    else
		    {
		    	%>
		    	<script type="text/javascript">
				    alert("旧密码输入错误");
				    location.href="resetpwd.jsp";
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

}

%>
	
</body>
</html>