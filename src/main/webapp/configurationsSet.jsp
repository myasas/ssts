<%@page import="configuration.StaticReferences"%>
<%@page import="configuration.ConfigurationMaster"%>
<%@ page import ="java.sql.*" %>

<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else {
%>


<html>
<head>
<!-- Test -->
  <link rel="stylesheet" type="text/css" href="/css/result-light.css">
  <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/css/foundation.min.css">
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/js/foundation.min.js"></script><meta class="foundation-data-attribute-namespace"><meta class="foundation-mq-xxlarge"><meta class="foundation-mq-xlarge"><meta class="foundation-mq-large"><meta class="foundation-mq-medium"><meta class="foundation-mq-small"><style></style>
<script type="text/javascript">//<![CDATA[
$(window).load(function(){
$(document).foundation();
});//]]> 
</script>
<meta class="foundation-mq-topbar">

<!-- Test -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<meta charset="ISO-8859-1">
	
<title>ConfigurationSetting</title>		
</head>
<body>

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
	
	if(!(dbDriver == null)){

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

// 	        response.sendRedirect("dialog-confSaveSuccess");  	
%>
	<div data-role="page" data-dialog="true" id="dialog-confSaveSuccess" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Configuration settings saved successfully !</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		

 <%  	
	//Fail   	
	    } else {
	        out.println("Problem occured during the saving process of configuration file(Ref-Else statement)");
// 	        response.sendRedirect("dialog-confSaveFail"); 
%>	   
	<div data-role="page" data-dialog="true" id="dialog-confSaveFail" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Failed to save configuration settings. Try again.</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>	
	
	     <% 
	    }
	}else{
		out.println("Configuration settings seem to include null values. If this message was displayed due to a refresh while trying to change SSTS settings, it is advised to retry.");
//         response.sendRedirect("dialog-confNullValues"); 
		%>
		
	<div data-role="page" data-dialog="true" id="dialog-confNullValues" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Configuration settings seem to include null values. If this message was displayed due to a refresh while trying to change SSTS settings, it is advised to retry.</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		
	     
<%		
	}

    }
%>








<!-- 	Dialogs -->
<!-- 	<div data-role="page" data-dialog="true" id="dialog-logoutconfirmation" data-theme="b"> -->
<!-- 		<div data-role="header"> -->
<!-- 			<h1>Logout?</h1> -->
<!-- 		</div> -->
<!-- 		<div data-role="content" data-theme="a"> -->
<!-- 			<h6>Do you want to log out?</h6> -->
<!-- 			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">No</a> -->
<!-- 			<a href="" onclick="location.href='logout.jsp'" class="ui-btn ui-corner-all">Yes</a> -->
<!-- 		</div> -->
<!-- 	</div>	 -->
	
<!-- 	<div data-role="page" data-dialog="true" id="dialog-confReadFail" data-theme="b"> -->
<!-- 		<div data-role="header"> -->
<!-- 			<h1>Configuration Settings</h1> -->
<!-- 		</div> -->
<!-- 		<div data-role="content" data-theme="a"> -->
<!-- 			<h6>Problem in reading configurations.json. If this is the very first time SSTS is running, please configure the settings.</h6> -->
<!-- 			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a> -->
<!-- 		</div> -->
<!-- 	</div>		 -->
	
	

	<div data-role="page" data-dialog="true" id="dialog-confalwaysontop" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6></h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		

</body>
</html>