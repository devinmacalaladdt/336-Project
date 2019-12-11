<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
out.println("List of Reservations:<br><br><br>");


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

try{
	ResultSet rs = st.executeQuery("select flight from waitlist where accountname='"+session.getAttribute("user")+"'");
	while(rs.next()){
		
		out.println(rs.getString("flight")+"<br>");
		
		
	}
	out.println("<form action='customer.jsp'><input type='submit' value='Return'/></form>");
	
}catch(Exception e){
	
	out.println("You have no reservations made.");
	out.println("<form action='customer.jsp'><input type='submit' value='Return'/></form>");
	
}

%>
<form action='logout.jsp'><input type='submit' value='Logout'/></form>