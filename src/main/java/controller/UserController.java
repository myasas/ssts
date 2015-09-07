package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import configuration.StaticReferences;

import dao.UserDAO;
import model.User;

/**
 * 
 * @author Yasas De Silva
 * Servlet implementation class UserController
 * This class allows user to add/modify user accounts
 * http://localhost:8080/LyndaDynamics/AccountActivation?secretkey=9
 *
 */
@WebServlet(description = "this is my calculator decroption", urlPatterns = { "/ClassName" })
public class UserController extends HttpServlet {
	private static final Logger LOGGER= Logger.getLogger(UserController.class); 	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
	    try {		
		String userType = request.getParameter("select-usertype");
		String userStatus = request.getParameter("select-userstatus");
		
		String userName = request.getParameter("username");
		String userLogin = request.getParameter("userlogin");
		String userPass = request.getParameter("userpass");
		String userBday = request.getParameter("userbday");
		
		User user = new User();
		user.setUserType(userType);
		user.setUserStatus(userStatus);
		user.setUserName(userName);
	    user.setUserLogin(userLogin);
	    user.setUserPass(userPass);
	    user.setUserBday(userBday);
	    
	    UserDAO userDao = new UserDAO();
	    userDao.updateUser(user);
	    
//		Log info
    	LOGGER.info("User Account Update Suceesful.");
	    }catch(Exception e){
//			Log error	
        	LOGGER.error("Exception in Updating user account.", e);	
		}
	  
	}

}
