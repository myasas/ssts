<%@page import="data.DatabaseConnection"%>
<%@page import="configuration.StaticReferences"%>
<%@ page import ="java.sql.*" %>
<%
    String uname = request.getParameter("uname");  
	String email = request.getParameter("email");
    String pass = request.getParameter("pass");
    String bday = request.getParameter("bday");
    
	final String utype = StaticReferences.uTypeMember;
	final String ustatus = StaticReferences.uStatusDeactivated;

    String SQL = "select * from users where user_login='" + email + "'";  	
	String SQLInsert = ("insert into users(user_type, user_login, user_password, user_status, user_name, user_bday, user_reg) values ('" + utype  + "','" + email + "','" + pass + "','" + ustatus + "','" + uname + "','" + bday + "', CURDATE())");

    ResultSet rs;
    rs= DatabaseConnection.getInstance().getValues(SQL);

//If email is already registered in the database
    if (rs.next()) {
    	out.print("The email address <b>"+email+"</b> is already registered with  SSTS. You shall either <a href='index.html#register-art'>SignUp</a> with SSTS using a differen email address or If you have forgotten your password you shall use the <a href='pwdReset.html'>Password Request</a> service.");
    }else{
    	int i = DatabaseConnection.getInstance().getSt().executeUpdate(SQLInsert);
        if (i > 0) {
    //session.setAttribute("userid", user);
    //response.sendRedirect("welcome.jsp");
           out.print("Registration Successfull!"+"<a href='login.html'>Go to Login</a>");
        } else {
            out.print("Else statement of if condition - SQL query may not pass in to the user database");
        }    	
    }


%>