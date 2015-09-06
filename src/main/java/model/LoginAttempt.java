package model;

public class LoginAttempt {
	
	private String logID="log_id";	
	private String userID="user_id";
	private String userName="(SELECT user_name FROM ssts.users where user_id= logattempt.user_id)";

	private String updateTime="updateTime";

//	Getters and Setters
	
	/**
	 * @return the logID
	 */
	public String getLogID() {
		return logID;
	}

	/**
	 * @param logID the logID to set
	 */
	public void setLogID(String logID) {
		this.logID = logID;
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
