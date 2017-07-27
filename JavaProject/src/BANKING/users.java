package BANKING;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class users
 */
@WebServlet("/users")
public class users extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public users() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		//out.println("wrong name");
		String name=request.getParameter("uname");
		String passwd=request.getParameter("pas");
	int flag=0;
	try{
		
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection obj = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			Statement stmt = obj.createStatement();
			ResultSet res = stmt.executeQuery("select * from bankemploy");
			out.println(passwd);
			out.println(name);

			while(res.next()){
			//out.println("wrong name");
				if((name.equals(res.getString(1)))&&(passwd.equals(res.getString(2)))){
					if(res.getString(3).equals("STAFF")){
					flag=1;
						response.sendRedirect("STAFFLOG.html");
					}
					else{
				flag=1;	
				response.sendRedirect("DELADD.html");
				}
				}
				}
			
if(flag==0)
	out.println("unsuces");
		}
		catch(Exception e){
			out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
