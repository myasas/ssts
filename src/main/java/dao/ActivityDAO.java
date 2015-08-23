package dao;

import java.sql.ResultSet;

import data.DatabaseConnection;

public class ActivityDAO {
	
	private String actID="act_id";	
	private String actSession="act_session";
	private String addedBy="added_by";
	private String addedOn="added_on";
	
	public static void main(String[] args) {
		ActivityDAO ad = new ActivityDAO();
		ad.setActID("1");
		
		ActivityDAO fbd2;
		fbd2 = ad.getActivityDAO(ad);

		System.out.println(fbd2.getActSession());
		System.out.println(fbd2.getMinID());
	}
	
	
	public ActivityDAO getActivityDAO(ActivityDAO activityDAO) {
		String SQL="select * from ssts.activity where act_id="+activityDAO.getActID()+" && "
				+ "act_session="+activityDAO.getActSession()+" && "
				+ "added_by="+activityDAO.getAddedBy()+" && "
				+ "added_on="+activityDAO.getAddedOn()+"";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				activityDAO.setActID(rs.getString("act_id"));
				activityDAO.setActSession(rs.getString("act_session"));
				activityDAO.setAddedBy(rs.getString("added_by"));
				activityDAO.setAddedOn(rs.getString("added_on"));			
		
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
		}
		return activityDAO;
	}

	public int getMaxID() {
		int maxID = 0;
		String stringmaxID = null;
		String SQL = "SELECT max(act_id) FROM ssts.activity";
		try {
			ResultSet rs = DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				stringmaxID = rs.getString("max(act_id)");
				maxID = Integer.parseInt(stringmaxID);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: " + e);
		}
		return maxID;
	}

	public int getMinID() {
		int minID = 0;
		String stringminID = null;
		String SQL = "SELECT min(act_id) FROM ssts.activity";
		try {
			ResultSet rs = DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				stringminID = rs.getString("min(act_id)");
				minID = Integer.parseInt(stringminID);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: " + e);
		}
		return minID;
	}
	
//	Getters and Setters
	/**
	 * @return the actID
	 */
	public String getActID() {
		return actID;
	}


	/**
	 * @param actID the actID to set
	 */
	public void setActID(String actID) {
		this.actID = actID;
	}


	/**
	 * @return the actSession
	 */
	public String getActSession() {
		return actSession;
	}


	/**
	 * @param actSession the actSession to set
	 */
	public void setActSession(String actSession) {
		this.actSession = actSession;
	}


	/**
	 * @return the addedBy
	 */
	public String getAddedBy() {
		return addedBy;
	}


	/**
	 * @param addedBy the addedBy to set
	 */
	public void setAddedBy(String addedBy) {
		this.addedBy = addedBy;
	}


	/**
	 * @return the addedOn
	 */
	public String getAddedOn() {
		return addedOn;
	}


	/**
	 * @param addedOn the addedOn to set
	 */
	public void setAddedOn(String addedOn) {
		this.addedOn = addedOn;
	}

	



}
