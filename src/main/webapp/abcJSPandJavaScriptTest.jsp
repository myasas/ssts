<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="configuration.StaticReferences"%>    
<%@page import="model.User"%>    
<%@ page import ="dao.UserDAO" %>

		

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<div data-role="content">		
		<form>  
		<input name="select-usertype" type="text" placeholder="User Type" value=""/>
		<input name="select-userstatus" type="text" placeholder="User Status" value=""/>
		<input name="username" type="text" placeholder="User Name" value=""/>
		<input name="userlogin" type="text" placeholder="Email Address" value=""/>
		<input name="userpass" type="password" placeholder="User Password" value=""/>	
		<input name="userbday" type="date" placeholder="BirthDay" value=""/>

		<input type="submit" value="Save" onclick="location.href='redirect.jsp'" >	
		</form>  
		</div>

					
		<%
		String userType = request.getParameter("select-usertype");
		String userStatus = request.getParameter("select-userstatus");
		String userName = request.getParameter("username");
		String userLogin = request.getParameter("userlogin");
		String userPass = request.getParameter("userpass");
		String userBday = request.getParameter("userbday");
		
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
		
		session.setAttribute(StaticReferences.ssnRedirectPage, "userManagement.jsp"); 
		response.setHeader("refresh", "1");
		response.sendRedirect("redirect.jsp");   		
		%>

			<%
			}
		}
		%>	
</body>
</html>	
