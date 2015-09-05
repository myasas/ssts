<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="model.UPHistory"%>
<%@ page import ="dao.UPHistoryDAO" %>

<%@page import="configuration.StaticPanels"%>
<%@page import="configuration.StaticReferences"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else {
	
	UPHistoryDAO dao = new UPHistoryDAO();
	UPHistory uph = new UPHistory();
	//Get user profile data from database
	uph=dao.getProgressGraphData(session.getAttribute(StaticReferences.ssnUserid).toString());
	//Set the appropriate values for x axis and y axis of the graph
	String xAxisValues = uph.getxAxisValuesForUser();
	String yAxisValues = uph.getyAxisValuesForUser();	
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
	
<!-- Progress Chart	 -->
	
<style type="text/css">
#container {
	min-width: 300px;
	max-width: 2000px;
	height: 300px;
	margin: 1em auto;
}
</style>

<script type="text/javascript" src="//code.jquery.com/jquery-git.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript">//<![CDATA[
$(function(){
$('#container').highcharts({

    title: {
        text: 'Your Smart Therapy	 Progress !'
    },
	
    xAxis: {
        categories: [
                     <%=xAxisValues %>
                     ]
    },
   
    series: [{
        
    	name: 'Session/Score',
        type: 'spline',        
        data: [
					<%=yAxisValues %>
               ]

    }],

    yAxis: {
        labels: {
            format: '{value} %'
        },
        title: {
            text: 'Score'
        }
    }    

});

});//]]> 

</script>
	
<!-- Progress Chart	 -->	
	
<title>SSTS User Home</title>		
</head>
<body>


	<div data-role="page" id="page-1" data-theme="a">
<!-- Left panel -->	
<%if(session.getAttribute(StaticReferences.ssnUsertype).toString().equalsIgnoreCase(StaticReferences.uTypeMember)) {
%>
	<%=StaticPanels.homePanelMember %>
<%} else if(session.getAttribute(StaticReferences.ssnUsertype).toString().equalsIgnoreCase(StaticReferences.uTypeAdmin)) {
%>
	<%=StaticPanels.homePanelAdmin %>
<%
}
%>	

<!-- Top bar -->
		<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
  <ul class="title-area">
    <li class="name">
    <a href="#panel-userhome" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
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
	
	<p>Following is a summary of your assessments.</p>
	
<div id="container" data-highcharts-chart="0">
	<div class="highcharts-container" id="highcharts-0"
		style="position: relative; overflow: hidden; width: 800px; height: 300px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
	</div>
</div>	
	
	<div class="ui-field-contain">
		<label for="text-1">Your Last Score:</label>
		<input name="text-1" id="text-1" data-clear-btn="true" value="" placeholder="X.xx%" type="text" readonly/>
	</div>
	<div class="ui-field-contain">
		<label for="text-2">Your Average Score:</label>
		<input name="text-2" id="text-2" data-clear-btn="true" placeholder="X.xx%" value="" type="text" readonly/>
	</div>
	<div class="ui-field-contain">
		<label for="text-3">No. of completed tests:</label>
		<input name="text-3" id="text-3" data-clear-btn="true" value="" placeholder="XX" type="text" readonly/>
	</div>
	<div class="ui-field-contain">
		<label for="textarea-1">Most Repeated Words:</label>
		<textarea name="textarea-1" id="textarea-1" data-clear-btn="true" placeholder="Eg: mom, my, i am, etc." cols="40" rows="8" readonly></textarea>
	</div>
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

