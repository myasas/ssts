package configuration;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
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
	private static final Logger LOGGER= Logger.getLogger(ConfigurationMaster.class);
	public ConfigurationMaster() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}
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

     public Boolean saveConfigFile(JSONObject jsonObj) {
    	    	 
    	boolean isFileSaveSuccess=false;
    		try {
//Save configuration file in configuration location
     			LOGGER.info("Saving Configuration file");    			
    			FileWriter file = new FileWriter(configurationFileLocal);
    			file.write(jsonObj.toJSONString());
    			file.flush();
    			file.close();
    			isFileSaveSuccess = true;
    		} catch (IOException e) {
    			LOGGER.error("Exception in saving the Configuration file", e);
    		}
    		return isFileSaveSuccess;
	}
     
     public JSONArray readConfigFile(String configSetting) {
 		JSONParser parser = new JSONParser();
 		JSONArray configSettingArray = null;
 		try {
 			LOGGER.info("Reading Configuration file");
 			Object obj = parser.parse(new FileReader(configurationFileLocal));
 			JSONObject jsonObject = (JSONObject) obj;
 			// loop array
 			configSettingArray = (JSONArray) jsonObject.get(configSetting);
 			

 		} catch (FileNotFoundException e) {
 			LOGGER.error("Exception in Reading Configuration file", e);
 		} catch (IOException e) {
 			LOGGER.error("Exception in Reading Configuration file", e);
 		} catch (ParseException e) {
 			LOGGER.error("Exception in Reading Configuration file", e);
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