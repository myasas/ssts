package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import configuration.ConfigurationMaster;
import configuration.StaticReferences;

// 1. Get a connection to database
//myConn = DriverManager.getConnection(url, user, password);
// 2. Create a statement
//myStmt = myConn.createStatement();
// 3. Execute SQL query
//4.Process the result set
/**
 * 
 * @author Yasas De Silva
 *
 */
public class DatabaseConnection {
	final Logger logger= Logger.getLogger(this.getClass());    
        private String driver;
        private String url;
        private String username;
        private String password;      
    
    private static DatabaseConnection instance = new DatabaseConnection();//placeholder for current singleton object
  
//private constructor - now no other object can instantiate
    private DatabaseConnection(){
    	PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);    	
    }
    
    public static DatabaseConnection getInstance(){//    Get the only object available
        if(instance==null){
            instance=new DatabaseConnection();}
        return instance;
    }

    
    private Connection getConnection() throws Exception
    {
    	
//Online-ThroughConfigurationFile        
	 ConfigurationMaster cm = new ConfigurationMaster();
	 cm = cm.configsFromConfigFile();
        driver = cm.getDbDriver();
        url = cm.getDbConURL();
        username = cm.getDbUserName();
        password = cm.getDbPassword();      
        
        Connection conn = null;
    ////Online-Direct        
//      String driver = "com.mysql.jdbc.Driver";
//      String url = "jdbc:mysql://ssts-server.bitnamiapp.com:3306/ssts";
//      String username = "root";
//      String password = "1qaz2wsx@";
        
      //Offline-Direct
//      driver = "com.mysql.jdbc.Driver";
//      url = "jdbc:mysql://localhost:3306/ssts";
//      username = "root";
//      password = "root";         
        try{
        	logger.info("Creating a database connection");
        Class.forName(driver);
        conn = DriverManager.getConnection(url, username, password);
        }catch(Exception e){
        	logger.error("Exception in creating database connection :| "+e);
        }
        return conn;
    }
        

    public void insertValues(String SQL) throws Exception
    {
        try{    	
        Connection conn = getConnection();
        Statement st = conn.createStatement();
        st.executeUpdate(SQL);
        conn.close();
        }catch(Exception e){
        	logger.error("Exception in inserting values to database :|"+e);
        }        
    }
    
    public ResultSet getValues(String SQL) throws Exception{
        ResultSet rs = null;
        try{
        Connection conn = getConnection(); //Connect to the database
        PreparedStatement pst=conn.prepareStatement(SQL);
        rs=pst.executeQuery();
        }catch(Exception e){
        	logger.error("Exception in generating a result set :|"+e);
        }

        return rs;
            
}
    
    public void updateValues(String SQL) throws Exception{
        try{
        Connection conn = getConnection(); //Connect to the database
        PreparedStatement pst=conn.prepareStatement(SQL);
        pst.executeUpdate();
        conn.close();        
        }catch(Exception e){
        	logger.error("Exception in updating values in database :|"+e);        	
        }
}    
    
    public PreparedStatement getPst (String SQL) throws Exception{
    	PreparedStatement pst = null;
        try{    	
        Connection conn = getConnection(); //Connect to the database
        pst=conn.prepareStatement(SQL);
        }catch(Exception e){
        	logger.error("Exception in obtaining a prepared statement from Database :|"+e);        	
        }        
        return pst;
    }
    
    public Statement getSt () throws Exception{    
    	Statement st = null;
        try{    	    	
        Connection conn = getConnection();
        st = conn.createStatement();
        }catch(Exception e){
        	logger.error("Exception in obtaining a Statement from Database :|"+e);        	
        }                
        return st;
    }    

 }
    
  

    
    

