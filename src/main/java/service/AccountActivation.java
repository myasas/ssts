package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import configuration.StaticReferences;
import data.DatabaseConnection;

/**
 * 
 * @author Yasas De Silva
 * Servlet implementation class AccountActivation
 * This class allows users to activate there user accounts through this URL
 * http://localhost:8080/LyndaDynamics/AccountActivation?secretkey=9
 *
 */
@WebServlet(description = "this is my calculator decroption", urlPatterns = { "/AccountActivation" })
public class AccountActivation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountActivation() {
        super();
        // TODO Use singletonSesignpattern in this class
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		String secretkey = request.getParameter("secretkey");
//		String userID = request.getParameter("email");
		final String userstatus=StaticReferences.uStatusActivated;
		
		String SQL="UPDATE ssts.users SET user_status='"+userstatus+"' where user_id="+secretkey+"";
		
		try{
	    DatabaseConnection.getInstance().updateValues(SQL);
		}catch(Exception e){
			writer.println("There was an exception. Which is: "+e);
		}
		writer.println("Account activation sucessful.");
	}

}
