<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer</title>
</head>
<body>
<p>Welcome Customer!</p>



Please select an option if you wish to search for flights.
<br>
<form method="post" action="searchType.jsp">
   
  <input type="radio" name="command" value="oneway"/>One Way
  <br>
  <input type="radio" name="command" value="roundtrip"/>Round Trip
  <br>
   <input type="radio" name="command" value="flexible"/>Flexible
  <br>
  <input type="submit" value="submit" />
</form>
<br>

</body>
<body>

Click here if you wish to make a reservation.
<form action='reserveCustomer.jsp'><input type='submit' value='Make Reservation'/></form>
<br>
<br>
Click here to see your reservations.
<br>
<form action='displayCustomerReservations.jsp'><input type='submit' value='Here'/></form>
<br>



<form action='logout.jsp'><input type='submit' value='Logout'/></form>
</body>
</html>
