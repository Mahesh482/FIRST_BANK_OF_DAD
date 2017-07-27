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



int  amount=Integer.parseInt(request.getParameter("amt"));
String tran=request.getParameter("type");
//int acno=Integer.parseInt(session.getAttribute("customer"));
try{
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection obj = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
	Statement stmt = obj.createStatement();
	if(tran.equals("with")){
		int c=stmt.executeUpdate("update bankusers set balance=balance-"+amount+"where custid="+session.getAttribute("customer") );
		 response.sendRedirect("Transact.html");
	}
	else
	{
		int c=stmt.executeUpdate("update bankusers set balance=balance+"+amount+"where custid="+session.getAttribute("customer") );
		 response.sendRedirect("Transact.html");
	}
	
}
		
	

catch(Exception e){
	out.println(e);
}
%>
</body>
</html>