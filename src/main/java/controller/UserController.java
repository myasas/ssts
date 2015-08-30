package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@WebServlet(description = "this is my calculator decroption", urlPatterns = { "/AccountActivation" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO can Use singletonDesignpattern in this class
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
	    
		writer.println("User account update successful !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!******************************");	

	    }catch(Exception e){
			writer.println("Exception in update user account ????????????? :"+ e );			
		}
	  
	}

}
