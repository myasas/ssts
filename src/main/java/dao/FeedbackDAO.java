package dao;

import java.sql.ResultSet;

import data.DatabaseConnection;

public class FeedbackDAO {
	
	private String fbID="fb_id";	
	private String userID="user_id";
	private String fbType="fb_type";
	private String fbCategory="fb_category";
	private String message="message";


	
	
	public static void main(String[] args) {
		FeedbackDAO fbd = new FeedbackDAO();
		fbd.setFbID("1");
		
		FeedbackDAO fbd2;
		fbd2 = fbd.getUserDAO(fbd);

		System.out.println(fbd2.getMessage());
	}
	
	
	public FeedbackDAO getUserDAO(FeedbackDAO feedbackDAO) {
		String SQL="select * from ssts.feedback where fb_id="+feedbackDAO.getUserID()+" && "
				+ "user_id="+feedbackDAO.getFbID()+" && "
				+ "fb_type="+feedbackDAO.getFbType()+" && "
				+ "fb_category="+feedbackDAO.getFbCategory()+" && "
				+ "message="+feedbackDAO.getMessage()+"";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				feedbackDAO.setFbID(rs.getString("fb_id"));
				feedbackDAO.setUserID(rs.getString("user_id"));
				feedbackDAO.setFbType(rs.getString("fb_type"));
				feedbackDAO.setFbCategory(rs.getString("fb_category"));
				feedbackDAO.setMessage(rs.getString("message"));				
		
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
		}
		return feedbackDAO;
	}


	/**
	 * @return the fbID
	 */
	public String getFbID() {
		return fbID;
	}


	/**
	 * @param fbID the fbID to set
	 */
	public void setFbID(String fbID) {
		this.fbID = fbID;
	}


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
	 * @return the fbType
	 */
	public String getFbType() {
		return fbType;
	}


	/**
	 * @param fbType the fbType to set
	 */
	public void setFbType(String fbType) {
		this.fbType = fbType;
	}


	/**
	 * @return the fbCategory
	 */
	public String getFbCategory() {
		return fbCategory;
	}


	/**
	 * @param fbCategory the fbCategory to set
	 */
	public void setFbCategory(String fbCategory) {
		this.fbCategory = fbCategory;
	}


	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}


	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
//	Getters and Setters


}
