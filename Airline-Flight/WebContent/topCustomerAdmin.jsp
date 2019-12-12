<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

    

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");

Statement st = con.createStatement();


try{

	out.println("<h3>Top Customer</h3>");

	ResultSet rs = st.executeQuery("select firstname, lastname, sum(fare) as revenue from account a, Reservation r, Ticket t where a.accountname = r.accountname and r.Unique_number = t.Unique_number group by firstname, lastname order by sum(fare) desc limit 1;");

	rs.next();

	String firstname = rs.getString("firstname");

	String lastname = rs.getString("lastname");

	String revenue = rs.getString("revenue");

	out.println("The top customer is "+firstname+" "+lastname+" with $"+revenue+" total worth of revenue generated");

	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");

	

}catch(Exception e){

	out.println("<h3>Top Customer</h3>");

	out.println("Missing data in database");

	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");

}



%>
