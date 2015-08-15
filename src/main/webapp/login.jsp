<%@page import="data.DatabaseConnection"%>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");   
    String pwd = request.getParameter("pass");
    String SQL="select * from users where user_login='" + userid + "'";    
    
    ResultSet rs;
    rs = DatabaseConnection.getInstance().getValues(SQL);
    
    if (rs.next()) {
    
        String dbPwd=rs.getString("user_password");
        String dbUserstatus=rs.getString("user_status");        
        String dbUsertype=rs.getString("user_type");
		String dbUserid=rs.getString("user_id");        
// If wrong password
		if(!dbPwd.equals(pwd)){
        	out.println("Invalid password <a href='login.html'>try again</a>");		
	        //Insert log record to LogAttempt Table
	    	try{
	    	String SQLLog = ("insert into logattempt (user_id) values ("+dbUserid+")");
	    	DatabaseConnection.getInstance().insertValues(SQLLog);
	    	}catch(Exception e){
	    	out.println("There was a problem in updating log records in the Database. Please try again later. Problem: "+e);
	    	}                     			
		}
// If the account is not activated
		else if(dbPwd.equals(pwd) && !dbUserstatus.equalsIgnoreCase("act")){
        	out.println("Your SSTS account needs to be validated. Please log in to your email: <b>"+userid+"</b> and follow the validation email you have received from SSTS");
// If user is an Administrator        
        }else if(dbPwd.equals(pwd) && dbUsertype.equalsIgnoreCase("admin")){
            session.setAttribute("userid", "Administrator:"+userid);  
            response.sendRedirect("success.jsp");

	        //Insert Admin log record to LoginInfo Table
	    	try{
	    	String SQLLog = ("insert into logininfo (user_id) values ("+dbUserid+")");
	    	DatabaseConnection.getInstance().insertValues(SQLLog);
	    	}catch(Exception e){
	    	out.println("There was a problem in updating log records in the Database. Please try again later. Problem: "+e);
	    	}             
            
// If user is a member            
        }else if(dbPwd.equals(pwd)){
            session.setAttribute("userid", userid);
            response.sendRedirect("success.jsp");   
            
	        //Insert Member log record to LoginInfo Table
	    	try{
	    	String SQLLog = ("insert into logininfo (user_id) values ("+dbUserid+")");
	    	DatabaseConnection.getInstance().insertValues(SQLLog);
	    	}catch(Exception e){
	    	out.println("There was a problem in updating log records in the Database. Please try again later. Problem: "+e);
	    	}                       
            
        }
//         session.setAttribute("userid", userid);
//         response.sendRedirect("success.jsp");
    } else {

        	out.println("No such user account ! <a href='login.html'>try again</a>");
    }
%>