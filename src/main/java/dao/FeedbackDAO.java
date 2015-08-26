package dao;

import java.sql.ResultSet;

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
	
//	public static void main(String[] args) {
//	Feedback fbd = new Feedback();
//	fbd.setFbID("1");
//	
//	FeedbackDAO fbd2 = new FeedbackDAO();
//	fbd = fbd2.getFeedbackBySettingValues(fbd);
//
//	System.out.println(fbd.getMessage());
//}
	
}
