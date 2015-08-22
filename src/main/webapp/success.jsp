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
	<meta charset="ISO-8859-1">
<title>SSTS User Home</title>		
</head>
<body>


	<div data-role="page" id="page-1" data-theme="a">
<!-- Left panel -->	
<%if(session.getAttribute(StaticReferences.ssnUsertype).toString().equalsIgnoreCase(StaticReferences.uTypeMember)) {
%>
		<div data-role="panel" id="panel-1" data-theme="b">
			<ul data-role="listview" id="listview-1">
				<li><a href="" onclick="location.href='index.html'">Home</a></li>
				<li><a href="#page-2">Help</a></li>		
				<li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>					
			</ul>
	</div>
<%} else if(session.getAttribute(StaticReferences.ssnUsertype).toString().equalsIgnoreCase(StaticReferences.uTypeAdmin)) {
%>
		<div data-role="panel" id="panel-1" data-theme="b">
			<ul data-role="listview" id="listview-1">
				<li><a href="" onclick="location.href='index.html'">Home</a></li>
				<li><a href="configurations.jsp">Configurations</a></li>
				<li><a href="#page-2">Help</a></li>		
				<li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>					
			</ul>
	</div>
<%
}
%>	

<!-- Top bar -->
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
      <li class="active"><a href="#"><%=session.getAttribute(StaticReferences.ssnUserlogindisplay)%></a></li>
      <li class="has-dropdown not-click">
        <a href="#">Account</a>
        <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
          <li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>
        </ul>
      </li>
    </ul>
  </section></nav>
		</div>	

<!-- White Paragraph  -->
		<div data-role="content">
<form id="confform" method="post" action="configurationsSet.jsp">
<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Welcome <%=session.getAttribute(StaticReferences.ssnUsername)%></h4>			
	
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
	

</body>
</html>


<%
    }
%>
