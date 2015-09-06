package model;

public class UPHistory {
	
	private String phID="ph_id";	
	private String phUserID="user_id";
	private String phUserName="(SELECT user_name FROM ssts.users where user_id= profilehistory.user_id)";
	private String phLessonID="lesson_id";	
	private String phLessonType="lesson_type";
	private String phScore="score";
	private String phResults="";
	private String updateTime="updateTime";
	
	private String xAxisValuesForUser;
	private String yAxisValuesForUser;


//	Getters and Setters	

	/**
	 * @return the phID
	 */
	public String getPhID() {
		return phID;
	}


	/**
	 * @param phID the phID to set
	 */
	public void setPhID(String phID) {
		this.phID = phID;
	}


	/**
	 * @return the phUserID
	 */
	public String getPhUserID() {
		return phUserID;
	}


	/**
	 * @param phUserID the phUserID to set
	 */
	public void setPhUserID(String phUserID) {
		this.phUserID = phUserID;
	}


	/**
	 * @return the phLessonID
	 */
	public String getPhLessonID() {
		return phLessonID;
	}


	/**
	 * @param phLessonID the phLessonID to set
	 */
	public void setPhLessonID(String phLessonID) {
		this.phLessonID = phLessonID;
	}


	/**
	 * @return the phLessonType
	 */
	public String getPhLessonType() {
		return phLessonType;
	}


	/**
	 * @param phLessonType the phLessonType to set
	 */
	public void setPhLessonType(String phLessonType) {
		this.phLessonType = phLessonType;
	}


	/**
	 * @return the phScore
	 */
	public String getPhScore() {
		return phScore;
	}


	/**
	 * @param phScore the phScore to set
	 */
	public void setPhScore(String phScore) {
		this.phScore = phScore;
	}


	/**
	 * @return the phResults
	 */
	public String getPhResults() {
		return phResults;
	}


	/**
	 * @param phResults the phResults to set
	 */
	public void setPhResults(String phResults) {
		this.phResults = phResults;
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


	/**
	 * @return the phUserName
	 */
	public String getPhUserName() {
		return phUserName;
	}


	/**
	 * @param phUserName the phUserName to set
	 */
	public void setPhUserName(String phUserName) {
		this.phUserName = phUserName;
	}


	/**
	 * @return the xAxisValuesForUser
	 */
	public String getxAxisValuesForUser() {
		return xAxisValuesForUser;
	}


	/**
	 * @param xAxisValuesForUser the xAxisValuesForUser to set
	 */
	public void setxAxisValuesForUser(String xAxisValuesForUser) {
		this.xAxisValuesForUser = xAxisValuesForUser;
	}


	/**
	 * @return the yAxisValuesForUser
	 */
	public String getyAxisValuesForUser() {
		return yAxisValuesForUser;
	}


	/**
	 * @param yAxisValuesForUser the yAxisValuesForUser to set
	 */
	public void setyAxisValuesForUser(String yAxisValuesForUser) {
		this.yAxisValuesForUser = yAxisValuesForUser;
	}

	
	
	
}
