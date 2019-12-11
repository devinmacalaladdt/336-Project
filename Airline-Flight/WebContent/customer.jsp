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
<title>Customer</title>
</head>
<body>
<h1>Welcome <%

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select firstname,lastname from AirlineFlight.account where accountname='"+session.getAttribute("user")+"'");

if(rs.next()){
out.println(rs.getString("firstname")+" "+rs.getString("lastname"));
}
%></h1>



<br>

Hope we can make your life easier!

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

<br>

<form action='ViewFlights.jsp'><input type='submit' value='View Flights'/></form>

<br>

<br>

<form action='ViewOneway.jsp'><input type='submit' value='View Tickets for OneWay'/></form>

<br>

<br>

<form action='ViewRoundTrip.jsp'><input type='submit' value='View Tickets for RoundTrip'/></form>

<br>


<br>

<form action='logout.jsp'><input type='submit' value='Logout'/></form>

<br>







</body>
</html>