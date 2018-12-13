<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ATM系统首页</title>

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
		<br>
		<div class="col-sm-10">
			<!--查询历史记录-->
			<h3 class="text-danger" style="text-align:center"><strong>用户存款</strong></h3>
		</div>
	</div>

</body>
</html>