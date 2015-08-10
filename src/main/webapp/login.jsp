<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");   
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ssts-server.bitnamiapp.com:3306/ssts",
            "root", "1qaz2wsx@");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where user_login='" + userid + "' and user_password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
    	ResultSet rs2= st.executeQuery("select * from users where user_login='" + userid +"'");    	
        if(rs2.next()){
        	out.println("Invalid password <a href='login.html'>try again</a>");
        }else{
        	out.println("No such user account ! <a href='login.html'>try again</a>");
        }
    	
    }
%>