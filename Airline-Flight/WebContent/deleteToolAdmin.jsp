<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

try{
	int r = st.executeUpdate("delete from AirlineFlight.account where accountname='"+request.getParameter("oldAccName")+"'" );
	if(r==0){
		out.println("Failed to delete account");
		out.println("<form action='admin.jsp'><input type='submit' value='Try Again'/></form>");
	}else{
		out.println("Deleted Account");
		out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
	}
}catch(Exception e){
	out.println("Failed to delete account");
	out.println("<form action='admin.jsp'><input type='submit' value='Try Again'/></form>");
}


%>