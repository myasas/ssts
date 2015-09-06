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
import model.LoginInfo;

public class LoginInfoDAO {
	private static final Logger LOGGER= Logger.getLogger(LoginInfoDAO.class);
	
	public LoginInfoDAO() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}
	   public void addLoginInfo(LoginInfo logininfo) {
		   String SQLInsert = ("insert into logininfo(user_id) values (?)");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, logininfo.getUserID());    	                	            
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in addLoginInfo. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in addLoginInfo. Exception ", e);
			}
	    }
	   
	    public List<LoginInfo> getAllLoginInfos() {
	        List<LoginInfo> logininfos = new ArrayList<LoginInfo>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT log_id, user_id, (SELECT user_name FROM ssts.users where user_id= logininfo.user_id), updateTime FROM ssts.logininfo");
	            while (rs.next()) {
	            	LoginInfo logininfo = new LoginInfo();
	            	logininfo.setLogID(rs.getString("log_id"));
	            	logininfo.setUserID(rs.getString("user_id"));
	            	logininfo.setUserName(rs.getString("(SELECT user_name FROM ssts.users where user_id= logininfo.user_id)"));
	            	logininfo.setUpdateTime(rs.getString("updateTime"));	
	                
	            	logininfos.add(logininfo);
	            }
	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in getAllLoginInfos. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getAllLoginInfos. Exception ", e);
			}

	        return logininfos;
	    }
	    
	    public LoginInfo getLoginInfoById(String loginInfoID) {
	    	LoginInfo logininfo = new LoginInfo();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from logininfo where log_id=?");
	            preparedStatement.setString(1, loginInfoID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	logininfo.setLogID(rs.getString("log_id"));            	
	            	logininfo.setUserID(rs.getString("user_id"));
	            	logininfo.setUpdateTime(rs.getString("updateTime"));
	
	
	            }
	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in getLoginInfoById. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getLoginInfoById. Exception ", e);
			}
	        return logininfo;
	    }	    
	    
//	    public static void main(String[] args) {
//			LoginInfo li = new LoginInfo();
//			
//			li.setUserID("16");
//
//			LoginInfoDAO liDao = new LoginInfoDAO();
//			
//			liDao.addLoginInfo(li);
//
//		}
	
}
