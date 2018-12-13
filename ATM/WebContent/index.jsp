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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	
	<script>
	$().ready(function() {
	// 在键盘按下并释放及提交后验证提交表单
	  $("#loginForm").validate({
		    rules: {
		      username: {
		    	required: true,
		    	minlength: 8
		      },
		      passwd: {
		        required: true,
		        minlength: 5
		      }
		    },
		    messages: {
		      username: {
			    required: "请输入用户账号",
			    minlength: "账号长度不能小于8个字符"
			  },
		      passwd: {
		        required: "请输入密码",
		        minlength: "密码长度不能小于 5 个字母"
		      }
		    }
		});
	    $("#cancelButton").click(function(){
			event.preventDefault();
			$("#username").val("");
			$("#passwd").val("");
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
		<h1><font color="#FFFFFF">ATM System</font></h1>
	</div>
	<br><br>
	<div class="container">
  		<div class="row">
    		<div class="text-center">
    			<br><br>
				<form class="form-horizontal" id="loginForm" role="form" action="jump.jsp">
					<h2 class="text-info" style="text-align:center"><strong>系统登录</strong></h2>
					<br><br>
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">账号</label>
						<div class="col-sm-8">
							<input id="username" name="username" type="text" class="form-control" placeholder="请输入账号">
						</div>
					</div>
					
					<div class="form-group">
						<label for="passwd" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-8">
							<input id="passwd" name="passwd" type="password" class="form-control" placeholder="请输入密码">
						</div>
					</div>
		
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8">
							<table align="center">
								<tbody>
									<tr>
										<td><button type="submit" name="submit" class="btn btn-success">登录</button></td>
										<td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
										<td><button id="cancelButton" class="btn btn-default">取消</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>