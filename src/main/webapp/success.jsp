<%@page import="configuration.StaticReferences"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else {
%>
<%-- Welcome <%=session.getAttribute(StaticReferences.ssnUserlogin)%> --%>
<!-- <a href='logout.jsp'>Log out</a> -->
<html>
<head>
<!-- Test -->
  <link rel="stylesheet" type="text/css" href="/css/result-light.css">
  <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/css/foundation.min.css">
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/js/foundation.min.js"></script><meta class="foundation-data-attribute-namespace"><meta class="foundation-mq-xxlarge"><meta class="foundation-mq-xlarge"><meta class="foundation-mq-large"><meta class="foundation-mq-medium"><meta class="foundation-mq-small"><style></style>
  <style type="text/css">
    @media only screen and (max-width: 40em) {
    .title-area {
    }
    .name {
    }
    .name img {
            height:35px;
            margin-top:5px;
            margin-left:5px;
    }
}
.name img {
    margin-left:20px;
    
}
  </style>

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
	<script type="text/javascript">//<![CDATA[
	$(window).load(function(){
	$("#setToDefaults").click(function () {
	    $("#dbDriver").val("com.mysql.jdbc.Driver");
	    $("#dbConURL").val("jdbc:mysql://ssts-server.bitnamiapp.com:3306/ssts");
	    $("#dbUserName").val("root");
	    $("#dbPassword").val("1qaz2wsx@");
	    $("#emailUserName").val("emindlibrarysystem@gmail.com");
	    $("#emailPassword").val("emind123456");	
	});
	});//]]> 

</script>
	<meta charset="ISO-8859-1">
<title>Configuration</title>		
</head>
<body>





	<div data-role="page" id="page-1" data-theme="a">
		<div data-role="panel" id="panel-1" data-theme="b">
			<ul data-role="listview" id="listview-1">
				<li><a href="" onclick="location.href='index.html'">Home</a></li>
				<li><a href="#">Configurations</a></li>
				<li><a href="#page-2">Help</a></li>		
				<li><a href="#dialog-1">Log Out</a></li>					
			</ul>
	</div>
	
		<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
  <ul class="title-area">
    <li class="name">
    <a href="#panel-1" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
        <a href="#"><img src="img/ssts_logo_150px.png" ></a>
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
  </ul>
  
<section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
      <li class="active"><a href="#"><%=session.getAttribute(StaticReferences.ssnUserlogin)%></a></li>
      <li class="has-dropdown not-click">
        <a href="#">Account</a>
        <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
          <li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>
        </ul>
      </li>
    </ul>
  </section></nav>
		</div>	

				
		<div data-role="content">
<form id="confform" method="post" action="configurationsSet.jsp">			
<h4 align="left">Welcome <%=session.getAttribute(StaticReferences.ssnUsername)%></h4>	
<p>Welcome to smart speech therapist !!!!</p>
<p>Welcome to smart speech therapist !!!!</p>
<p>Welcome to smart speech therapist !!!!</p>
</form>			
		</div>
		<div data-role="footer" data-theme="b">
			<h4>-</h4>
		</div>
		
	</div>

	<div data-role="page" id="page-2" data-theme="b">
		<div data-role="header" data-theme="b">
			<a href="#" data-role="button" data-rel="back" data-icon="back">Back</a>
			<h1>Second Page</h1>
		</div>
		<div data-role="content" >
			<p>Page content goes here.</p>
			<div data-role="collapsible-set" id="collapsible-set-1" data-theme="a">
				<div data-role="collapsible">
					<h4>Registration</h4>
					<p>Getting registered with SSTS is simple. You just have to provide your email address and a preffered password. Or else you can sign in with your existing google account.</p>
				</div>
				<div data-role="collapsible">
					<h4>Key Contacts</h4>
					<p>Collapsible content.</p>
				</div>
				<div data-role="collapsible">
					<h4>Locations</h4>
					<p>Collapsible content.</p>
				</div>
			</div>
		</div>
		<div data-role="footer" data-theme="b">
			<h4>Second Page</h4>
		</div>
	</div>
	
<!-- 	Dialogs -->
	<div data-role="page" data-dialog="true" name="dialog-1" id="dialog-1" data-theme="b">
		<div data-role="header">
			<h1>Logout?</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Do you want to log out?</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>	
	
	<div data-role="page" data-dialog="true" id="dialog-confSaveSuccess" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Sorry, refreshing configuration success page causes loss of existing configuration settings. Kindly apply the settings again !</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		
	
	<div data-role="page" data-dialog="true" id="dialog-confSaveFail" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Failed to save configuration settings. Try again.</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		

</body>
</html>


<%
    }
%>
