<%@page import="model.Practice"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import ="dao.PracticeDAO" %>
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


<%  PracticeDAO dao = new PracticeDAO(); %>

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

   var practiceid = document.getElementById('pracid'+id).value;
   var practicecharacter = document.getElementById('praccharacter'+id).value;
   var practicesession = document.getElementById('pracsession'+id).value;
   var practiceurl = document.getElementById('pracurl'+id).value;   
   
   if( practicesession.length==0 ){
       alert('Write Some real Text please.');
   return;
   }
    document.getElementById('praciddb').value=practiceid ; 
    document.getElementById('praccharacterdb').value=practicecharacter ; 
    document.getElementById('pracsessiondb').value=practicesession ; 
    document.getElementById('pracurldb').value=practiceurl ;     


// Script* closes the pop up window - if it is not closed database wont get updated    
    $( "#popup-"+id+"" ).popup( "close" );

}
</script>

<script type="text/javascript">//<![CDATA[
function changeaddpractice(){


   var addpracticecharacter = document.getElementById('addpraccharacter').value;
   var addpracticesession = document.getElementById('addpracsession').value;
   var addpracticeurl = document.getElementById('addpracurl').value;
   
   if( addpracticesession.length==0 ){
       alert('Write Some real Text please.');
   return;
   }

    document.getElementById('addpraccharacterdb').value=addpracticecharacter ; 
    document.getElementById('addpracsessiondb').value=addpracticesession ; 
    document.getElementById('addpracurldb').value=addpracticeurl ;     

// Script* closes the pop up window - if it is not closed database wont get updated    
    $( "#popup-addpractice" ).popup( "close" );

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

    function delayedclickaddpractice(delayms) {
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
	

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Practice Session Management</h4>
	<a href="#popup-addpractice"  data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Add Practice">Add Practice</a>
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p>Please use the following table to manage practice sessions. Kindly note that system shall not allow to change added date.</p>
	<form>
		<input data-type="search" id="searchForTable-1"/>
	</form>
    <table data-role="table" id="table-1" data-filter="true" data-input="#searchForTable-1" class="ui-responsive table-stripe">
        <thead>
            <tr>
				<th>No.</th>
				<th>Character</th>
				<th>Session</th>
				<th>URL</th>								
				<th>Added By</th>
				<th>Added On</th>			             
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
<%--Using JSTL to draw user table from the database--%>        
            <c:forEach items="<%=dao.getAllPractices()%>" var="practice">
            
                <tr>           
                    <td><c:out value="${practice.pracID}" /></td>
                    <td><c:out value="${practice.pracCharacter}" /></td>
                    <td><c:out value="${practice.pracSession}" /></td>
                    <td><c:out value="${practice.pracUrl}" /></td>
                    <td><c:out value="${practice.addedByName}" /></td>     
                    <td><c:out value="${practice.addedOn}" /></td>                
                    <td><a href="#popup-${practice.pracID}" data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Edit Practice">Update</a></td>
                </tr>
	<div data-role="popup" id="popup-${practice.pracID}" data-theme="a" class="ui-content">
		<form>
				<input name="pracid" id="pracid${practice.pracID}" type="text" placeholder="PracticeID" value="${practice.pracID}" readonly/>
<input name="praccharacter" id="praccharacter${practice.pracID}" type="text" placeholder="PracticeCharacter" value="${practice.pracCharacter}" required="required"/>
<input name="pracsession" id="pracsession${practice.pracID}" type="text" placeholder="PracticeSession" value="${practice.pracSession}" required="required"/>										
<textarea name="pracurl" id="pracurl${practice.pracID}" placeholder="Practice URL" required="required">${practice.pracUrl}</textarea>
				<input name="addedbyname" id="addedbyname${practice.pracID}" type="text" placeholder="Added By" value="${practice.addedByName}" readonly/>
				<input type="button" id="${practice.pracID}" value="Save" onclick="change(this.id);delayedclick(1000);"/>
		</form>
		
	</div>                 
            </c:forEach>
        </tbody>
    </table>
        
	<div data-role="popup" id="popup-addpractice" data-theme="a" class="ui-content">
		<form>		
		<input type="text" name="addpraccharacter" id="addpraccharacter" placeholder="Practice Character" required="required"/>
		<input type="text" name="addpracsession" id="addpracsession" placeholder="Practice Session" required="required"/>		
		<textarea name="addpracurl" id="addpracurl" placeholder="Practice URL" required="required"></textarea>
		<input type="button" id="addpracbttn" value="Save" onclick="changeaddpractice();delayedclickaddpractice(1000);"/>
		</form>
		
	</div> 
	    
    
<!--  html - practice update form -->
    	<div data-role="content" hidden="hidden">	
		<form>  
		
		<input name="praciddb" id="praciddb" type="text" placeholder="PracticeID DB" value=""/>	
		<input name="praccharacterdb" id="praccharacterdb" type="text" placeholder="Practice CharacterDB" value=""/>				
		<input name="pracsessiondb" id="pracsessiondb" type="text" placeholder="Practice SessionDB" value=""/>
		<input name="pracurldb" id="pracurldb" type="text" placeholder="Practice URL" value=""/>

		<input type="submit" id="savebutton" value="Save" onclick="location.href='redirect.jsp'" >	
		</form>  
		</div>
		
<!--  html - practice add form -->
    	<div data-role="content" hidden="hidden">	
		<form>

		<input name="addpraccharacterdb" id="addpraccharacterdb" type="text" placeholder="Practice Character" value=""/>				
		<input name="addpracsessiondb" id="addpracsessiondb" type="text" placeholder="Practice Session" value=""/>
		<input name="addpracurldb" id="addpracurldb" type="text" placeholder="Practice URL" value=""/>
				
		<input type="submit" id="addbutton" value="Save" onclick="location.href='redirect.jsp'">	
		</form>
		</div>
				
		<%
		
		String pracid = request.getParameter("praciddb");
		String pracCharacter = request.getParameter("praccharacterdb");
		String pracSession = request.getParameter("pracsessiondb");
		String pracUrl = request.getParameter("pracurldb");
		String addedby = session.getAttribute(StaticReferences.ssnUserid).toString();

		String addPracCharacter = request.getParameter("addpraccharacterdb");
		String addPracSession = request.getParameter("addpracsessiondb");	
		String addPracUrl = request.getParameter("addpracurldb");	
		
		if (pracSession == null && addPracSession == null) {
			// myText is null when the page is first requested, 
			// so do nothing
			} else { 
					
		if(pracSession != null){
						
		Practice practice = new Practice();
		practice.setPracID(pracid);
		practice.setPracCharacter(pracCharacter);
		practice.setPracSession(pracSession);	
		practice.setPracUrl(pracUrl);
		practice.setAddedBy(addedby);		

		PracticeDAO pracDao = new PracticeDAO();
		pracDao.updatePractice(practice);
		
		session.setAttribute("practiceObj", practice);  
		session.setAttribute(StaticReferences.ssnRedirectPage, "lessonmanagementPractice.jsp"); 
// 		response.setHeader("refresh", "1");
		response.sendRedirect("redirect.jsp");   		
	
		}
		if(addPracSession != null){	
					
		Practice practice = new Practice();
		practice.setPracCharacter(addPracCharacter);
		practice.setPracSession(addPracSession);	
		practice.setPracUrl(addPracUrl);
		practice.setAddedBy(addedby);		

		PracticeDAO pracDao = new PracticeDAO();
		pracDao.addPractice(practice);
		
		session.setAttribute("practiceObj", practice);  
		session.setAttribute(StaticReferences.ssnRedirectPage, "lessonmanagementPractice.jsp"); 
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