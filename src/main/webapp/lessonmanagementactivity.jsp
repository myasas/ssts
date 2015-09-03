<%@page import="model.Activity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import ="dao.ActivityDAO" %>
<%@ page import ="controller.UserController" %>
<%@page import="configuration.StaticReferences"%>
<%@page import="configuration.StaticPanels"%>

<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else if(session.getAttribute(StaticReferences.ssnUsertype).toString().equalsIgnoreCase(StaticReferences.uTypeMember)) {
%>
<%=StaticReferences.msgAccessAdminOnly%><br/>


<%} else if(session.getAttribute(StaticReferences.ssnUsertype).toString().equalsIgnoreCase(StaticReferences.uTypeAdmin)) {
%>


<%  ActivityDAO dao = new ActivityDAO(); %>

<!DOCTYPE html>  
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
    
<!-- Test -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- Script*clones (manually) the data in popup form to the form in main window -->
<script type="text/javascript">//<![CDATA[
function change(id){

   var activityid = document.getElementById('activityid'+id).value;
   var activitysession = document.getElementById('activitysession'+id).value;
   
   
   if( activitysession.length==0 ){
       alert('Write Some real Text please.');
   return;
   }
    document.getElementById('activityiddb').value=activityid ; 
    document.getElementById('activitysessiondb').value=activitysession ; 


// Script* closes the pop up window - if it is not closed database wont get updated    
    $( "#popup-"+id+"" ).popup( "close" );

}
</script>

<script type="text/javascript">//<![CDATA[
function changeaddactivity(){


   var addactivitysession = document.getElementById('addactivitysession').value;
   
   
   if( addactivitysession.length==0 ){
       alert('Write Some real Text please.');
   return;
   }

    document.getElementById('addactivitysessiondb').value=addactivitysession ; 


// Script* closes the pop up window - if it is not closed database wont get updated    
    $( "#popup-addactivity" ).popup( "close" );

}
</script>

<!-- Script* clicks the hidden save button after a delay -->
<script type="text/javascript">

    function delayedclick(delayms) {
        console.log("clicked...waiting...");

        setTimeout(
            function() {
//                 alert("Called after delay.");
                document.getElementById('savebutton').click();
            },
            delayms);
    }
    
</script>

<script type="text/javascript">

    function delayedclickaddactivity(delayms) {
        console.log("clicked...waiting...");

        setTimeout(
            function() {
//                 alert("Called after delay.");
                document.getElementById('addbutton').click();
            },
            delayms);
    }
    
</script>

<!-- Title bar - Title of page -->
<title>Smart Speech Therapist</title>		
</head>
<body>


	<div data-role="page" id="page-1" data-theme="a">
<!-- Left panel -->	
<%=StaticPanels.homePanelAdmin %>

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
	

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Lesson Management</h4>
	<a href="#popup-addactivity"  data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Add Activity">Add Activity</a>
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p>Please use the following table to manage activity sessions. Kindly note that system shall not allow to change added date.</p>
	<form>
		<input data-type="search" id="searchForTable-1"/>
	</form>
    <table data-role="table" id="table-1" data-filter="true" data-input="#searchForTable-1" class="ui-responsive table-stripe">
        <thead>
            <tr>
                <th>No.</th>
                <th>Activity</th>
                <th>Added By</th>
                <th>Added On</th>                
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
<%--Using JSTL to draw user table from the database--%>        
            <c:forEach items="<%=dao.getAllActivities()%>" var="activity">
            
                <tr>
                    <td><c:out value="${activity.actID}" /></td>
                    <td><c:out value="${activity.actSession}" /></td>
                    <td><c:out value="${activity.addedByName}" /></td>     
                    <td><c:out value="${activity.addedOn}" /></td>                
                    <td><a href="#popup-${activity.actID}" data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Edit Activity">Update</a></td>
                </tr>
	<div data-role="popup" id="popup-${activity.actID}" data-theme="a" class="ui-content">
		<form>
				<input name="activityid" id="activityid${activity.actID}" type="text" placeholder="ActivityID" value="${activity.actID}" readonly/>						
				<textarea name="activitysession" id="activitysession${activity.actID}" placeholder="Activity Session" required="required">${activity.actSession}</textarea>
				<input name="addedbyname" id="addedbyname${activity.actID}" type="text" placeholder="Added By" value="${activity.addedByName}" readonly/>
				<input type="button" id="${activity.actID}" value="Save" onclick="change(this.id);delayedclick(1000);"/>
		</form>
		
	</div>                 
            </c:forEach>
        </tbody>
    </table>
        
	<div data-role="popup" id="popup-addactivity" data-theme="a" class="ui-content">
		<form>				
		<textarea name="addactivitysession" id="addactivitysession" placeholder="Activity Session" required="required"></textarea>
		<input type="button" id="addactbttn" value="Save" onclick="changeaddactivity();delayedclickaddactivity(1000);"/>
		</form>
		
	</div> 
	    
    
<!--  html - activity update form -->
    	<div data-role="content" hidden="hidden">	
		<form>  
		
		<input name="activityiddb" id="activityiddb" type="text" placeholder="ActivityID DB" value=""/>	
		<input name="activitysessiondb" id="activitysessiondb" type="text" placeholder="Activity Session DB" value=""/>

		<input type="submit" id="savebutton" value="Save" onclick="location.href='redirect.jsp'" >	
		</form>  
		</div>
		
<!--  html - activity add form -->
    	<div data-role="content" hidden="hidden">	
		<form>

		<input name="addactivitysessiondb" id="addactivitysessiondb" type="text" placeholder="New Activity" value=""/>				

		<input type="submit" id="addbutton" value="Save" onclick="location.href='redirect.jsp'">	
		</form>
		</div>
				
		<%
		
		String actid = request.getParameter("activityiddb");
		String actSession = request.getParameter("activitysessiondb");
		String addedby = session.getAttribute(StaticReferences.ssnUserid).toString();

		String addActSession = request.getParameter("addactivitysessiondb");		
		
		if (actSession == null && addActSession == null) {
			// myText is null when the page is first requested, 
			// so do nothing
			} else { 
					
		if(actSession != null){
						
		Activity activity = new Activity();
		activity.setActID(actid);
		activity.setActSession(actSession);
		activity.setAddedBy(addedby);		

		ActivityDAO actDao = new ActivityDAO();
		actDao.updateActivity(activity);
		
		session.setAttribute("activityObj", activity);  
		session.setAttribute(StaticReferences.ssnRedirectPage, "lessonmanagementactivity.jsp"); 
// 		response.setHeader("refresh", "1");
		response.sendRedirect("redirect.jsp");   		
	
		}
		if(addActSession != null){	
					
		Activity activity = new Activity();
		activity.setActSession(addActSession);
		activity.setAddedBy(addedby);		

		ActivityDAO actDao = new ActivityDAO();
		actDao.addActivity(activity);
		
		session.setAttribute("activityObj", activity);  
		session.setAttribute(StaticReferences.ssnRedirectPage, "lessonmanagementactivity.jsp"); 
//		response.setHeader("refresh", "1");
		response.sendRedirect("redirect.jsp");   					

		}

		}
		%>			

		</div>	
		</div>		
<!-- footer -->
		<div data-role="footer" data-theme="b">
			<h4>-</h4>
		</div>
	</div>		



<!-- Dialog box if needed -->
	<div data-role="page" data-dialog="true" id="dialog-1" data-theme="b">
		<div data-role="header">
			<h1>Dialog Title</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Dialog content</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		
	
</body>
</html> 

<%
    }
%>