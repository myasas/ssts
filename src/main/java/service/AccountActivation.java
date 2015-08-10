package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AccountActivation
 * This class allows users to acvivate there user accounts through this url
 * http://localhost:8080/LyndaDynamics/AccountActivation?secretkey=9
 */
@WebServlet(description = "this is my calculator decroption", urlPatterns = { "/AccountActivation" })
public class AccountActivation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountActivation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		String secretkey = request.getParameter("secretkey");
//		String userID = request.getParameter("email");
		
//AAAA-These type of variables are to put in a single class
		final String userstatus="act";
//AAAA
		String sql="UPDATE ssts.users SET user_status='"+userstatus+"' where user_id="+secretkey+"";
		try{
	    Class.forName("com.mysql.jdbc.Driver");

	    
	    Connection con = DriverManager.getConnection("jdbc:mysql://ssts-server.bitnamiapp.com:3306/ssts",
	            "root", "1qaz2wsx@");
	    
	    PreparedStatement pst = con.prepareStatement(sql);
	    pst.executeUpdate();

		}catch(Exception e){
			writer.println("There was an exception. Which is: "+e);
		}
		writer.println("Account activation sucessful.");
	}

}
