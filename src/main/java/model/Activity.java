package model;

public class Activity {
	
	private String actID="act_id";	
	private String actSession="act_session";
	private String addedBy="added_by";
	private String addedByName="(SELECT user_name FROM ssts.users where user_id= activity.added_by)";
	private String addedOn="added_on";
	private int minID;
	private int maxID;
	
/**
	 * @return the minID
	 */
	public int getMinID() {
		return minID;
	}


	/**
	 * @param minID the minID to set
	 */
	public void setMinID(int minID) {
		this.minID = minID;
	}


	/**
	 * @return the maxID
	 */
	public int getMaxID() {
		return maxID;
	}


	/**
	 * @param maxID the maxID to set
	 */
	public void setMaxID(int maxID) {
		this.maxID = maxID;
	}


	//	Getters and Setters
	/**
	 * @return the actID
	 */
	public String getActID() {
		return actID;
	}


	/**
	 * @param actID the actID to set
	 */
	public void setActID(String actID) {
		this.actID = actID;
	}


	/**
	 * @return the actSession
	 */
	public String getActSession() {
		return actSession;
	}


	/**
	 * @param actSession the actSession to set
	 */
	public void setActSession(String actSession) {
		this.actSession = actSession;
	}


	/**
	 * @return the addedBy
	 */
	public String getAddedBy() {
		return addedBy;
	}


	/**
	 * @param addedBy the addedBy to set
	 */
	public void setAddedBy(String addedBy) {
		this.addedBy = addedBy;
	}


	/**
	 * @return the addedOn
	 */
	public String getAddedOn() {
		return addedOn;
	}


	/**
	 * @param addedOn the addedOn to set
	 */
	public void setAddedOn(String addedOn) {
		this.addedOn = addedOn;
	}


	/**
	 * @return the addedByName
	 */
	public String getAddedByName() {
		return addedByName;
	}


	/**
	 * @param addedByName the addedByName to set
	 */
	public void setAddedByName(String addedByName) {
		this.addedByName = addedByName;
	}

	



}
