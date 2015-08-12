package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import configuration.ConfigurationMaster;

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
    
        private String driver;
        private String url;
        private String username;
        private String password;      
    
    private static DatabaseConnection instance = new DatabaseConnection();//placeholder for current singleton object
    
    private DatabaseConnection(){}//private constructor - now no other object can instantiate
    
    public static DatabaseConnection getInstance(){//    Get the only object available
        if(instance==null){
            instance=new DatabaseConnection();}
        return instance;
    }
    
    
    private Connection getConnection() throws Exception
    {
//Online-Direct        
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://ssts-server.bitnamiapp.com:3306/ssts";
        String username = "root";
        String password = "1qaz2wsx@";

    	
////Online-ThroughConfigurationFile        
//	 ConfigurationMaster cm = new ConfigurationMaster();
//        driver = cm.configsFromConfigFile().getDbDriver();
//        url = cm.configsFromConfigFile().getDbConURL();
//        username = cm.configsFromConfigFile().getDbUserName();
//        password = cm.configsFromConfigFile().getDbConURL();      
        
      //Offline-Direct
//      driver = "com.mysql.jdbc.Driver";
//      url = "jdbc:mysql://localhost:3306/ssts";
//      username = "root";
//      password = "root";         
        
        Class.forName(driver);      
        return DriverManager.getConnection(url, username, password);
      
    }
        

    public void insertValues(String SQL) throws Exception
    {
        Connection conn = getConnection();
        Statement st = conn.createStatement();
        st.executeUpdate(SQL);
        conn.close();
    }
    
    public ResultSet getValues(String SQL) throws Exception{
        
        Connection conn = getConnection(); //Connect to the database
        PreparedStatement pst=conn.prepareStatement(SQL);
        ResultSet rs=pst.executeQuery();
        return rs;
            
}
    
    public void updateValues(String SQL) throws Exception{
        
        Connection conn = getConnection(); //Connect to the database
        PreparedStatement pst=conn.prepareStatement(SQL);
        pst.executeUpdate();
        conn.close();        
            
}    
    
    public PreparedStatement getPst (String SQL) throws Exception{
        Connection conn = getConnection(); //Connect to the database
        PreparedStatement pst=conn.prepareStatement(SQL);
        return pst;
    }
    
    public Statement getSt () throws Exception{    
        Connection conn = getConnection();
        Statement st = conn.createStatement();
        return st;
    }    

 }
    
  

    
    

