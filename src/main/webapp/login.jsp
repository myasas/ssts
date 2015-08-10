<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");   
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");

   
    Connection con = DriverManager.getConnection("jdbc:mysql://ssts-server.bitnamiapp.com:3306/ssts",
            "root", "1qaz2wsx@");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where user_login='" + userid + "'");
    
    if (rs.next()) {
    
        String dbPwd=rs.getString("user_password");
        String dbUserstatus=rs.getString("user_status");        
        String dbUsertype=rs.getString("user_type");
// If wrong password
		if(!dbPwd.equals(pwd)){
        	out.println("Invalid password <a href='login.html'>try again</a>");			
		}
// If the account is not activated
		else if(dbPwd.equals(pwd) && !dbUserstatus.equalsIgnoreCase("act")){
        	out.println("Your SSTS account needs to be validated. Please log in to your email: <b>"+userid+"</b> and follow the validation email you have received from SSTS");
// If user is an Administrator        
        }else if(dbPwd.equals(pwd) && dbUsertype.equalsIgnoreCase("admin")){
            session.setAttribute("userid", "Administrator:"+userid);  
            response.sendRedirect("success.jsp");       
// If user is a member            
        }else if(dbPwd.equals(pwd)){
            session.setAttribute("userid", userid);
            response.sendRedirect("success.jsp");        	
        }
//         session.setAttribute("userid", userid);
//         response.sendRedirect("success.jsp");
    } else {

        	out.println("No such user account ! <a href='login.html'>try again</a>");
    }
%>