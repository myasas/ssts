package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import model.UPUpdateHistory;;

public class UPUpdateHistoryDAO {
	
	   public void addUPUpdateHistory(UPUpdateHistory upUpdateHistory) {
		   String SQLInsert = ("insert into profileupdatehistory(update_by, update_on) values (?, ?)");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, upUpdateHistory.getUpdateByID());    	 
	            preparedStatement.setString(2, upUpdateHistory.getUpdateOnID());    	            
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
			}
	    }
	   
	    public List<UPUpdateHistory> getAllUPUpdateHistory() {
	        List<UPUpdateHistory> upUpdateHistoryList = new ArrayList<UPUpdateHistory>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT puh_id, update_by, update_on, (SELECT user_name FROM ssts.users where user_id= profileupdatehistory.update_by), (SELECT user_name FROM ssts.users where user_id= profileupdatehistory.update_on), updateTime FROM ssts.profileupdatehistory");
	            while (rs.next()) {
	            	UPUpdateHistory upUpdateHistory = new UPUpdateHistory();
	            	upUpdateHistory.setPuhID(rs.getString("puh_id"));
	            	upUpdateHistory.setUpdateByID(rs.getString("update_by"));
	            	upUpdateHistory.setUpdateOnID(rs.getString("update_on"));
	            	upUpdateHistory.setUpdateByName(rs.getString("(SELECT user_name FROM ssts.users where user_id= profileupdatehistory.update_by)"));
	            	upUpdateHistory.setUpdateOnName(rs.getString("(SELECT user_name FROM ssts.users where user_id= profileupdatehistory.update_on)"));
	            	upUpdateHistory.setUpdateTime(rs.getString("updateTime"));	
	                
	            	upUpdateHistoryList.add(upUpdateHistory);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}

	        return upUpdateHistoryList;
	    }
	    
	    public UPUpdateHistory getLoginInfoById(String upUpdateHustoryID) {
	    	UPUpdateHistory upUpdateHistory = new UPUpdateHistory();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from profileupdatehistory where puh_id=?");
	            preparedStatement.setString(1, upUpdateHustoryID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	upUpdateHistory.setPuhID(rs.getString("puh_id"));
	            	upUpdateHistory.setUpdateByID(rs.getString("update_by"));
	            	upUpdateHistory.setUpdateOnID(rs.getString("update_on"));	            	
	            	upUpdateHistory.setUpdateTime(rs.getString("updateTime"));	
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	        return upUpdateHistory;
	    }	    
	    
//	    public static void main(String[] args) {
//			UPUpdateHistory upuh = new UPUpdateHistory();
//			
//			upuh.setUpdateByID("16");
//			upuh.setUpdateOnID("16");			
//
//			UPUpdateHistoryDAO uph = new UPUpdateHistoryDAO();
//			
//			uph.addUPUpdateHistory(upuh);
//			
////			System.out.println(uph.getAllUPUpdateHustory());
//
//		}
	
}
