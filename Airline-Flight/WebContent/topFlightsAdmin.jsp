<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

    

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");

Statement st = con.createStatement();


try{

	out.println("<h3>Most Active Flights by Ticket Sales</h3>");

	ResultSet rs = st.executeQuery("select Flight, count(*) as Tickets_Sold from Associated group by Flight order by Tickets_Sold desc limit 10;");

	while(rs.next()){

		String flight = rs.getString("Flight");

		String tickets_sold = rs.getString("Tickets_Sold");

		out.println("Flight #"+flight+": "+tickets_sold+" Ticket(s)"+"<br>");

		out.println();

	}

	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");

	

}catch(Exception e){

	out.println("<h3>Most Active Flights by Ticket Sales</h3>");

	out.println("Missing data in database");

	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");

}



%>