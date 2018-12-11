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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查看历史事务</title>
</head>
<body>
<%
	try{
		String str=request.getParameter("curStatus");//从表单获得类别
		String account=(String)session.getAttribute("username");		//获取用户名
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
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATMSystem", "root", "cptbtptp");
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
		%>
		<table border="1" align="center">
		<tr>
		<th>用户名</th>
		<th>账户类型</th>
		<th>操作</th>
		<th>金额</th>
		<th>操作时间</th>
		</tr>	
			<%
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
		</table>
		<%
	}catch(SQLException e){
		response.getWriter().write("<script>alert('添加失败1');location.href='index.jsp'</script>");
        e.printStackTrace();
    }catch (Exception e) {
    	response.getWriter().write("<script>alert('添加失败2');location.href='index.jsp'</script>");
        e.printStackTrace();
    }
%>
<form action="chooseAffairsDate.jsp" method="post"> 
	<table border="1" align="center"> 
	<input type = "submit" value="返回"/>
	</table>
</form>
<form action="service.jsp">
<input type="submit" value="选择其他服务">
</form>
<form action="index.jsp">
<input type="submit" value="退卡">
</form>
</body>
</html>