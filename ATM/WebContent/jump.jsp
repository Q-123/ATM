<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jump</title>
</head>
<body>
<div id="d1">
这里是错误信息。
</div>
<%
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String DB_URL = "jdbc:mysql://localhost:3306/atm";
	String USER = "root";
	String PASS = "123456";
	Connection conn = null;
	Statement stmt = null;
	String username = request.getParameter("username");
	String passwd = request.getParameter("passwd");
	try
	{
	    // Register JDBC driver
	    Class.forName(JDBC_DRIVER);
	
	    // Open a connection
	    conn = DriverManager.getConnection(DB_URL, USER, PASS);
	
	    // Execute a query
	    stmt = conn.createStatement();
	    String sql;
	    sql = "select count(*) as countnum from users where username = " + username;
	    ResultSet per1 = stmt.executeQuery(sql);
	    while (per1.next())
	    {
	        if (per1.getInt("countnum") == 0)
	        {
	            %>
	            <script>
	            	document.getElementById("d1").innerHTML = "账户不存在！";
	            </script> 
	            <%
	        }
	        else
	        {
	            sql = "select passwd from users where username = " + username;
	            stmt.executeQuery(sql);
	            ResultSet per = stmt.executeQuery(sql);
	            while (per.next())
	            {
	                if (passwd.equals(per.getString("passwd")))
	                {
	                    session.setAttribute("username", username);
	                    %> <jsp:forward page = "service.jsp" /> <%
	                }
	                else
	                {
	                    %>
	                    <script>
	                    	document.getElementById("d1").innerHTML = "密码错误！";
	                    </script> 
	                    <%
	                }
	            }
	            per.close();
	        }
	    }
	    per1.close();
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
<form action="index.jsp" method="post">
		<input type="submit" value="返回" />
</form>
</body>
</html>