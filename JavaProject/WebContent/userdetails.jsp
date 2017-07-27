<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*"%>
<%@ page import ="java.io.IOException"%>
<%@ page import ="java.io.PrintWriter"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="javax.servlet.ServletException"%>
<%@ page import ="javax.servlet.annotation.WebServlet"%>
<%@ page import ="javax.servlet.http.HttpServlet"%>
<%@ page  import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import ="javax.servlet.http.HttpServletResponse" %>
<%

String name=request.getParameter("uname");
int  phno=Integer.parseInt(request.getParameter("phn"));
int  bal=Integer.parseInt(request.getParameter("bal"));
int  accno=Integer.parseInt(request.getParameter("cid"));
try{
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection obj = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
	Statement stmt = obj.createStatement();
	int num= stmt.executeUpdate("insert into bankusers values ('"+name+"',"+accno+","+phno+","+bal+")");
	if(num>0){
		response.sendRedirect("DELADD.html");
	}
	
	
	
	
}
		
	

catch(Exception e){
	out.println(e);
}
%>
el;ahmdbidhnpimngvjk
</body>
</html>