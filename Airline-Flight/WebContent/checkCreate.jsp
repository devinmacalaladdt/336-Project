<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
    String userid = request.getParameter("user");   
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
    Statement st = con.createStatement();
    try{
    	if(userid=="" || pwd==""){throw new NullPointerException("empty");}
    	st.executeUpdate("insert into account values('" + userid + "','" + pwd + "','"+ fname + "','"+lname+ "')");
        out.println("Account Created");
        out.println("<form action='homepage.jsp'><input type='submit' value='Back to Log In'/></form>");
    	
    }catch(Exception e){
    	
    	 out.println("User already exists or invalid Username/Password: try a different Username/Password");
         out.println("<form action='homepage.jsp'><input type='submit' value='Try Again'/></form>");
    	
    }
    
%>