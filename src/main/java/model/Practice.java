package model;

public class Practice {
	
	private String pracID="prac_id";	
	private String pracCharacter="prac_character";
	private String pracSession="prac_session";
	private String pracUrl="prac_url";	
	private String addedBy="added_by";
	private String addedByName="(SELECT user_name FROM ssts.users where user_id= practice.added_by)";
	private String addedOn="added_on";
	private int minID;
	private int maxID;
	
	
	/**
	 * @return the pracID
	 */
	public String getPracID() {
		return pracID;
	}
	/**
	 * @param pracID the pracID to set
	 */
	public void setPracID(String pracID) {
		this.pracID = pracID;
	}
	/**
	 * @return the pracCharacter
	 */
	public String getPracCharacter() {
		return pracCharacter;
	}
	/**
	 * @param pracCharacter the pracCharacter to set
	 */
	public void setPracCharacter(String pracCharacter) {
		this.pracCharacter = pracCharacter;
	}
	/**
	 * @return the pracSession
	 */
	public String getPracSession() {
		return pracSession;
	}
	/**
	 * @param pracSession the pracSession to set
	 */
	public void setPracSession(String pracSession) {
		this.pracSession = pracSession;
	}
	/**
	 * @return the pracUrl
	 */
	public String getPracUrl() {
		return pracUrl;
	}
	/**
	 * @param pracUrl the pracUrl to set
	 */
	public void setPracUrl(String pracUrl) {
		this.pracUrl = pracUrl;
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
	
	
	
}
