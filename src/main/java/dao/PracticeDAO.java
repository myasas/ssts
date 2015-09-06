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
import model.Practice;

public class PracticeDAO {
	private static final Logger LOGGER= Logger.getLogger(PracticeDAO.class);	
	
	public PracticeDAO() {
		PropertyConfigurator.configure(StaticReferences.log4jPropertiesPath);
	}
	/**
	 * 
	 * @return returns the activity object with minID and MaxID from activity table
	 */
	public Practice getMinMaxIDs() {
		Practice practice = new Practice();
		String SQL="select min(prac_id), max(prac_id) from ssts.practice";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				practice.setMinID(Integer.parseInt(rs.getString("min(prac_id)")));	
				practice.setMaxID(Integer.parseInt(rs.getString("max(prac_id)")));	
			}
		} catch (Exception e) {
//			Log error	
			LOGGER.error("Error in getMinMaxIDs. Exception ", e);
		}
		return practice;
	}	
	
	
	   public void addPractice(Practice practice) {
		   String SQLInsert = ("insert into practice(prac_character, prac_session, prac_url, added_by, added_on) values (?, ?,?, ?, CURDATE())");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, practice.getPracCharacter());
	            preparedStatement.setString(2, practice.getPracSession());    
	            preparedStatement.setString(3, practice.getPracUrl());
	            preparedStatement.setString(4, practice.getAddedBy());        	            
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in addPractice. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in addPractice. Exception ", e);
			}
	    }	
		
	    public void updatePractice(Practice practice) {
	    	String SQLUpdate = ("update practice set prac_character=?, prac_session=?, prac_url=? where prac_id=?");
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLUpdate);
	            // Parameters start with 1
	            preparedStatement.setString(1, practice.getPracCharacter());	            
	            preparedStatement.setString(2, practice.getPracSession());
	            preparedStatement.setString(3, practice.getPracUrl());	            
	            preparedStatement.setString(4, practice.getPracID());	            
	            preparedStatement.executeUpdate();
	            
	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in updatePractice. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in updatePractice. Exception ", e);
			}
	    }
	   
	    
	    public List<Practice> getAllPractices() {
	        List<Practice> practices = new ArrayList<Practice>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT prac_id, prac_character, prac_session, prac_url, added_by, (SELECT user_name FROM ssts.users where user_id= practice.added_by), added_on, updateTime FROM ssts.practice");
	            while (rs.next()) {
	            	Practice practice = new Practice();
	            	practice.setPracID(rs.getString("prac_id"));
	            	practice.setPracCharacter(rs.getString("prac_character"));	            	
	            	practice.setPracSession(rs.getString("prac_session"));
	            	practice.setPracUrl(rs.getString("prac_url"));
	            	practice.setAddedBy(rs.getString("added_by"));
	            	practice.setAddedByName(rs.getString("(SELECT user_name FROM ssts.users where user_id= practice.added_by)"));
	            	practice.setAddedOn(rs.getString("added_on"));	                
	                
	            	practices.add(practice);
	            }
	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in getAllPractices. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getAllPractices. Exception ", e);
			}

	        return practices;
	    }
	       
	    
	    public Practice getPracticeById(String practiceID) {
	        Practice practice = new Practice();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from practice where prac_id=?");
	            preparedStatement.setString(1, practiceID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	practice.setPracID(rs.getString("prac_id"));
	            	practice.setPracCharacter(rs.getString("prac_character"));	            	
	            	practice.setPracSession(rs.getString("prac_session"));
	            	practice.setPracUrl(rs.getString("prac_url"));
	            	practice.setAddedBy(rs.getString("added_by"));	            	
	            	practice.setAddedOn(rs.getString("added_on"));			
	
	            }
	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in getPracticeById. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in getPracticeById. Exception ", e);
			}
	        return practice;
	    }		    
	    
	    public void deletePractice(String practiceID) {
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("delete from practice where prac_id=?");
	            // Parameters start with 1
	            preparedStatement.setString(1, practiceID);
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
//				Log error	
				LOGGER.error("Error in deletePractice. SQL Exception ", e);
	        } catch (Exception e) {
//				Log error	
				LOGGER.error("Error in deletePractice. Exception ", e);
			}
	    }	    
	
}
