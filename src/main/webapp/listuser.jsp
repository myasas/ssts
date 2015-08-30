<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import ="dao.UserDAO" %>
<%@ page import ="model.User" %>
<%@ page import ="controller.UserController" %>
<%@page import="configuration.StaticReferences"%>


<%  UserDAO dao = new UserDAO(); %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Javascript - copies popup inputs to the user update form -->

<!-- clones (manually) the data in popup form to the form in main window -->
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
   
   
    document.getElementById('select-usertypedb').value=usertype ; 
    document.getElementById('select-userstatusdb').value=userstatus ; 
    document.getElementById('usernamedb').value=username ; 
    document.getElementById('userlogindb').value=useremail ; 
    document.getElementById('userpassdb').value=userpass ; 
    document.getElementById('userbdaydb').value=userbday ; 	

// closes the pop up window - if it is not closed database wont get updated    
    $( "#popup-"+id+"" ).popup( "close" );

}
</script>

<!-- clicks the hidden save button after a delay -->
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


<title>Show All Users</title>
</head>
<body>
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
    <p><a href="UserController?action=insert">Add User</a></p>
    
<!--  html - user update form -->
    	<div data-role="content">	
		<form>  
		<input name="select-usertypedb" id="select-usertypedb"  type="text" placeholder="User Type" value=""/>
		<input name="select-userstatusdb" id="select-userstatusdb" type="text" placeholder="User Status" value=""/>
		
		<input name="usernamedb" id="usernamedb" type="text" placeholder="User Name" value=""/>
		<input name="userlogindb" id="userlogindb" type="text" placeholder="Email Address" value=""/>
		<input name="userpassdb" id="userpassdb" type="password" placeholder="User Password" value=""/>	
		<input name="userbdaydb" id="userbdaydb" type="date" placeholder="BirthDay" value=""/>
		<input type="submit" id="savebutton" value="Save" onclick="location.href='redirect.jsp'" >	
		</form>  
		</div>
		<%
		String userType = request.getParameter("select-usertypedb");
		String userStatus = request.getParameter("select-userstatusdb");
		String userName = request.getParameter("usernamedb");
		String userLogin = request.getParameter("userlogindb");
		String userPass = request.getParameter("userpassdb");
		String userBday = request.getParameter("userbdaydb");
		
		if (userType == null) {
			// myText is null when the page is first requested, 
			// so do nothing
			} else { 
				if (userType.length() == 0) {
					out.print("Length is 0");
				}else{
				
		User user = new User();
		user.setUserType(userType);
		user.setUserStatus(userStatus);
		user.setUserName(userName);		
		user.setUserLogin(userLogin);
		user.setUserPass(userPass);
		user.setUserBday(userBday);
		
		UserDAO userDao = new UserDAO();
		userDao.updateUser(user);
		
		session.setAttribute("userObj", user);  
		session.setAttribute(StaticReferences.ssnRedirectPage, "listuser.jsp"); 
// 		response.setHeader("refresh", "1");
		response.sendRedirect("redirect.jsp");   		
		%>

			<%
			}
		}
		%>			

    
</body>
</html>
