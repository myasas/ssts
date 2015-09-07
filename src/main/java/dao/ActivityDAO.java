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
import model.Activity;

public class ActivityDAO {
	private static final Logger LOGGER= Logger.getLogger(ActivityDAO.class);
	public ActivityDAO() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}

	/**
	 * 
	 * @param activity should set the activity values which are to receive from the database
	 * @return returns the values from the database
	 */
	public Activity getActivityBySettingValues(Activity activity) {
		String SQL="select * from ssts.activity where act_id="+activity.getActID()+" && "
				+ "act_session="+activity.getActSession()+" && "
				+ "added_by="+activity.getAddedBy()+" && "
				+ "added_on="+activity.getAddedOn()+"";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				activity.setActID(rs.getString("act_id"));
				activity.setActSession(rs.getString("act_session"));
				activity.setAddedBy(rs.getString("added_by"));
				activity.setAddedOn(rs.getString("added_on"));			
			}
//			Close Connection
			rs.getStatement().getConnection().close();
		} catch (Exception e) {
//			Log error
			LOGGER.error("Error in getActivityBySettingValues. Exception", e);
		}
		return activity;
	}

	
	/**
	 * 
	 * @param activity should set the activity values which are to receive from the database
	 * @return returns the values along with MinID and MaxID in the table from the database
	 */
	public Activity getActivityWithMinMaxIDBySettingValues(Activity activity) {
		String SQL="select *, min(act_id), max(act_id) from ssts.activity where act_id="+activity.getActID()+" && "
				+ "act_session="+activity.getActSession()+" && "
				+ "added_by="+activity.getAddedBy()+" && "
				+ "added_on="+activity.getAddedOn()+"";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				activity.setActID(rs.getString("act_id"));
				activity.setActSession(rs.getString("act_session"));
				activity.setAddedBy(rs.getString("added_by"));
				activity.setAddedOn(rs.getString("added_on"));		
				activity.setMinID(Integer.parseInt(rs.getString("min(act_id)")));	
				activity.setMaxID(Integer.parseInt(rs.getString("max(act_id)")));	
			}
//			Close Connection			
			rs.getStatement().getConnection().close();
		} catch (Exception e) {
//			Log error			
			LOGGER.error("Error in getActivityWithMinMaxIDBySettingValues. Exception", e);			
		}
		return activity;
	}
	
	
	/**
	 * 
	 * @return returns the activity object with minID and MaxID from activity table
	 */
	public Activity getMinMaxIDs() {
		Activity activity = new Activity();
		String SQL="select min(act_id), max(act_id) from ssts.activity";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				activity.setMinID(Integer.parseInt(rs.getString("min(act_id)")));	
				activity.setMaxID(Integer.parseInt(rs.getString("max(act_id)")));	
			}
//			Close Connection			
			rs.getStatement().getConnection().close();
		} catch (Exception e) {
//			Log error	
			LOGGER.error("Error in getMinMaxIDs. Exception", e);
		}
		return activity;
	}	
	
	
	   public void addActivity(Activity activity) {
		   String SQLInsert = ("insert into activity(act_session, added_by, added_on) values (?, ?, CURDATE())");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, activity.getActSession());
	            preparedStatement.setString(2, activity.getAddedBy());        
	            preparedStatement.executeUpdate();
//				Close Connection	            
	            preparedStatement.getConnection().close();
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in gaddActivity. SQL Exception", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in addActivity. Exception", e);
			}
	    }	
		
	    public void updateActivity(Activity activity) {
	    	String SQLUpdate = ("update activity set act_session=?, added_by=? where act_id=?");
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLUpdate);
	            // Parameters start with 1
	            preparedStatement.setString(1, activity.getActSession());	            
	            preparedStatement.setString(2, activity.getAddedBy());
	            preparedStatement.setString(3, activity.getActID());	            
	            preparedStatement.executeUpdate();
//				Close Connection	            
	            preparedStatement.getConnection().close();
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in updateActivity. SQL Exception", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in updateActivity. Exception", e);
			}
	    }
	   
	    
	    public List<Activity> getAllActivities() {
	        List<Activity> activities = new ArrayList<Activity>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT act_id, act_session, added_by,(SELECT user_name FROM ssts.users where user_id= activity.added_by) ,added_on, updateTime FROM ssts.activity");
	            while (rs.next()) {
	            	Activity activity = new Activity();
	            	activity.setActID(rs.getString("act_id"));
	            	activity.setActSession(rs.getString("act_session"));
	            	activity.setAddedBy(rs.getString("added_by"));
	            	activity.setAddedByName(rs.getString("(SELECT user_name FROM ssts.users where user_id= activity.added_by)"));
	            	activity.setAddedOn(rs.getString("added_on"));	                
	                
	            	activities.add(activity);
	            }
//				Close Connection	            
	            statement.getConnection().close();
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in getAllActivities. SQL Exception", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getAllActivities. Exception", e);
			}

	        return activities;
	    }
	       
	    
	    public Activity getActivityById(String activityID) {
	        Activity activity = new Activity();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from activity where act_id=?");
	            preparedStatement.setString(1, activityID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
					activity.setActID(rs.getString("act_id"));
					activity.setActSession(rs.getString("act_session"));
					activity.setAddedBy(rs.getString("added_by"));
					activity.setAddedOn(rs.getString("added_on"));		
	            }
//				Close Connection	            
	            preparedStatement.getConnection().close();
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in getActivityById. SQL Exception",e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getActivityById. Exception",e);
			}
	        return activity;
	    }		    
	    
	    public void deleteActivity(String activityID) {
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("delete from activity where act_id=?");
	            // Parameters start with 1
	            preparedStatement.setString(1, activityID);
	            preparedStatement.executeUpdate();
//				Close Connection	            
	            preparedStatement.getConnection().close();
	        } catch (SQLException e) {
//				Log SQL error	
				LOGGER.error("Error in deleteActivity. SQL Exception",e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in deleteActivity. Exception",e);
			}
	    }	    

}
