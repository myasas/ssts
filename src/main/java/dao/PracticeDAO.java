package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import model.Activity;
import model.Practice;
import model.User;

public class PracticeDAO {
	
	
	
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
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
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
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
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
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
				e.printStackTrace();
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
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
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
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
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
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	    }	    
	
	
//	    public static void main(String[] args) {
//			Practice practice = new Practice();
//	    	
//	    	PracticeDAO pracDAO = new PracticeDAO();
//	    	
////	    	System.out.println(pracDAO.getPracticeById("1"));
//	    	
//	    	practice.setPracID("2");
//	    	practice.setAddedBy("16");
//	    	practice.setPracCharacter("Q");
//	    	practice.setPracSession("Letters for parents");
//	    	practice.setPracUrl("tttttttttttttttttt");
//	    	
//	    	pracDAO.updatePractice(practice);
//	    	
//	    	System.out.println(pracDAO.getAllPractices());
////	    	activity.setActSession("Test act session");
////	    	activity.setAddedBy("16");
////	    	activity.setActID("9");
////	    	activity.setActSession("Test act session updated 111");
////	    	activity.setAddedBy("16");
////	    	
////	    	actDAO.updateActivity(activity);
////			
////			actDAO.addActivity(activity);
//			
//		}
}
