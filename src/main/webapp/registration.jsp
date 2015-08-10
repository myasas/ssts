<%@ page import ="java.sql.*" %>
<%
    String uname = request.getParameter("uname");  
	String email = request.getParameter("email");
    String pass = request.getParameter("pass");
    String bday = request.getParameter("bday");
    
//AAAA-Follwing string variables shall be implemented in a seperate class in future 
	final String utype = "member";
	final String ustatus = "deact";
//AAAA
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ssts-server.bitnamiapp.com:3306/ssts",
            "root", "1qaz2wsx@");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where user_login='" + email + "'");
//If email is already registered in the database
    if (rs.next()) {
    	out.print("The email address <b>"+email+"</b> is already registered with  SSTS. You shall either <a href='index.html#register-art'>SignUp</a> with SSTS using a differen email address or If you have forgotten your password you shall use the <a href='pwdReset.html'>Password Request</a> service.");
    }else{
        int i = st.executeUpdate("insert into users(user_type, user_login, user_password, user_status, user_name, user_bday, user_reg) values ('" + utype  + "','" + email + "','" + pass + "','" + ustatus + "','" + uname + "','" + bday + "', CURDATE())");
        if (i > 0) {
    //session.setAttribute("userid", user);
    //response.sendRedirect("welcome.jsp");
           out.print("Registration Successfull!"+"<a href='login.html'>Go to Login</a>");
        } else {
            out.print("Else statement of if condition - SQL query may not pass in to the user database");
        }    	
    }


%>