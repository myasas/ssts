package dao;

import java.sql.ResultSet;

import data.DatabaseConnection;
import model.Activity;

public class ActivityDAO {
	

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
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
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
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
		}
		return activity;
	}	
	
//	public int getMaxID() {
//		int maxID = 0;
//		String stringmaxID = null;
//		String SQL = "SELECT max(act_id) FROM ssts.activity";
//		try {
//			ResultSet rs = DatabaseConnection.getInstance().getValues(SQL);
//			if (rs.next()) {
//				stringmaxID = rs.getString("max(act_id)");
//				maxID = Integer.parseInt(stringmaxID);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("exception: " + e);
//		}
//		return maxID;
//	}

//	public int getMinID() {
//		int minID = 0;
//		String stringminID = null;
//		String SQL = "SELECT min(act_id) FROM ssts.activity";
//		try {
//			ResultSet rs = DatabaseConnection.getInstance().getValues(SQL);
//			if (rs.next()) {
//				stringminID = rs.getString("min(act_id)");
//				minID = Integer.parseInt(stringminID);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("exception: " + e);
//		}
//		return minID;
//	}
	
//	public static void main(String[] args) {
//	Activity ad = new Activity();
//	ad.setActID("1");
//	
//	ActivityDAO fbd2 = new ActivityDAO();
//	ad = fbd2.getActivityWithMinMaxIDBySettingValues(ad);
//
//	ad = fbd2.getMinMaxIDs();	
//	
//	
//	System.out.println(ad.getMaxID());
//	System.out.println(ad.getMinID());
//}	
	
}
