package dao;

import java.sql.ResultSet;

import data.DatabaseConnection;
import model.User;

public class UserDAO {
	
	public User getUserBySettingValues(User user) {
		String SQL="select * from ssts.users where user_id="+user.getUserID()+" && "
				+ "user_type="+user.getUserType()+" && "
				+ "user_login="+user.getUserLogin()+" && "
				+ "user_password="+user.getUserPass()+" && "
				+ "user_status="+user.getUserStatus()+" && "
				+ "user_name="+user.getUserName()+" && "
				+ "user_bday="+user.getUserBday()+" && "
				+ "user_reg="+user.getUserReg()+"";
		try {
			ResultSet rs= DatabaseConnection.getInstance().getValues(SQL);
			if (rs.next()) {
				user.setUserID(rs.getString("user_id"));
				user.setUserType(rs.getString("user_type"));
				user.setUserLogin(rs.getString("user_login"));
				user.setUserPass(rs.getString("user_password"));
				user.setUserStatus(rs.getString("user_status"));				
				user.setUserName(rs.getString("user_name"));
				user.setUserBday(rs.getString("user_bday"));
				user.setUserReg(rs.getString("user_reg"));				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("exception: "+e);
		}
		return user;
	}
		
//	public static void main(String[] args) {
//	User ud = new User();
//	ud.setUserLogin("'myasas@gmail.com'");
//	
//	UserDAO ud2 = new UserDAO();
//	ud = ud2.getUserBySettingValues(ud);
//
//	System.out.println(ud.getUserID());
//}	
}
