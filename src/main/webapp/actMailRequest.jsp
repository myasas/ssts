<%@page import="data.DatabaseConnection"%>
<%@page import="configuration.StaticReferences"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="service.SendEmail" %>
<%
    String email = request.getParameter("email");   
    String SQL="select * from users where user_login='" + email + "'";
    
    ResultSet rs;
	rs = DatabaseConnection.getInstance().getValues(SQL);
	
    if (rs.next()) {
//Gets data required to send email.
 
//Prepares email reciever, subject and body.
		try{
			SendEmail se = new SendEmail();
			if(se.sendAccountActivationEmail(email)){
				out.println("Account Activation email sent to "+email+" ! Do you want to <a href='login.html'>Signin to SSTS</a> now ?");	
			}else{
				out.print("Sorry, There was a deffculty in sending the activation email to "+email+". Kindly use the request activation email service to receive an Account Activation Email. Thank you.");
			} 
        
		}catch(Exception e){
			out.println("There was a problem in sending the Account Activation email. Please try again later. Problem: "+e);
		}

    } else {
        	out.println("No such user account ! <a href='actMailRequest.html'>try again</a>");
    }
%>