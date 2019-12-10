<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

String airport = request.getParameter("airport");

try{
	
	ResultSet rs = st.executeQuery("SELECT DISTINCT Flight AS flight FROM Flight WHERE 3letterID='"+airport+"'");
	out.println("<h3>All flight numbers arriving and departing from "+airport+"</h3>");
	while(rs.next()){
		out.println(rs.getString("flight")+"<br>");
	}
	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
	
}catch(Exception e){
	out.println("Missing data in database");
	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
}


%>
