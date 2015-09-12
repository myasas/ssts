package model;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * 
 * @author Yasas De Silva
 *
 */
public class StutteredSpeech {
	private String userID="user_id";	
	private String userName="(SELECT user_name FROM ssts.users where user_id= stutteredspeech.user_id)";		
	private String repeatedData="rp_data";
	private String updateTime="updateTime";

	//For representation
//	private ArrayList<String> repeatedWordsArrayOut;
//    private ArrayList<Integer> caughtIndexArrayOut;
//    private HashMap<String, Integer> stutteredWordsnCountsHashMap;

//  Getters and Setter    
	
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
	 * @return the repeatedData
	 */
	public String getRepeatedData() {
		return repeatedData;
	}

	/**
	 * @param repeatedData the repeatedData to set
	 */
	public void setRepeatedData(String repeatedData) {
		this.repeatedData = repeatedData;
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
	
}
