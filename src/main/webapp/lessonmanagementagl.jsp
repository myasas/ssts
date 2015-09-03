<%@page import="model.AGL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import ="dao.AglDAO" %>
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


<%  AglDAO dao = new AglDAO(); %>

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

   var aglid = document.getElementById('aglid'+id).value;
   var aglword = document.getElementById('aglword'+id).value;
   var agllesson = document.getElementById('agllesson'+id).value;
   
   if( agllesson.length==0 ){
       alert('Write Some real Text please.');
   return;
   }
    document.getElementById('agliddb').value=aglid ; 
    document.getElementById('aglworddb').value=aglword ; 
    document.getElementById('agllessondb').value=agllesson ;    


// Script* closes the pop up window - if it is not closed database wont get updated    
    $( "#popup-"+id+"" ).popup( "close" );

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
	

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Auto Generated Lesson Management</h4>
	
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p>Please use the following table to manage Auto Generated Lessons for users. Kindly note that system shall not allow to change the users allocated for lessons.</p>
	<form>
		<input data-type="search" id="searchForTable-1"/>
	</form>
    <table data-role="table" id="table-1" data-filter="true" data-input="#searchForTable-1" class="ui-responsive table-stripe">
        <thead>
            <tr>
				<th>No.</th>
				<th>Words</th>
				<th>AGL Lesson</th>					
				<th>Generated For</th>
				<th>Generated On</th>			             
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
<%--Using JSTL to draw user table from the database--%>        
            <c:forEach items="<%=dao.getAllAGLs()%>" var="agl">
            
                <tr>           
                    <td><c:out value="${agl.aglID}" /></td>
                    <td><c:out value="${agl.aglWord}" /></td>
                    <td><c:out value="${agl.aglLesson}" /></td>
                    <td><c:out value="${agl.aglForName}" /></td>    
                    <td><c:out value="${agl.genOn}" /></td>                
                    <td><a href="#popup-${agl.aglID}" data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Edit AGL">Update</a></td>
                </tr>
	<div data-role="popup" id="popup-${agl.aglID}" data-theme="a" class="ui-content">
		<form>
				<input name="aglid" id="aglid${agl.aglID}" type="text" placeholder="AglID" value="${agl.aglID}" readonly/>
<input name="aglword" id="aglword${agl.aglID}" type="text" placeholder="AglWord" value="${agl.aglWord}" readonly/>									
<textarea name="agllesson" id="agllesson${agl.aglID}" placeholder="AglLesson" required="required">${agl.aglLesson}</textarea>
<input name="aglforname" id="aglforname${agl.aglID}" type="text" placeholder="AglForName" value="${agl.aglForName}" readonly/>
				<input name="aglgenon" id="aglgenon${agl.aglID}" type="text" placeholder="Generated On" value="${agl.genOn}" readonly/>
				<input type="button" id="${agl.aglID}" value="Save" onclick="change(this.id);delayedclick(1000);"/>
		</form>
		
	</div>                 
            </c:forEach>
        </tbody>
    </table>
        

<!--  html - agl update form -->
    	<div data-role="content" hidden="hidden">	
		<form>  

		<input name="agliddb" id="agliddb" type="text" placeholder="AglID DB" value=""/>	
		<input name="aglworddb" id="aglworddb" type="text" placeholder="AglWordDB" value=""/>				
		<input name="agllessondb" id="agllessondb" type="text" placeholder="AglLessonDB" value=""/>

		<input type="submit" id="savebutton" value="Save" onclick="location.href='redirect.jsp'" >	
		</form>  
		</div>
		

				
		<%
		
		String aglid = request.getParameter("agliddb");
		String aglword = request.getParameter("aglworddb");
		String agllesson = request.getParameter("agllessondb");

		String addedby = session.getAttribute(StaticReferences.ssnUserid).toString();

		if (agllesson == null) {
			// myText is null when the page is first requested, 
			// so do nothing
			} else { 
					
						
		AGL agl = new AGL();
		agl.setAglID(aglid);
		agl.setAglWord(aglword);
		agl.setAglLesson(agllesson);	
	

		AglDAO aglDAO = new AglDAO();
		aglDAO.updateAGL(agl);
		
		session.setAttribute("aglObj", agl);  
		session.setAttribute(StaticReferences.ssnRedirectPage, "lessonmanagementagl.jsp"); 
// 		response.setHeader("refresh", "1");
		response.sendRedirect("redirect.jsp");   		
	


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