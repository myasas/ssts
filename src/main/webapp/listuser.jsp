<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<%-- <%@ page import ="dao.UserDAO" %> --%>
<%-- <%@ page import ="controller.UserController" %> --%>


<%-- <%  UserDAO dao = new UserDAO(); %> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- 	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" /> -->
<!-- 	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script> -->
<!-- 	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Show All Users</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	<form> -->
<!-- 		<input data-type="search" id="searchForTable-1"/> -->
<!-- 	</form> -->
<!--     <table data-role="table" id="table-1" data-filter="true" data-input="#searchForTable-1" class="ui-responsive table-stripe"> -->
<!--         <thead> -->
<!--             <tr> -->
<!--                 <th>User Name</th> -->
<!--                 <th>Email</th> -->
<!--                 <th>Registration Date</th> -->
<!--                 <th colspan=2>Action</th> -->
<!--             </tr> -->
<!--         </thead> -->
<!--         <tbody> -->
<%--             <c:forEach items="<%=dao.getAllUsers()%>" var="user"> --%>
<!--                 <tr> -->
<%--                     <td><c:out value="${user.userName}" /></td> --%>
<%--                     <td><c:out value="${user.userLogin}" /></td> --%>
<%--                     <td><c:out value="${user.userReg}" /></td>                     --%>

<%--                     <td><a href="#popup-${user.userID}" data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Edit User">Update</a></td> --%>
<%-- <%--                     <td><a href="UserController?action=edit&userId=<c:out value="${user.userName}"/>">Update</a></td> --%> --%>
<%-- <%--                     <td><a href="UserController?action=delete&userId=<c:out value="${user.userName}"/>">Delete</a></td> --%> --%>
                    
<%-- 	<div data-role="popup" id="popup-${user.userID}" data-theme="a" class="ui-content"> --%>
<!-- 		<select name="select-usertype" id="select-usertype"> -->
<%-- 			<c:if test = "${user.userType == 'admin'}"> --%>
<!-- 			<option value="member">Member</option>	 -->
<!-- 			<option value="admin" selected>Administrator</option>			 -->
<%-- 			</c:if> --%>
			
<%-- 			<c:if test = "${user.userType == 'member'}"> --%>
<!-- 			<option value="member" selected>Member</option>	 -->
<!-- 			<option value="admin">Administrator</option>			 -->
<%-- 			</c:if>			 --%>

<!-- 		</select>	 -->
		
<!-- 		<select name="select-userstatus" id="select-userstatus"> -->
<%-- 			<c:if test = "${user.userStatus == 'act'}"> --%>
<!-- 			<option value="act" selected>Active</option> -->
<!-- 			<option value="deact">Not-Active</option> -->
<!-- 			<option value="rest">Restricted</option>			 -->
<%-- 			</c:if>			 --%>
<%-- 			<c:if test = "${user.userStatus == 'deact'}"> --%>
<!-- 			<option value="act">Active</option> -->
<!-- 			<option value="deact" selected>Not-Active</option> -->
<!-- 			<option value="rest">Restricted</option>			 -->
<%-- 			</c:if>			 --%>
<%-- 			<c:if test = "${user.userStatus == 'rest'}"> --%>
<!-- 			<option value="act">Active</option> -->
<!-- 			<option value="deact">Not-Active</option> -->
<!-- 			<option value="rest" selected>Restricted</option>				 -->
<%-- 			</c:if>											 --%>

<!-- 		</select>				 -->
<%-- 			<input type="text" placeholder="User Name" value="${user.userName}"/> --%>
<%-- 			<input type="text" placeholder="Email Address" value="${user.userLogin}"/> --%>
<%-- 			<input type="password" placeholder="User Password" value="${user.userPass}"/>	 --%>
<%-- 			<input type="date" placeholder="BirthDay" value="${user.userBday}"/> --%>
<!-- 			<input type="button" value="Save"> -->
<!-- 	</div>                     -->
<!--                 </tr> -->
<%--             </c:forEach> --%>
<!--         </tbody> -->
<!--     </table> -->
<!--     <p><a href="UserController?action=insert">Add User</a></p> -->
<!-- </body> -->
<!-- </html> -->
