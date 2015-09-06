package model;

public class UPUpdateHistory {
	
	private String puhID="puh_id";	
	private String updateByID="update_by";
	private String updateOnID="update_on";	
	private String updateByName="(SELECT user_name FROM ssts.users where user_id= profileupdatehistory.update_by)";
	private String updateOnName="(SELECT user_name FROM ssts.users where user_id= profileupdatehistory.update_on)";	

	private String updateTime="updateTime";


//	Getters and Setters	
	/**
	 * @return the puhID
	 */
	public String getPuhID() {
		return puhID;
	}

	/**
	 * @param puhID the puhID to set
	 */
	public void setPuhID(String puhID) {
		this.puhID = puhID;
	}

	/**
	 * @return the updateByID
	 */
	public String getUpdateByID() {
		return updateByID;
	}

	/**
	 * @param updateByID the updateByID to set
	 */
	public void setUpdateByID(String updateByID) {
		this.updateByID = updateByID;
	}

	/**
	 * @return the updateOnID
	 */
	public String getUpdateOnID() {
		return updateOnID;
	}

	/**
	 * @param updateOnID the updateOnID to set
	 */
	public void setUpdateOnID(String updateOnID) {
		this.updateOnID = updateOnID;
	}

	/**
	 * @return the updateByName
	 */
	public String getUpdateByName() {
		return updateByName;
	}

	/**
	 * @param updateByName the updateByName to set
	 */
	public void setUpdateByName(String updateByName) {
		this.updateByName = updateByName;
	}

	/**
	 * @return the updateOnName
	 */
	public String getUpdateOnName() {
		return updateOnName;
	}

	/**
	 * @param updateOnName the updateOnName to set
	 */
	public void setUpdateOnName(String updateOnName) {
		this.updateOnName = updateOnName;
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
