package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import model.PwRequest;

public class PwRequestDAO {
	
	   public void addPwRequest(PwRequest pwrequest) {
		   String SQLInsert = ("insert into pwrequest(user_id) values (?)");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, pwrequest.getUserID());    	                	            
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
			}
	    }
	   
	    public List<PwRequest> getAllPwRequests() {
	        List<PwRequest> pwrequests = new ArrayList<PwRequest>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT log_id, user_id, (SELECT user_name FROM ssts.users where user_id= pwrequest.user_id), updateTime FROM ssts.pwrequest");
	            while (rs.next()) {
	            	PwRequest pwrequest = new PwRequest();
	            	pwrequest.setLogID(rs.getString("log_id"));
	            	pwrequest.setUserID(rs.getString("user_id"));
	            	pwrequest.setUserName(rs.getString("(SELECT user_name FROM ssts.users where user_id= pwrequest.user_id)"));
	            	pwrequest.setUpdateTime(rs.getString("updateTime"));	
	                
	            	pwrequests.add(pwrequest);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}

	        return pwrequests;
	    }
	    
	    public PwRequest getPwRequestById(String pwRequestID) {
	    	PwRequest logininfo = new PwRequest();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from pwrequest where log_id=?");
	            preparedStatement.setString(1, pwRequestID);
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
//			PwRequest pr = new PwRequest();
//			
//			pr.setUserID("16");
//
//			PwRequestDAO prDao = new PwRequestDAO();
//			
//			System.out.println(prDao.getAllPwRequests());
//
//		}
	
}
