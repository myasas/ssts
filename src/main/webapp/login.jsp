<%@page import="configuration.StaticReferences"%>
<%@page import="data.DatabaseConnection"%>
<%@ page import ="java.sql.*" %>
<%
    String userlogin = request.getParameter("uname");   
    String pwd = request.getParameter("pass");
    
    if(userlogin.equals(StaticReferences.maintainanceAcc) && pwd.equals(StaticReferences.maintainancePass)){
        session.setAttribute(StaticReferences.ssnUserlogindisplay, "Maintainance:"+userlogin);  
        session.setAttribute(StaticReferences.ssnUserlogin, userlogin);  
        session.setAttribute(StaticReferences.ssnUsertype, StaticReferences.maintainanceUType);            
        session.setAttribute(StaticReferences.ssnUsername, StaticReferences.maintainanceUName);
        response.sendRedirect("success.jsp"); 
        
    }else{
	    String SQL="select * from users where user_login='" + userlogin + "'";    
	    
	    ResultSet rs;
	    rs = DatabaseConnection.getInstance().getValues(SQL);
	    
	    if (rs.next()) {
	    
	        String dbPwd=rs.getString("user_password");
	        String dbUserstatus=rs.getString("user_status");        
	        String dbUsertype=rs.getString("user_type");
			String dbUserid=rs.getString("user_id"); 
			String dbUsername=rs.getString("user_name");
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
// If the account is not activated
			}else if(dbPwd.equals(pwd) && dbUserstatus.equalsIgnoreCase(StaticReferences.uStatusDeactivated)){
	        	out.println("Your SSTS account needs to be validated. Please log in to your email: <b>"+userlogin+"</b> and follow the validation email you have received from SSTS");
// If the account is restricted
			}else if(dbPwd.equals(pwd) && dbUserstatus.equalsIgnoreCase(StaticReferences.uStatusRestricted)){
	            out.println(StaticReferences.msgAccRestrict);        	
// If user is an Administrator        
	        }else if(dbPwd.equals(pwd) && dbUsertype.equalsIgnoreCase(StaticReferences.uTypeAdmin)){
	            session.setAttribute(StaticReferences.ssnUserlogindisplay, "Administrator:"+userlogin);            
	            session.setAttribute(StaticReferences.ssnUserlogin, userlogin); 
	            session.setAttribute(StaticReferences.ssnUserid, dbUserid);  	            
	            session.setAttribute(StaticReferences.ssnUsertype, dbUsertype);            
	            session.setAttribute(StaticReferences.ssnUsername, dbUsername);              
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
	            session.setAttribute(StaticReferences.ssnUserlogindisplay, userlogin);         	
	            session.setAttribute(StaticReferences.ssnUserlogin, userlogin);
	            session.setAttribute(StaticReferences.ssnUserid, dbUserid);  	            
	            session.setAttribute(StaticReferences.ssnUsertype, dbUsertype);            
	            session.setAttribute(StaticReferences.ssnUsername, dbUsername);              
	            response.sendRedirect("success.jsp");   
	            
		        //Insert Member log record to LoginInfo Table
		    	try{
		    	String SQLLog = ("insert into logininfo (user_id) values ("+dbUserid+")");
		    	DatabaseConnection.getInstance().insertValues(SQLLog);
		    	}catch(Exception e){
		    	out.println("There was a problem in updating log records in the Database. Please try again later. Problem: "+e);
		    	}                       
	            
	        }
//         session.setAttribute("userlogin", userlogin);
//         response.sendRedirect("success.jsp");
	    } else {
	
	        	out.println("No such user account ! <a href='login.html'>try again</a>");
	    }
    }
%>