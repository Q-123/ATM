<%@page import="java.sql.*"%>
<%@page import="java.util.Vector" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
<title>历史事务</title>

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
			<br><br>
			<div class="well">
				<table class="table table-hover" align="center">
  					<caption style="text-align:center"><h3>历史事务列表</h3></caption>
  					<thead>
    					<tr>
      						<th>用户</th>
      						<th>账户</th>
      						<th>操作</th>
      						<th>金额</th>
      						<th>时间</th>
    					</tr>
  					</thead>
  					<tbody>
    					
    					
<%
	try{
		String str=request.getParameter("curStatus");//从表单获得类别
		String account=(String)session.getAttribute("username");		//获取用户名*/
		String accountType=request.getParameter("accountType");			//获取账户类型*/
		String acc="";
		if(accountType.equals("0")){
			acc="活期账户";
		}
		else if(accountType.equals("1")){
			acc="定期账户";
		}
		else{
			acc="信用卡账户";
		}
		Class.forName("com.mysql.jdbc.Driver");  //用class加载动态链接库——驱动程序
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATMSystem?useUnicode=true&characterEncoding=UTF-8", 
													  "root", "123456");
		Statement stat = conn.createStatement();
		String sql="SELECT *FROM affairs WHERE account='"+account+"' AND accountType='"+acc+"'";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	    String dateNow=df.format(new Date());// new Date()为获取当前系统时间
		if(str.equals("1")){
			sql+=" and to_days(NOW())-TO_DAYS(date)<=1";
		}
		else if(str.equals("2")){
			sql+=" and date_sub(CURDATE(),INTERVAL 7 DAY)<=DATE(date)";
		}
		else if(str.equals("3")){
			sql+=" and date_sub(CURDATE(),INTERVAL 30 DAY)<=DATE(date)";
		}
		ResultSet per = stat.executeQuery(sql);  //用于返回结果

		while(per.next())
		{
			%>
			<tr>
		    <td><%=per.getString("account") %></td>
		    <td><%=per.getString("accountType") %></td>
		    <td><%=per.getString("transactionType") %></td>
		    <td><%=per.getInt("salary") %></td>
		    <td><%=per.getString("date") %></td>
		    </tr>
		<%
		}
		%>
		<%
	}catch(SQLException e){
		response.getWriter().write("<script>alert('添加失败1');location.href='index.jsp'</script>");
        e.printStackTrace();
    }catch (Exception e) {
    	response.getWriter().write("<script>alert('添加失败2');location.href='index.jsp'</script>");
        e.printStackTrace();
    }
%>
  					</tbody>
				</table>
				<table align="center">
					<tbody><tr><td><a href="chooseAffairsDate.jsp" class="btn btn-warning btn-sm"> 返 回 </a></td></tr></tbody>
				</table>
			</div>
		</div>
	</body>
</html>