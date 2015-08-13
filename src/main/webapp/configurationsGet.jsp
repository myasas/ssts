<%@page import="configuration.ConfigurationMaster"%>
<%@ page import ="java.sql.*" %>
<%
//session.setAttribute("userid", userid);
	try{
	ConfigurationMaster cm = new ConfigurationMaster();
	cm = cm.configsFromConfigFile();
//	Database related references    
	String dbDriver = cm.getDbDriver();  
	String dbConURL = cm.getDbConURL();  
	String dbUserName = cm.getDbUserName();  
	String dbPassword = cm.getDbPassword();  
//	Email related references	
	String emailUserName = cm.getEmailUserName();  
	String emailPassword = cm.getEmailPassword();
		
	//Reading settings
	out.println("Following are the SSTS Connfiguration setttings. <br><br> Database Driver :"+dbDriver+"<br> Database ConnectionURL :"+dbConURL+"<br> Database UserName :"+dbUserName+"<br> Database Password :"+dbPassword+"<br><br> EmailUserName :"+emailUserName+"<br> EmailPasseword :"+emailPassword+" <br><br>Please make sure to keep the credential secure.<br>Thank you,<br>SSTS<br>(Smart Speech Therapist for Stammer)");
	}catch(Exception e){
		out.println("Problem in reading configurations.json. If this is the very first time SSTS is running, please configure the settings. <br><br> Problem :<be>"+e);
	}

%>