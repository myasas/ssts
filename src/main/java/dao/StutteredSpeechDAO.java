package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import configuration.StaticReferences;
import data.DatabaseConnection;
import model.StutteredSpeech;

public class StutteredSpeechDAO {
	private static final Logger LOGGER= Logger.getLogger(StutteredSpeechDAO.class);
	public StutteredSpeechDAO() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}

	   public void addStuttreredSpeech(StutteredSpeech stutteredSpeech) {
		   String SQLInsert = ("insert into stutteredspeech(user_id, rp_data) values (?, ?)");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, stutteredSpeech.getUserID());
	            preparedStatement.setString(2, stutteredSpeech.getRepeatedData());        
	            preparedStatement.executeUpdate();
//				Close Connection	            
	            preparedStatement.getConnection().close();
//				Close PreparedStatement
	            preparedStatement.close();	            
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in addStuttreredSpeech. SQL Exception", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in addStuttreredSpeech. Exception", e);
			}
	    }	
		
	    public void updateStutteredSpeech(StutteredSpeech stutteredSpeech) {
	    	String SQLUpdate = ("update stutteredspeech set rp_data=? where user_id=?");
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLUpdate);
	            // Parameters start with 1
	            preparedStatement.setString(1, stutteredSpeech.getRepeatedData());	            
	            preparedStatement.setString(2, stutteredSpeech.getUserID());	            
	            preparedStatement.executeUpdate();
//				Close Connection	            
	            preparedStatement.getConnection().close();
//				Close PreparedStatement
	            preparedStatement.close();	   
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in updateStutteredSpeech. SQL Exception", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in updateStutteredSpeech. Exception", e);
			}
	    }
	   
	    
	    public List<StutteredSpeech> getAllStutteredSpeech() {
	        List<StutteredSpeech> stutteredSpeechList = new ArrayList<StutteredSpeech>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT user_id,(SELECT user_name FROM ssts.users where user_id= stutteredspeech.user_id), rp_data, updateTime from stutteredspeech");
	            while (rs.next()) {
	            	StutteredSpeech stutteredSpeech = new StutteredSpeech();
	            	stutteredSpeech.setUserID(rs.getString("user_id"));
	            	stutteredSpeech.setUserName(rs.getString("(SELECT user_name FROM ssts.users where user_id= stutteredspeech.user_id)"));
	            	stutteredSpeech.setRepeatedData(rs.getString("rp_data"));
	            	stutteredSpeech.setUpdateTime(rs.getString("updateTime"));
	                
	            	stutteredSpeechList.add(stutteredSpeech);
	            }
//				Close Connection	            
	            statement.getConnection().close();
//				Close Statement
	            statement.close();	   	            
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in getAllStutteredSpeech. SQL Exception", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getAllStutteredSpeech. Exception", e);
			}

	        return stutteredSpeechList;
	    }
	       
	    
	    public StutteredSpeech getStutteredSpeechByUserId(String stutteredSpeechUserID) {
	    	StutteredSpeech stutteredSpeech = new StutteredSpeech();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("SELECT user_id,(SELECT user_name FROM ssts.users where user_id= stutteredspeech.user_id), rp_data, updateTime from stutteredspeech where user_id=?");
	            preparedStatement.setString(1, stutteredSpeechUserID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	stutteredSpeech.setUserID(rs.getString("user_id"));
	            	stutteredSpeech.setUserName(rs.getString("(SELECT user_name FROM ssts.users where user_id= stutteredspeech.user_id)"));
	            	stutteredSpeech.setRepeatedData(rs.getString("rp_data"));
	            	stutteredSpeech.setUpdateTime(rs.getString("updateTime"));	
	            }
//				Close Connection	            
	            preparedStatement.getConnection().close();
//				Close PreparedStatment
	            preparedStatement.close();	   
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in getStutteredSpeechByUserId. SQL Exception",e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getStutteredSpeechByUserId. Exception",e);
			}
	        return stutteredSpeech;
	    }		    
	    
	    public void deleteStutteredSpeech(String stutteredSpeechUserID) {
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("delete from stutteredspeech where user_id=?");
	            // Parameters start with 1
	            preparedStatement.setString(1, stutteredSpeechUserID);
	            preparedStatement.executeUpdate();
//				Close Connection	            
	            preparedStatement.getConnection().close();
//				Close PreparedStatment
	            preparedStatement.close();	   
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in deleteStutteredSpeech. SQL Exception",e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in deleteStutteredSpeech. Exception",e);
			}
	    }	    

	
	public HashMap<String, Integer> jsonToHashMap(String jsonString) {
	    HashMap<String, Integer> hashMap = new Gson().fromJson(jsonString, new TypeToken<HashMap<String, Integer>>(){}.getType());
	    return hashMap;  
	}
	
	public String hashMapToJson(HashMap<String, Integer> hashMap) {
		HashMap<String, Object> data = new HashMap<String, Object>();
	    JSONObject json = new JSONObject();
	    json.putAll( hashMap );
	    String jsonString = json.toString();
	    
	    return jsonString;
	}		
	
	public HashMap<String, Integer> getStutteredSpeechHashMap(String userID) {
//		get Json String from DB
		StutteredSpeechDAO stspDao = new StutteredSpeechDAO();
		StutteredSpeech stsp = new StutteredSpeech(); 
		stsp = stspDao.getStutteredSpeechByUserId(userID);//1st Database Query - Delay is expected at the Front end
		
		HashMap<String, Integer> stutteredSpeechHashMap = new HashMap<String, Integer>();
		
		String repeatedDataJson = stsp.getRepeatedData();
		
	    if (repeatedDataJson.equals("rp_data")) {
//	    	This means no repeated data record in db. So Do nothing
	    }else{
//			convert Json String to a HashMap	    	
	    	stutteredSpeechHashMap = stspDao.jsonToHashMap(repeatedDataJson);
	    }
		return stutteredSpeechHashMap;
	}
	
	public String getStutteredSpeechString(String userID){
		StutteredSpeechDAO stspDao = new StutteredSpeechDAO();		
		HashMap<String, Integer> stutteredSpeechHashMap = new HashMap<String, Integer>();
		ArrayList<String> stutteredSpeechArrayList = new ArrayList<>();	 	
		StringBuilder stutteredSpeechSB = new StringBuilder();	

		stutteredSpeechHashMap = stspDao.getStutteredSpeechHashMap(userID);
		//Copy the stuttered words into Array List
	    for ( String currentWord : stutteredSpeechHashMap.keySet() ) {
	    	stutteredSpeechArrayList.add(currentWord);
	    }
	    //Copy the Array List into a String builder and delete starting and ending brackets
	    stutteredSpeechSB.append(stutteredSpeechArrayList.toString());
		
	    stutteredSpeechSB.deleteCharAt(0);		
	    stutteredSpeechSB.deleteCharAt(stutteredSpeechSB.length()-1);
		
	    return stutteredSpeechSB.toString();	
	}
	
	public void insertStutteredSpeechHashMap(String userID, HashMap<String, Integer> newStutteredWordsHashMap) {
//		get Json String from DB
		StutteredSpeechDAO stspDao = new StutteredSpeechDAO();
		StutteredSpeech stsp = new StutteredSpeech(); 
		stsp = stspDao.getStutteredSpeechByUserId(userID);//1st Database Query - Delay is expected at the Front end
		
		String repeatedDataJson = stsp.getRepeatedData();
		
		//Check if a record exists		
	    if (repeatedDataJson.equals("rp_data")) {
			//Record does not exist
//	    	Add new Repeat data
	    	stsp.setUserID(userID);
	    	stsp.setRepeatedData(stspDao.hashMapToJson(newStutteredWordsHashMap));	
	    	stspDao.addStuttreredSpeech(stsp);//2nd Database Query - Delay is expected at the Front end
	    }else{
			//Record exists	    	    	
//	    	Get the existing HashMap from JsonString
	    	HashMap<String, Integer> existingStutteredWordsHashMap = stspDao.jsonToHashMap(repeatedDataJson);
//	    	Update the HashMap Values
		    for ( String currentWord : newStutteredWordsHashMap.keySet() ) {
                int newCountOfCurrentWord = newStutteredWordsHashMap.get(currentWord);	
                //Stuttered word exists in existing hash map
				if (existingStutteredWordsHashMap.get(currentWord) != null) {
					int existingCountOfCurrentWord = existingStutteredWordsHashMap.get(currentWord);
					existingStutteredWordsHashMap.put(currentWord.toLowerCase(),
							(existingCountOfCurrentWord + newCountOfCurrentWord));
				// Stuttered word does not exist in existing hash map
				} else {
					existingStutteredWordsHashMap.put(currentWord.toLowerCase(), newCountOfCurrentWord);
				}        
		    }	    	
//	    	Convert the HashMap to JsonString	    
//	    	Update existing Repeat Data
		stsp.setRepeatedData(stspDao.hashMapToJson(existingStutteredWordsHashMap));
	    stspDao.updateStutteredSpeech(stsp);//2nd Database Query - Delay is expected at the Front end		 
	    }
	}
	
//	public static void main(String[] args) {
//		StutteredSpeechDAO dao = new StutteredSpeechDAO();
//		System.out.println("Stuttered words :" +dao.getStutteredSpeechString("16"));
//
//
//	}
	
	
}
