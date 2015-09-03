package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import model.Feedback;

public class FeedbackDAO {
	
	public Feedback getFeedbackBySettingValues(Feedback feedback) {
		String SQL="select * from ssts.feedback where fb_id="+feedback.getUserID()+" && "
				+ "user_id="+feedback.getFbID()+" && "
				+ "fb_type="+feedback.getFbType()+" && "
				+ "fb_category="+feedback.getFbCategory()+" && "
				+ "message="+feedback.getMessage()+"";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				feedback.setFbID(rs.getString("fb_id"));
				feedback.setUserID(rs.getString("user_id"));
				feedback.setFbType(rs.getString("fb_type"));
				feedback.setFbCategory(rs.getString("fb_category"));
				feedback.setMessage(rs.getString("message"));				
		
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
		}
		return feedback;
	}
	
	
	   public void addFeedback(Feedback feedback) {
		   String SQLInsert = ("insert into feedback(user_id, fb_type, fb_category, message) values (?, ?, ?, ?)");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, feedback.getUserID());    	            
	            preparedStatement.setString(2, feedback.getFbType());    
	            preparedStatement.setString(3, feedback.getFbCategory());  
	            preparedStatement.setString(4, feedback.getMessage());      	            
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
			}
	    }
	   
	    public List<Feedback> getAllFeedbacks() {
	        List<Feedback> feedbacks = new ArrayList<Feedback>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT fb_id, user_id,(SELECT user_name FROM ssts.users where user_id= feedback.user_id) , fb_type, fb_category, message, updateTime FROM ssts.feedback");
	            while (rs.next()) {
	            	Feedback feedback = new Feedback();
	            	feedback.setFbID(rs.getString("fb_id"));
	            	feedback.setFbType(rs.getString("fb_type"));
	            	feedback.setFbCategory(rs.getString("fb_category"));
	            	feedback.setMessage(rs.getString("message"));
	            	feedback.setUserID(rs.getString("user_id"));	            	
	            	feedback.setUserName(rs.getString("(SELECT user_name FROM ssts.users where user_id= feedback.user_id)"));	            	
	            	feedback.setUpdateTime(rs.getString("updateTime"));	
	                
	            	feedbacks.add(feedback);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}

	        return feedbacks;
	    }
	    
	    public Feedback getFeedbackById(String feedbackID) {
	        Feedback feedback = new Feedback();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from feedback where fb_id=?");
	            preparedStatement.setString(1, feedbackID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	               	feedback.setFbID(rs.getString("fb_id"));            	
	            	feedback.setFbType(rs.getString("fb_type"));
	            	feedback.setFbCategory(rs.getString("fb_category"));
	            	feedback.setUserID(rs.getString("user_id"));	
	            	feedback.setMessage(rs.getString("message"));
	            	feedback.setUpdateTime(rs.getString("updateTime"));			
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	        return feedback;
	    }	    
	    
//	    public static void main(String[] args) {
//			Feedback fb = new Feedback();
////			fb.setUserID("16");
////			fb.setFbType("Idea");
////			fb.setMessage("Idea TestDB");
////			fb.setMessage("Message 123456");
//			FeedbackDAO dbDao = new FeedbackDAO();
//			System.out.println(dbDao.getFeedbackById("23").getUpdateTime());
//
//		}
	
}
