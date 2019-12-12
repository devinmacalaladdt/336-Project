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
<title>Customer Representative</title>
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
<form action="makeReservationRepresentative.jsp">
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
<h3>Update/Delete Reservation</h3>
<form action="updateReservationRepresentative.jsp">
<label for="accountname">Account Name:</label>
<input type="text" id="accountname" name="accountname">
<label for="ID">Ticket ID:</label>
<input type="text" id="ID" name="ID">
<label for="valid">Set Expiration:</label>
<select name="valid">

	<option value="N">Expired</option>
	<option value="Y">Not Expired</option>

</select>
<label for="delete">Delete Reservation From Portfolio:</label>
<select name="delete">

	<option value="Y">Delete</option>
	<option value="N">Do not delete</option>

</select>
<button type="submit">Submit</button>
</form>
<hr>
<h3>Add/Update/Delete Airport</h3>
<form action="updateAirportRepresentative.jsp">
	<select name="op">
	
		<option value="add">Add</option>
		<option value="update">Update</option>
		<option value="delete">Delete</option>
	
	</select>
	<label for="old_ID">Old Airport ID:</label>
	<input type="text" id="old_ID" name="old_ID">
	<label for="ID">New/Current Airport ID:</label>
	<input type="text" id="ID" name="ID">
	<button type="submit">Submit</button>
</form>
<hr>
<h3>Add/Update/Delete Aircraft</h3>
<form action="updateAircraftRepresentative.jsp">
	<select name="op">
	
		<option value="add">Add</option>
		<option value="update">Update</option>
		<option value="Delete">Delete</option>
	
	</select>
	<label for="ID">Aircraft ID:</label>
	<input type="text" id="ID" name="ID">
	<label for="capacity">Max Capacity:</label>
	<input type="text" id="capacity" name="capacity">
	<label for="airline">Airline ID:</label>
	<input type="text" id="airline" name="airline">
	<button type="submit">Submit</button>
</form>
<hr>
<h3>Add/Update/Delete Flight</h3>
<form action="updateFlightRepresentative.jsp">
	<select name="op">
	
		<option value="add">Add</option>
		<option value="update">Update</option>
		<option value="delete">Delete</option>
	
	</select>
	<label for="flight">Flight:</label>
	<input type="text" id="flight" name="flight">
	<label for="dep-time">Departure Time as 'hh:mm:ss':</label>
	<input type="text" id="dep-time" name="dep-time">
	<label for="day">Days of Operation as 'M T W TH F SA SU':</label>
	<input type="text" id="day" name="day">
	<label for="arr-time">Arrival Time as 'hh:mm:ss':</label>
	<input type="text" id="arr-time" name="arr-time">
	<label for="airline">Airline ID:</label>
	<input type="text" id="airline" name="airline">
	<label for="airport">Departure Airport ID:</label>
	<input type="text" id="airport" name="airport">
	<label for="dest">Destination Airport IDs (space separated list):</label>
	<input type="text" id="dest" name="dest"><br>
	<input type="radio" name="fl" value="dom" checked> Domestic<br>
  	<input type="radio" name="fl" value="int"> International<br>
	<label for="stops">Number of Stops:</label>
	<input type="text" id="stops" name="stops">
	
	<button type="submit">Submit</button>
</form>
<hr>
<h3>Display Waitlist</h3>
<form action="displayWaitlistRepresentative.jsp">

	<label for="flight">Flight:</label>
	<input type="text" id="flight" name="flight">
	<button type="submit">Show Waitlist</button>

</form>
<br>
<form action='logout.jsp'><input type='submit' value='Logout'/></form>
</body>
</html>