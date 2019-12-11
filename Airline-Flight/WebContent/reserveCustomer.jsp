<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Reservations</title>
</head>
<body>
<h1>Welcome <%

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select firstname,lastname from AirlineFlight.account where accountname='"+session.getAttribute("user")+"'");

if(rs.next()){
out.println(rs.getString("firstname")+" "+rs.getString("lastname"));
}
%></h1>
<h3>Make Reservation</h3>
<form action="makeReservationCustomer.jsp">
  <label for="accountname">Account Name:</label>
  <input type="text" id="accountname" name="accountname">
  <select name="flight">
  
  <%
  ResultSet rs1 = st.executeQuery("SELECT DISTINCT `Flight`.`3letterID` AS dep, `Flight`.`Flight` AS f FROM Flight JOIN Destination ON Flight.Flight = Destination.Flight");
  
  while(rs1.next()){
		
		String dep = rs1.getString("dep");
		String des = "";
		String flight = rs1.getString("f");
		Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery("SELECT 3letterID AS des FROM Destination WHERE Destination.Flight='"+flight+"'");
		while(rs2.next()){
			
			des+=rs2.getString("des")+" ";
			
		}
		
	%>
	
	<option value="<%= flight %>">
		<%= (flight + ": "+dep+"->"+des) %>
	</option>
		
	<% } %>
  
  </select>
  <button type="submit">Submit</button>
</form>
<hr>



<form action='logout.jsp'><input type='submit' value='Logout'/></form>
<form action='customer.jsp'><input type='submit' value='Return'/></form>
</body>
</html>