package dao;

import java.sql.ResultSet;

import data.DatabaseConnection;

public class UserDAO {
	
	private String userID="user_id";
	private String userType="user_type";
	private String userLogin="user_login";
	private String userPass="user_password";
	private String userStatus="user_status";
	private String userName="user_name";
	private String userBday="user_bday";	
	private String userReg="user_reg";

	
	
	public static void main(String[] args) {
		UserDAO ud = new UserDAO();
		ud.setUserLogin("'myasas@gmail.com'");
		
		UserDAO ud2;
		ud2 = ud.getUserDAO(ud);

		System.out.println(ud2.getUserID());
	}
	
	
	public UserDAO getUserDAO(UserDAO userDAO) {
		String SQL="select * from ssts.users where user_id="+userDAO.getUserID()+" && "
				+ "user_type="+userDAO.getUserType()+" && "
				+ "user_login="+userDAO.getUserLogin()+" && "
				+ "user_password="+userDAO.getUserPass()+" && "
				+ "user_status="+userDAO.getUserStatus()+" && "
				+ "user_name="+userDAO.getUserName()+" && "
				+ "user_bday="+userDAO.getUserBday()+" && "
				+ "user_reg="+userDAO.getUserReg()+"";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				userDAO.setUserID(rs.getString("user_id"));
				userDAO.setUserType(rs.getString("user_type"));
				userDAO.setUserLogin(rs.getString("user_login"));
				userDAO.setUserPass(rs.getString("user_password"));
				userDAO.setUserStatus(rs.getString("user_status"));				
				userDAO.setUserName(rs.getString("user_name"));
				userDAO.setUserBday(rs.getString("user_bday"));
				userDAO.setUserReg(rs.getString("user_reg"));				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
		}
		return userDAO;
	}
	
//	Getters and Setters
	/**
	 * @return the userID
	 */
	public String getUserID() {
		return userID;
	}
	/**
	 * @param userID the userID to set
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	/**
	 * @return the userType
	 */
	public String getUserType() {
		return userType;
	}
	/**
	 * @param userType the userType to set
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
	/**
	 * @return the userLogin
	 */
	public String getUserLogin() {
		return userLogin;
	}
	/**
	 * @param userLogin the userLogin to set
	 */
	public void setUserLogin(String userLogin) {
		this.userLogin = userLogin;
	}
	/**
	 * @return the userPass
	 */
	public String getUserPass() {
		return userPass;
	}
	/**
	 * @param userPass the userPass to set
	 */
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	/**
	 * @return the userStatus
	 */
	public String getUserStatus() {
		return userStatus;
	}
	/**
	 * @param userStatus the userStatus to set
	 */
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the userBday
	 */
	public String getUserBday() {
		return userBday;
	}
	/**
	 * @param userBday the userBday to set
	 */
	public void setUserBday(String userBday) {
		this.userBday = userBday;
	}
	/**
	 * @return the userReg
	 */
	public String getUserReg() {
		return userReg;
	}
	/**
	 * @param userReg the userReg to set
	 */
	public void setUserReg(String userReg) {
		this.userReg = userReg;
	}
	
}
