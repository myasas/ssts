<%@ page import ="java.sql.*" %>
<%@ page import ="service.SendEmail" %>
<%
    String email = request.getParameter("email");   

// AAAA-These variables are to be put in a seperate class
	final String emailSubjectPwdReset = "SSTS User Account Password";
// AAAA
    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://ssts-server.bitnamiapp.com:3306/ssts",
            "root", "1qaz2wsx@");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where user_login='" + email + "'");
    
    if (rs.next()) {
//Gets data required to send email.
        String dbPwd=rs.getString("user_password");
        String dbUserstatus=rs.getString("user_status");  
        String dbUsername=rs.getString("user_name");
//Prepares email reciever, subject and body.

		try{
        SendEmail se = new SendEmail();
        se.setReceiverEmail(email);
        se.setMailSubject(emailSubjectPwdReset);
        se.setMailBody("Hi "+dbUsername+", \n Your account details are as below.\n Login Name: "+email+"\nLogin Password: "+dbPwd+"\nAccount Status: "+dbUserstatus+"\n\nThank you,\nSSTS\n(Smart Speech Therapist for Stammer)");     
        
        se.sendAnEmail(se);
        out.println("Password Request email sent to "+email+" ! Do you want to <a href='login.html'>Signin to SSTS</a> now ?");
        
		}catch(Exception e){
			out.println("There was a problem in sending the Password Request email. Please try again later. Problem: "+e);
		}
    } else {
        	out.println("No such user account ! <a href='pwdReset.html'>try again</a>");
    }
%>