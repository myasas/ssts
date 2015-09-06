package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
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
	private static final Logger LOGGER= Logger.getLogger(AccountActivation.class);

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountActivation() {
        super();
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter writer = response.getWriter();
		String secretkey = request.getParameter("secretkey");
//		String userID = request.getParameter("email");
		final String userstatus=StaticReferences.uStatusActivated;
	    
		String SQL = "select * from users where user_id=" + secretkey + "";		
		String SQLUpdate="UPDATE ssts.users SET user_status='"+userstatus+"' where user_id="+secretkey+"";
    
	    try {
		    ResultSet rs;	    	
			rs= DatabaseConnection.getInstance().getValues(SQL);
			
			//If email is already registered in the database
		    if (rs.next()) {
		        String dbUserstatus=rs.getString("user_status");		
		        if(dbUserstatus.equalsIgnoreCase(StaticReferences.uStatusActivated)){
		    		writer.println("Account is already activated. Please proceed with signing in to SSTS.");		        	
		        }else if(dbUserstatus.equalsIgnoreCase(StaticReferences.uStatusDeactivated)){
		    	    DatabaseConnection.getInstance().updateValues(SQLUpdate);	
		    		writer.println("Account activation sucessful.");	
//					Log info
		        	LOGGER.info("User Account Activated");		    		
		        }else if(dbUserstatus.equalsIgnoreCase(StaticReferences.uStatusRestricted)){
		    		writer.println(StaticReferences.msgAccRestrict);		        	
		        }
		    }else{
				writer.println("User account does not exist in the database.");		    	
		    }    
		}catch(Exception e){
			writer.println("There was a Problem. Which is: "+e);
//			Log error	
        	LOGGER.error("Exception in sendAccountActivationEmail", e);			
		}

	}

}
