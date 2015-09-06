package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import configuration.StaticReferences;

import data.DatabaseConnection;
import model.LoginAttempt;

public class LoginAttemptDAO {
	private static final Logger LOGGER= Logger.getLogger(LoginAttemptDAO.class);
	
	public LoginAttemptDAO() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}
	
	   public void addLoginAttempt(LoginAttempt loginattempt) {
		   String SQLInsert = ("insert into logattempt(user_id) values (?)");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, loginattempt.getUserID());    	                	            
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in addLoginAttempt. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in addLoginAttempt. Exception ", e);
			}
	    }
	   
	    public List<LoginAttempt> getAllLoginAttempts() {
	        List<LoginAttempt> loginattempts = new ArrayList<LoginAttempt>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT log_id, user_id,(SELECT user_name FROM ssts.users where user_id= logattempt.user_id), updateTime FROM ssts.logattempt");
	            while (rs.next()) {
	            	LoginAttempt loginattempt = new LoginAttempt();
	            	loginattempt.setLogID(rs.getString("log_id"));
	            	loginattempt.setUserID(rs.getString("user_id"));
	            	loginattempt.setUserName(rs.getString("(SELECT user_name FROM ssts.users where user_id= logattempt.user_id)"));
	            	loginattempt.setUpdateTime(rs.getString("updateTime"));	
	                
	            	loginattempts.add(loginattempt);
	            }
	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in getAllLoginAttempts. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getAllLoginAttempts. Exception ", e);
			}

	        return loginattempts;
	    }
	    
	    public LoginAttempt getLoginInfoById(String loginInfoID) {
	    	LoginAttempt loginattempt = new LoginAttempt();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from logattempt where log_id=?");
	            preparedStatement.setString(1, loginInfoID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	loginattempt.setLogID(rs.getString("log_id"));
	            	loginattempt.setUserID(rs.getString("user_id"));	            	
	            	loginattempt.setUpdateTime(rs.getString("updateTime"));	
	
	
	            }
	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in LoginAttempt. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in LoginAttempt. Exception ", e);
			}
	        return loginattempt;
	    }	    
	    
	
}
