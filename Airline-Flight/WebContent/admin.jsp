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
<title>Admin</title>
</head>
<body>
<h1>Welcome Administrator <%

Statement st = con.createStatement();

%></h1>

<h3>Delete Account</h3>
<form action="deleteToolAdmin.jsp">

	<label for="oldAccName">Current Account Name:</label>
	<input type="text" id="oldAccName" name="oldAccName">
	<br>
	<button type="submit">Submit</button>

</form>
<hr>
<h3>Add/Edit Customer</h3>
<form action="updateCusAdmin.jsp">

	<select name="op">
		<option value="add">Add</option>
		<option value="edit">Edit</option>
	</select>
	<br>
	<label for="oldAccName">Current Account Name (Leave blank if adding a new account):</label>
	<input type="text" id="oldAccName" name="oldAccName">
	<br>
	<label for="newAccName">New Account Name:</label>
	<input type="text" id="newAccName" name="newAccName">
	<br>
	<label for="newPass">New Password:</label>
	<input type="text" id="newPass" name="newPass">
	<br>
	<label for="newFname">New First Name:</label>
	<input type="text" id="newFname" name="newFname">
	<br>
	<label for="newLname">New Last Name:</label>
	<input type="text" id="newLname" name="newLname">
	<br>
	<button type="submit">Submit</button>

</form>
<hr>
<h3>Add/Edit Customer Representative</h3>
<form action="updateRepAdmin.jsp">

	<select name="op">
		<option value="add">Add</option>
		<option value="edit">Edit</option>
	</select>
	<br>
	<label for="oldAccName">Current Account Name (Leave blank if adding a new account):</label>
	<input type="text" id="oldAccName" name="oldAccName">
	<br>
	<label for="newAccName">New Account Name:</label>
	<input type="text" id="newAccName" name="newAccName">
	<br>
	<label for="newPass">New Password:</label>
	<input type="text" id="newPass" name="newPass">
	<br>
	<label for="newFname">New First Name:</label>
	<input type="text" id="newFname" name="newFname">
	<br>
	<label for="newLname">New Last Name:</label>
	<input type="text" id="newLname" name="newLname">
	<br>
	<button type="submit">Submit</button>

</form>
<hr>
<h3>Obtain Sales Report</h3>
<form action="obtainSalesAdmin.jsp">
	
	<select name="month">
		<option value=01>January</option>
		<option value=02>February</option>
		<option value=03>March</option>
		<option value=04>April</option>
		<option value=05>May</option>
		<option value=06>June</option>
		<option value=07>July</option>
		<option value=08>August</option>
		<option value=09>September</option>
		<option value=10>October</option>
		<option value=11>November</option>
		<option value=12>December</option>
	</select>
	<label for="year"> Year:</label>
	<input type="text" id="year" name="year">
	<button type="submit">Submit</button>
	
</form>
<hr>
<h3>View Reservations</h3>
<form action="displayReservationAdmin.jsp">

	List by: 
	<select name="filter">
		<option value=1>Flight</option>
		<option value=2>Name</option>
	</select>
	<label for="data"> Flight number/Account name:</label>
	<input type="text" id="data" name="data">
	<button type="submit">Submit</button>

</form>
<hr>
<h3>View Revenue Sources</h3>
<form action="displayRevenueAdmin.jsp">
	
	Select: 
	<select name="filter">
		<option value=1>Flight</option>
		<option value=2>Airline</option>
		<option value=3>Customer</option>	
	</select>
	<br>
	<label for="data"> Flight number/Airline ID/Account name:</label>
	<input type="text" id="data" name="data">
	<button type="submit">Submit</button>

</form>
<hr>
<h3>Top Customer</h3>
<form action="topCustomerAdmin.jsp">
	<button type="submit">Retrieve Top Customer</button>
</form>
<hr>
<h3>Most Active Flights</h3>
<form action="topFlightsAdmin.jsp">
	<button type="submit">Top Flights</button>
</form>
<hr>
<h3>Select an airport to view flights</h3>
<form action="displayAllFlightAdmin.jsp">
	<select name="airport">
	<%
	ResultSet rs1 = st.executeQuery("SELECT DISTINCT 3letterID AS airport FROM Airport");	
	while(rs1.next()){		
		
		String airport = rs1.getString("airport");	
		%>		
		<option value="<%= airport %>">
			<%=airport%>
		</option>	
	<%}%>
	
	</select>
	<button type="submit">Submit</button>

</form>
<hr>
<form action='logout.jsp'><input type='submit' value='Logout'/></form>
</body>
</html>