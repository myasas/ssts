package model;

public class Feedback {
	
	private String fbID="fb_id";	
	private String fbType="fb_type";
	private String fbCategory="fb_category";
	private String message="message";
	private String userID="user_id";
	private String userName="(SELECT user_name FROM ssts.users where user_id= feedback.user_id)";		
	private String updateTime="updateTime";

//	Getters and Setters
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
	 * @return the updateTime
	 */
	public String getUpdateTime() {
		return updateTime;
	}


	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	



}
