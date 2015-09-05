<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import ="dao.UserDAO" %>
<%@ page import ="model.User" %>
<%@ page import ="dao.UPUpdateHistoryDAO" %>
<%@ page import ="model.UPUpdateHistory" %>
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


<%  UserDAO dao = new UserDAO(); %>

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

   var usertype = document.getElementById('select-usertype'+id).value;
   var userstatus = document.getElementById('select-userstatus'+id).value;
   var username = document.getElementById('username'+id).value;
   var useremail = document.getElementById('userlogin'+id).value;
   var userpass = document.getElementById('userpass'+id).value;
   var userbday = document.getElementById('userbday'+id).value;
   
   
   if( username.length==0 ){
       alert('Write Some real Text please.');
   return;
   }
   
   	document.getElementById('useriddb').value=id ; 
    document.getElementById('select-usertypedb').value=usertype ; 
    document.getElementById('select-userstatusdb').value=userstatus ; 
    document.getElementById('usernamedb').value=username ; 
    document.getElementById('userlogindb').value=useremail ; 
    document.getElementById('userpassdb').value=userpass ; 
    document.getElementById('userbdaydb').value=userbday ; 	

    
// Script* closes the pop up window - if it is not closed database wont get updated    
    $( "#popup-"+id+"" ).popup( "close" );

}
</script>

<script type="text/javascript">//<![CDATA[
function changeadduser(){

   var usertype = document.getElementById('addselect-usertype').value;
   var userstatus = document.getElementById('addselect-userstatus').value;
   var username = document.getElementById('addusername').value;
   var useremail = document.getElementById('adduserlogin').value;
   var userpass = document.getElementById('adduserpass').value;
   var userbday = document.getElementById('adduserbday').value;
   
   
   if( username.length==0 ){
       alert('Write Some real Text please.');
   return;
   }
   
    document.getElementById('addselect-usertypedb').value=usertype ; 
    document.getElementById('addselect-userstatusdb').value=userstatus ; 
    document.getElementById('addusernamedb').value=username ; 
    document.getElementById('adduserlogindb').value=useremail ; 
    document.getElementById('adduserpassdb').value=userpass ; 
    document.getElementById('adduserbdaydb').value=userbday ; 	

    
// Script* closes the pop up window - if it is not closed database wont get updated    
    $( "#popup-newuser" ).popup( "close" );

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

    function delayedclickadduser(delayms) {
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
	

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">User Management</h4>
	<a href="#popup-newuser"  data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Add User">Add User</a>
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p>Please use the following table to manage user settings. Kindly note that system shall not allow to change user's email.</p>
	<form>
		<input data-type="search" id="searchForTable-1"/>
	</form>
    <table data-role="table" id="table-1" data-filter="true" data-input="#searchForTable-1" class="ui-responsive table-stripe">
        <thead>
            <tr>
                <th>User Name</th>
                <th>Email</th>
                <th>Registration Date</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
<%--Using JSTL to draw user table from the database--%>        
            <c:forEach items="<%=dao.getAllUsers()%>" var="user">
            
                <tr>
                    <td><c:out value="${user.userName}" /></td>
                    <td><c:out value="${user.userLogin}" /></td>
                    <td><c:out value="${user.userReg}" /></td>                    
                    <td><a href="#popup-${user.userID}" data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Edit User">Update</a></td>
                </tr>
	<div data-role="popup" id="popup-${user.userID}" data-theme="a" class="ui-content">
		<form>
			<select name="select-usertype" id="select-usertype${user.userID}">
				<c:if test = "${user.userType == 'admin'}">
				<option value="member">Member</option>	
				<option value="admin" selected>Administrator</option>			
				</c:if>
				
				<c:if test = "${user.userType == 'member'}">
				<option value="member" selected>Member</option>	
				<option value="admin">Administrator</option>			
				</c:if>			
	
			</select>	
			
			<select name="select-userstatus" id="select-userstatus${user.userID}">
				<c:if test = "${user.userStatus == 'act'}">
				<option value="act" selected>Active</option>
				<option value="deact">Not-Active</option>
				<option value="rest">Restricted</option>			
				</c:if>			
				<c:if test = "${user.userStatus == 'deact'}">
				<option value="act">Active</option>
				<option value="deact" selected>Not-Active</option>
				<option value="rest">Restricted</option>			
				</c:if>			
				<c:if test = "${user.userStatus == 'rest'}">
				<option value="act">Active</option>
				<option value="deact">Not-Active</option>
				<option value="rest" selected>Restricted</option>				
				</c:if>											
	
			</select>	
						
				<input name="username" id="username${user.userID}" type="text" placeholder="User Name" value="${user.userName}"/>
				<input name="userlogin" id="userlogin${user.userID}" type="text" placeholder="Email Address" value="${user.userLogin}" readonly/>
				<input name="userpass" id="userpass${user.userID}" type="password" placeholder="User Password" value="${user.userPass}"/>	
				<input name="userbday" id="userbday${user.userID}" type="date" placeholder="BirthDay" value="${user.userBday}"/>
				<input type="button" id="${user.userID}" value="Save" onclick="change(this.id);delayedclick(1000);"/>
		</form>
		
	</div>                 
            </c:forEach>
        </tbody>
    </table>
    
	<div data-role="popup" id="popup-newuser" data-theme="a" class="ui-content">
		<form>
			<select name="addselect-usertype" id="addselect-usertype">
				<option value="member" selected>Member</option>	
				<option value="admin">Administrator</option>			
			</select>	
			
			<select name="addselect-userstatus" id="addselect-userstatus">
				<option value="act" selected>Active</option>
				<option value="deact">Not-Active</option>
				<option value="rest">Restricted</option>			
			</select>	
						
				<input name="addusername" id="addusername" type="text" placeholder="User Name" />
				<input name="adduserlogin" id="adduserlogin" type="text" placeholder="Email Address" />
				<input name="adduserpass" id="adduserpass" type="password" placeholder="User Password" />	
				<input name="adduserbday" id="adduserbday" type="date" placeholder="BirthDay" />
				<input type="button" value="Add User" onclick="changeadduser();delayedclickadduser(1000);"/>
		</form>	
	</div>
	    
    
<!--  html - user update form -->
    	<div data-role="content">	
		<form hidden="hidden">  
		<input name="select-usertypedb" id="select-usertypedb"  type="text" placeholder="User Type" value=""/>
		<input name="select-userstatusdb" id="select-userstatusdb" type="text" placeholder="User Status" value=""/>
		
		<input name="useriddb" id="useriddb" type="text" placeholder="User ID" value=""/>
		<input name="usernamedb" id="usernamedb" type="text" placeholder="User Name" value=""/>
		<input name="userlogindb" id="userlogindb" type="text" placeholder="Email Address" value=""/>
		<input name="userpassdb" id="userpassdb" type="password" placeholder="User Password" value=""/>	
		<input name="userbdaydb" id="userbdaydb" type="date" placeholder="BirthDay" value=""/>
		<input type="submit" id="savebutton" value="Save" onclick="location.href='redirect.jsp'" >	
		</form>  
		</div>
		
<!--  html - user add form -->
    	<div data-role="content">	
		<form hidden="hidden">  
		<input name="addselect-usertypedb" id="addselect-usertypedb"  type="text" placeholder="User Type" value=""/>
		<input name="addselect-userstatusdb" id="addselect-userstatusdb" type="text" placeholder="User Status" value=""/>
		
		<input name="adduseriddb" id="adduseriddb" type="text" placeholder="User ID" value=""/>
		<input name="addusernamedb" id="addusernamedb" type="text" placeholder="User Name" value=""/>
		<input name="adduserlogindb" id="adduserlogindb" type="text" placeholder="Email Address" value=""/>
		<input name="adduserpassdb" id="adduserpassdb" type="password" placeholder="User Password" value=""/>	
		<input name="adduserbdaydb" id="adduserbdaydb" type="date" placeholder="BirthDay" value=""/>
		<input type="submit" id="addbutton" value="Add" onclick="location.href='redirect.jsp'" >	
		</form>  
		</div>
				
		<%
// 		User Update Parameters
		String userID = request.getParameter("useriddb");
		String userType = request.getParameter("select-usertypedb");
		String userStatus = request.getParameter("select-userstatusdb");
		String userName = request.getParameter("usernamedb");
		String userLogin = request.getParameter("userlogindb");
		String userPass = request.getParameter("userpassdb");
		String userBday = request.getParameter("userbdaydb");
		
		String updateByID = session.getAttribute(StaticReferences.ssnUserid).toString();
		
// 		User Add Parameters
		String addUserType = request.getParameter("addselect-usertypedb");
		String addUserStatus = request.getParameter("addselect-userstatusdb");
		String addUserName = request.getParameter("addusernamedb");
		String addUserLogin = request.getParameter("adduserlogindb");
		String addUserPass = request.getParameter("adduserpassdb");
		String addUserBday = request.getParameter("adduserbdaydb");
		
		if (userName == null && addUserName == null) {
			// myText is null when the page is first requested, 
			// so do nothing
			} else { 
			
		if (userName != null) {

// 		Update User Account			
		User user = new User();
		user.setUserType(userType);
		user.setUserStatus(userStatus);
		user.setUserName(userName);		
		user.setUserLogin(userLogin);
		user.setUserPass(userPass);
		user.setUserBday(userBday);
		
		UserDAO userDao = new UserDAO();
		userDao.updateUser(user);
		
// 		Add record in User Profile Updates Table		
		UPUpdateHistory upUpdateHistory = new UPUpdateHistory();
		upUpdateHistory.setUpdateByID(updateByID);
		upUpdateHistory.setUpdateOnID(userID);
		
		UPUpdateHistoryDAO upUpdateHistoryDAO = new UPUpdateHistoryDAO();
		upUpdateHistoryDAO.addUPUpdateHistory(upUpdateHistory);

		
		session.setAttribute("userObj", user);  
		session.setAttribute(StaticReferences.ssnRedirectPage, "usermanagement.jsp"); 
// 		response.setHeader("refresh", "1");
		response.sendRedirect("redirect.jsp");   
		}
		
		if (addUserName != null) {
//	 		Add User Account			
			User user = new User();
			user.setUserType(addUserType);
			user.setUserStatus(addUserStatus);
			user.setUserName(addUserName);		
			user.setUserLogin(addUserLogin);
			user.setUserPass(addUserPass);
			user.setUserBday(addUserBday);
					
			UserDAO userDao = new UserDAO();
			userDao.addUser(user);
			
			session.setAttribute("userObj", user);  
			session.setAttribute(StaticReferences.ssnRedirectPage, "usermanagement.jsp"); 
//	 		response.setHeader("refresh", "1");
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