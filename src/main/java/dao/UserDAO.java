package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import model.User;

public class UserDAO {
	
//	public static void main(String[] args) {
//	User ud = new User();
//	ud.setUserType("uType");
//	ud.setUserLogin("uLogin");	
//	ud.setUserPass("uPass");	
//	ud.setUserStatus("deact");	
//	ud.setUserName("uName");	
//	ud.setUserBday("2008/05/05");		
	
	
//	UserDAO ud2 = new UserDAO();
//	ud2.addUser(ud);
//	ud2.getAllUsers();
//	System.out.println(ud2.getAllUsers().toString());
//	ud =ud2.getUserById("8");
//	ud2.deleteUser("uLogin");
	
//	System.out.println(ud.getUserName());
//	}		
	
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
			e.printStackTrace();
			System.out.println("exception: "+e);
		}
		return user;
	}
	
	
    public void checkUser(User user) {
        try {
            PreparedStatement ps = DatabaseConnection.getInstance().getConnection().prepareStatement("select user_name from users where user_name = ?");
            ps.setString(1, user.getUserName());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) // found
            {
                updateUser(user);
            } else {
                addUser(user);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
    }		
	
	   public void addUser(User user) {
		   String SQLInsert = ("insert into users(user_type, user_login, user_password, user_status, user_name, user_bday, user_reg) values (?, ?, ?, ?, ?, ?, CURDATE())");		   
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLInsert);
	            // Parameters start with 1
	            preparedStatement.setString(1, user.getUserType());
	            preparedStatement.setString(2, user.getUserLogin());
	            preparedStatement.setString(3, user.getUserPass()); 
	            preparedStatement.setString(4, user.getUserStatus());  
	            preparedStatement.setString(5, user.getUserName());
	            preparedStatement.setString(6, user.getUserBday());              
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
			}
	    }	
		
	    public void updateUser(User user) {
	    	String SQLUpdate = ("update users set user_name=?, user_password=?,  user_bday=?,  user_type=?,  user_status=? where user_login=?");
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement(SQLUpdate);
	            // Parameters start with 1
	            preparedStatement.setString(1, user.getUserName());	            
	            preparedStatement.setString(2, user.getUserPass());
	            preparedStatement.setString(3, user.getUserBday());
	            preparedStatement.setString(4, user.getUserType());	 
	            preparedStatement.setString(5, user.getUserStatus());	 
	            preparedStatement.setString(6, user.getUserLogin());	            
	            preparedStatement.executeUpdate();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
				e.printStackTrace();
			}
	    }
	   
	    
	    public List<User> getAllUsers() {
	        List<User> users = new ArrayList<User>();
	        try {
	            Statement statement =  DatabaseConnection.getInstance().getConnection().createStatement();
	            ResultSet rs = statement.executeQuery("select * from users");
	            while (rs.next()) {
	                User user = new User();
	                user.setUserID(rs.getString("user_id"));
	                user.setUserType(rs.getString("user_type"));
	                user.setUserLogin(rs.getString("user_login"));
	                user.setUserPass(rs.getString("user_password"));
	                user.setUserStatus(rs.getString("user_status"));	                
	                user.setUserName(rs.getString("user_name"));	
	                user.setUserBday(rs.getString("user_bday"));	
	                user.setUserReg(rs.getString("user_reg"));		                
	                users.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}

	        return users;
	    }
	    
	    public User getUserByLogin(String userLogin) {
	        User user = new User();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from users where user_login=?");
	            preparedStatement.setString(1, userLogin);
	            ResultSet rs = preparedStatement.executeQuery();

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
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	        return user;
	    }	    
	    
	    public User getUserById(String userID) {
	        User user = new User();
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("select * from users where user_id=?");
	            preparedStatement.setString(1, userID);
	            ResultSet rs = preparedStatement.executeQuery();

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
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	        return user;
	    }		    
	    
	    public void deleteUser(String userLogin) {
	        try {
	            PreparedStatement preparedStatement = DatabaseConnection.getInstance().getConnection().prepareStatement("delete from users where user_login=?");
	            // Parameters start with 1
	            preparedStatement.setString(1, userLogin);
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
				e.printStackTrace();
			}
	    }	    
	    
}
