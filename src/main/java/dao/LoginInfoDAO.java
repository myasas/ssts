package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import model.LoginInfo;

public class LoginInfoDAO {
	
	   public void addLoginInfo(LoginInfo logininfo) {
		   String SQLInsert = ("insert into logininfo(user_id) values (?)");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, logininfo.getUserID());    	                	            
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
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
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
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
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
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
