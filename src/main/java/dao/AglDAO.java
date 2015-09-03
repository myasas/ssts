package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import model.Activity;
import model.AGL;
import model.Practice;
import model.User;
/**
 * 
 * @author Yasas De Silva
 * This class is the DAO for the Autogenerated Lessons.
 *
 */
public class AglDAO {
	
	
	
	/**
	 * 
	 * @return returns the activity object with minID and MaxID from activity table
	 */
	public AGL getMinMaxIDs() {
		AGL agl = new AGL();
		String SQL="select min(agl_id), max(agl_id) from ssts.autogeneratedlessons";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				agl.setMinID(Integer.parseInt(rs.getString("min(agl_id)")));	
				agl.setMaxID(Integer.parseInt(rs.getString("max(agl_id)")));	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
		}
		return agl;
	}	
	
	
	   public void addAGL(AGL agl) {
		   String SQLInsert = ("insert into autogeneratedlessons(agl_for, agl_word, agl_lesson, gen_on) values (?, ?,?, CURDATE())");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, agl.getAglFor());
	            preparedStatement.setString(2, agl.getAglWord());    
	            preparedStatement.setString(3, agl.getAglLesson());       	            
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
			}
	    }	
		
	    public void updateAGL(AGL agl) {
	    	String SQLUpdate = ("update autogeneratedlessons set agl_word=?, agl_lesson=? where agl_id=?");
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLUpdate);
	            // Parameters start with 1
	            preparedStatement.setString(1, agl.getAglWord());    
	            preparedStatement.setString(2, agl.getAglLesson());               
	            preparedStatement.setString(3, agl.getAglID());	            
	            preparedStatement.executeUpdate();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
				e.printStackTrace();
			}
	    }
	   
	    
	    public List<AGL> getAllAGLs() {
	        List<AGL> agls = new ArrayList<AGL>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("SELECT agl_id, agl_for, (SELECT user_name FROM ssts.users where user_id= autogeneratedlessons.agl_for), agl_word, agl_lesson, gen_on, updateTime FROM ssts.autogeneratedlessons");
	            while (rs.next()) {
	            	AGL agl = new AGL();
	            	agl.setAglID(rs.getString("agl_id"));
	            	agl.setAglFor(rs.getString("agl_for"));	            	
	            	agl.setAglForName(rs.getString("(SELECT user_name FROM ssts.users where user_id= autogeneratedlessons.agl_for)"));
	            	agl.setAglWord(rs.getString("agl_word"));
	            	agl.setAglLesson(rs.getString("agl_lesson"));
	            	agl.setGenOn(rs.getString("gen_on"));	                
	                
	            	agls.add(agl);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}

	        return agls;
	    }
	       
	    
	    public AGL getAGLById(String aglID) {
	        AGL agl = new AGL();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from autogeneratedlessons where agl_id=?");
	            preparedStatement.setString(1, aglID);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	agl.setAglID(rs.getString("agl_id"));
	            	agl.setAglFor(rs.getString("agl_for"));	            	
	            	agl.setAglWord(rs.getString("agl_word"));
	            	agl.setAglLesson(rs.getString("agl_lesson"));
	            	agl.setGenOn(rs.getString("gen_on"));			
	
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	        return agl;
	    }		    
	    
	    public void deleteAGL(String aglID) {
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("delete from autogeneratedlessons where agl_id=?");
	            // Parameters start with 1
	            preparedStatement.setString(1, aglID);
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	    }	    
	
	
//	    public static void main(String[] args) {
//			AGL agl = new AGL();
//	    	
//	    	AglDAO aglDAO = new AglDAO();
//	    	
////	    	System.out.println(pracDAO.getPracticeById("1"));
//	    	
////	    	agl.setAglID("1");
////	    	agl.setAglFor("16");
////	    	agl.setAglWord("Mom");
////	    	agl.setAglLesson("My mom and I are very best friends");
//	    	
//	    	System.out.println(aglDAO.getAllAGLs());
//	    	
////	    	System.out.println(pracDAO.getAllPractices());
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
