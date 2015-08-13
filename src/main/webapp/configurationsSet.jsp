<%@page import="configuration.ConfigurationMaster"%>
<%@ page import ="java.sql.*" %>
<%


// session.setAttribute("userid", userid);

//	Database related references    
	String dbDriver = request.getParameter("dbDriver");  
	String dbConURL = request.getParameter("dbConURL");  
	String dbUserName = request.getParameter("dbUserName");  
	String dbPassword = request.getParameter("dbPassword");  
//	Email related references	
	String emailUserName = request.getParameter("emailUserName");  
	String emailPassword = request.getParameter("emailPassword");
	
// 	if(!dbDriver.equals(null) && !dbConURL.equals(null) && !dbUserName.equals(null) && !dbPassword.equals(null) && !emailUserName.equals(null) && !emailPassword.equals(null)){

	ConfigurationMaster cm = new ConfigurationMaster();
	//Saving settings
		cm.setDbDriver(dbDriver);
		cm.setDbConURL(dbConURL);
		cm.setDbUserName(dbUserName);
		cm.setDbPassword(dbPassword);
		cm.setEmailUserName(emailUserName);
		cm.setEmailPassword(emailPassword); 
	//Sucess
	    if (cm.saveConfigFile(cm.addConfigSettings())) {
	//Prob-Though used, This doenst appear in jsp page
	    	out.println("Configuration file saved sucessfully"); 
	//Prob-Though used, dialog box does not appear
	        response.sendRedirect("configurations.html#dialog-confSaveSuccess");    	
	//Fail   	
	    } else {
	        out.println("Else statement- Some problem occured during the saving process of configuration file");
	        response.sendRedirect("configurations.html#dialog-confSaveFail");           
	    }
// 	}else{
// 		out.println("Configuration settings seem to include null values. If this message was displayed due to a refresh while trying to change SSTS settings, it is advised to retry.");
// 	}
     
%>