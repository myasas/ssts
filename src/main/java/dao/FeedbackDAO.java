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
import model.Feedback;

public class FeedbackDAO {
	private static final Logger LOGGER= Logger.getLogger(FeedbackDAO.class);
	
	public FeedbackDAO() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}
	
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
//			Log error	
			LOGGER.error("Error in getFeedbackBySettingValues. Exception ", e);
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
//				Log error	
				LOGGER.error("Error in addFeedback. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in addFeedback. Exception ", e);
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
//				Log error	
				LOGGER.error("Error in getAllFeedbacks. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getAllFeedbacks. Exception ", e);
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
//				Log error	
				LOGGER.error("Error in getFeedbackById. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getFeedbackById. Exception ", e);
			}
	        return feedback;
	    }	    
	
}
