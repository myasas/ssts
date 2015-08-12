package configuration;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
/**
 * 
 * @author Yasas De Silva
 *
 */
public class ConfigurationMaster {

//	Configuration file location and name
	private final static String configurationFileLocal = StaticReferences.configurationFile;
//	Database related references
	private String dbDriver="dbDriverNotSet";
	private String dbConURL="conURLNotSet";
	private String dbUserName="dbUserNameNotSet";
	private String dbPassword="dbPasswordNotSet";
//	Email related references	
	private String emailUserName="emailUserNameNotSet";
	private String emailPassword="emailPasswordNotSet";
	

	@SuppressWarnings("unchecked")
	public JSONObject addConfigSettings() {
    		JSONObject jsonObj = new JSONObject();
//Insert dbconfiguration to JsonArray
    		JSONArray dbConfig = new JSONArray();
    		dbConfig.add(dbDriver);
    		dbConfig.add(dbConURL);
    		dbConfig.add(dbUserName);
    		dbConfig.add(dbPassword);
//Insert email configuration to JsonArray    		
    		JSONArray emailConfig = new JSONArray();
    		emailConfig.add(emailUserName);    		
    		emailConfig.add(emailPassword);    
//Put Json arrays onto JsonObject    		
    		jsonObj.put(StaticReferences.configurationTagDB, dbConfig);
    		jsonObj.put(StaticReferences.configurationTagEmail, emailConfig);    		
    		
    		return jsonObj;
	}

     public void saveConfigFile(JSONObject jsonObj) {
    		try {
//Save configuration file in configuration location
    			FileWriter file = new FileWriter(configurationFileLocal);
    			file.write(jsonObj.toJSONString());
    			file.flush();
    			file.close();
    			
//    			System.out.print(jsonObj);
    		} catch (IOException e) {
    			System.out.println("Exception in saving the Configuration file. Exception: "+e);
    		}

	}
     
     public JSONArray readConfigFile(String configSetting) {
 		JSONParser parser = new JSONParser();
 		JSONArray configSettingArray = null;
 		try {

 			Object obj = parser.parse(new FileReader(configurationFileLocal));
 			JSONObject jsonObject = (JSONObject) obj;

 			// loop array
 			configSettingArray = (JSONArray) jsonObject.get(configSetting);
 			
// 			@SuppressWarnings("unchecked")
//			Iterator<String> iterator = configSettingArray.iterator();
// 			while (iterator.hasNext()) {
// 				System.out.println(iterator.next());
// 			}

 		} catch (FileNotFoundException e) {
 			e.printStackTrace();
 		} catch (IOException e) {
 			e.printStackTrace();
 		} catch (ParseException e) {
 			e.printStackTrace();
 		}
 		return configSettingArray;
	}     
     
     public ConfigurationMaster configsFromConfigFile() {
    	 
    	 ConfigurationMaster cm = new ConfigurationMaster();
    	 
    	 JSONArray dbConfigsArray=cm.readConfigFile(StaticReferences.configurationTagDB);
    	 JSONArray emailConfigsArray= cm.readConfigFile(StaticReferences.configurationTagEmail);
    	 
    	 cm.setDbDriver(dbConfigsArray.get(0).toString());
    	 cm.setDbConURL(dbConfigsArray.get(1).toString());
    	 cm.setDbUserName(dbConfigsArray.get(2).toString());
    	 cm.setDbPassword(dbConfigsArray.get(3).toString());
    	 
    	 cm.setEmailUserName(emailConfigsArray.get(0).toString());
    	 cm.setEmailPassword(emailConfigsArray.get(1).toString());    	 

    	 return cm;
	}
     
//     Getters and Setters
	/**
	 * @return the dbDriver
	 */
	public String getDbDriver() {
		return dbDriver;
	}

	/**
	 * @param dbDriver the dbDriver to set
	 */
	public void setDbDriver(String dbDriver) {
		this.dbDriver = dbDriver;
	}

	/**
	 * @return the dbConURL
	 */
	public String getDbConURL() {
		return dbConURL;
	}

	/**
	 * @param dbConURL the dbConURL to set
	 */
	public void setDbConURL(String conURL) {
		this.dbConURL = conURL;
	}

	/**
	 * @return the dbUserName
	 */
	public String getDbUserName() {
		return dbUserName;
	}

	/**
	 * @param dbUserName the dbUserName to set
	 */
	public void setDbUserName(String dbUserName) {
		this.dbUserName = dbUserName;
	}

	/**
	 * @return the dbPassword
	 */
	public String getDbPassword() {
		return dbPassword;
	}

	/**
	 * @param dbPassword the dbPassword to set
	 */
	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}

	/**
	 * @return the emailUserName
	 */
	public String getEmailUserName() {
		return emailUserName;
	}

	/**
	 * @param emailUserName the emailUserName to set
	 */
	public void setEmailUserName(String emailUserName) {
		this.emailUserName = emailUserName;
	}

	/**
	 * @return the emailPassword
	 */
	public String getEmailPassword() {
		return emailPassword;
	}

	/**
	 * @param emailPassword the emailPassword to set
	 */
	public void setEmailPassword(String emailPassword) {
		this.emailPassword = emailPassword;
	}
     
//	Main method written for TDD-Test Driven Development
//  public static void main(String[] args) {
////Reading settings
//	 ConfigurationMaster cm = new ConfigurationMaster();
//	 System.out.println(cm.configsFromConfigFile().getDbConURL());
//	 System.out.println(cm.configsFromConfigFile().getDbDriver());
//	 System.out.println(cm.configsFromConfigFile().getDbUserName());
//	 System.out.println(cm.configsFromConfigFile().getDbConURL());
//	 System.out.println(cm.configsFromConfigFile().getEmailUserName());
//	 System.out.println(cm.configsFromConfigFile().getEmailPassword()); 
////Saving settings
//	cm.setDbDriver("A");
//	cm.setDbConURL("B");
//	cm.setDbUserName("C");
//	cm.setDbPassword("D");
//	cm.setEmailUserName("E");
//	cm.setEmailPassword("F"); 
//	cm.saveConfigFile(cm.addConfigSettings());	 
//  }	
	
}