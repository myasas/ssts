package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import data.DatabaseConnection;
import model.UPHistory;;

public class UPHistoryDAO {
	
	   private static final String String = null;


	public void addUPHistory(UPHistory upHistory) {
		   String SQLInsert = ("insert into profilehistory(user_id, lesson_id, lesson_type, score, results) values (?, ?, ?, ?, ?)");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, upHistory.getPhUserID());    	 
	            preparedStatement.setString(2, upHistory.getPhLessonID());    
	            preparedStatement.setString(3, upHistory.getPhLessonType());    
	            preparedStatement.setString(4, upHistory.getPhScore());    
	            preparedStatement.setString(5, upHistory.getPhResults());    
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
			}
	    }
	   
	    public List<UPHistory> getAllUPHistory() {
	        List<UPHistory> upHistoryList = new ArrayList<UPHistory>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT ph_id, user_id, (SELECT user_name FROM ssts.users where user_id= profilehistory.user_id), lesson_id, lesson_type, score, results, updateTime FROM ssts.profilehistory");
	            while (rs.next()) {
	            	UPHistory upHistory = new UPHistory();
	            	upHistory.setPhID(rs.getString("ph_id"));
	            	upHistory.setPhUserID(rs.getString("user_id"));
	            	upHistory.setPhUserName(rs.getString("(SELECT user_name FROM ssts.users where user_id= profilehistory.user_id)"));
	            	upHistory.setPhLessonID(rs.getString("lesson_id"));	
	            	upHistory.setPhLessonType(rs.getString("lesson_type"));	
	            	upHistory.setPhScore(rs.getString("score"));	
	            	upHistory.setPhResults(rs.getString("results"));	

	            	upHistory.setUpdateTime(rs.getString("updateTime"));	
	                
	            	upHistoryList.add(upHistory);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}

	        return upHistoryList;
	    }
	    
	    
	    public List<UPHistory> getAllUPHistoryForUserID(String userID) {
	        List<UPHistory> upHistoryList = new ArrayList<UPHistory>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT ph_id, user_id, (SELECT user_name FROM ssts.users where user_id= profilehistory.user_id), lesson_id, lesson_type, score, results, updateTime FROM ssts.profilehistory where user_id="+userID+"");
	            while (rs.next()) {
	            	UPHistory upHistory = new UPHistory();
	            	upHistory.setPhID(rs.getString("ph_id"));
	            	upHistory.setPhUserID(rs.getString("user_id"));
	            	upHistory.setPhUserName(rs.getString("(SELECT user_name FROM ssts.users where user_id= profilehistory.user_id)"));
	            	upHistory.setPhLessonID(rs.getString("lesson_id"));	
	            	upHistory.setPhLessonType(rs.getString("lesson_type"));	
	            	upHistory.setPhScore(rs.getString("score"));	
	            	upHistory.setPhResults(rs.getString("results"));	

	            	upHistory.setUpdateTime(rs.getString("updateTime"));	
	                
	            	upHistoryList.add(upHistory);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}

	        return upHistoryList;
	    }	    
	    
	    public UPHistory getUPHistoryById(String upHistoryID) {
	    	UPHistory upHistory = new UPHistory();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from profilehistory where ph_id=?");
	            preparedStatement.setString(1, upHistoryID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	upHistory.setPhID(rs.getString("ph_id"));
	            	upHistory.setPhUserID(rs.getString("user_id"));
	            	upHistory.setPhLessonID(rs.getString("lesson_id"));	
	            	upHistory.setPhLessonType(rs.getString("lesson_type"));	
	            	upHistory.setPhScore(rs.getString("score"));	
	            	upHistory.setPhResults(rs.getString("results"));	

	            	upHistory.setUpdateTime(rs.getString("updateTime"));	
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	        return upHistory;
	    }	    
	    
	    
	    public UPHistory getProgressGraphData(String userID){
	    	UPHistory uph = new UPHistory();
	    	UPHistoryDAO uphDao = new UPHistoryDAO();
	    	
	    	StringBuilder sbLessonNameandIds = new StringBuilder();
	    	StringBuilder sbLessonScores = new StringBuilder();
	    	
	    	for (UPHistory temp : uphDao.getAllUPHistoryForUserID(userID)) {
	    		sbLessonNameandIds.append("'"+temp.getPhLessonType()+temp.getPhLessonID()+"',");
	    		sbLessonScores.append(temp.getPhScore()+",");
			}	    	
	    	uph.setxAxisValuesForUser(sbLessonNameandIds.toString());
	    	uph.setyAxisValuesForUser(sbLessonScores.toString());
	    	
	    	return uph;
	    }
	    
	    
//	    public static void main(String[] args) {
//	    	UPHistory uph = new UPHistory();
//	    	UPHistoryDAO uphDao = new UPHistoryDAO();
//	    	
//	    	uph=uphDao.getProgressGraphData("3");
//	    	System.out.println(uph.getxAxisValuesForUser());
//	    	System.out.println(uph.getyAxisValuesForUser());
//	    	
////			uph.setPhUserID("16");
////			uph.setPhLessonID("3");
////			uph.setPhLessonType("activity");
////			uph.setPhScore("33");
////			uph.setPhResults("I am");
//
//			
////			uphDao.addUPHistory(uph);
//		}
	
}
