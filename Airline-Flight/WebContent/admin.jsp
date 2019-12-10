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

<h3>Add/Edit/Delete Customer</h3>
<form action="updateCustomerAdmin.jsp">

	<select name="op">
		<option value="add">Add</option>
		<option value="edit">Edit</option>
		<option value="delete">Delete</option>
	</select>
	<br>
	<label for="oldAccName">Old Account Name:</label>
	<input type="text" id="oldAccName" name="oldAccName">
	<label for="newAccName">New Account Name:</label>
	<input type="text" id="newAccName" name="newAccName">
	<br>
	<label for="oldPass">Old Password:</label>
	<input type="text" id="oldPass" name="oldPass">
	<label for="newPass">New Password:</label>
	<input type="text" id="newPass" name="newPass">
	<br>
	<label for="oldFname">Old First Name:</label>
	<input type="text" id="oldFname" name="oldFname">
	<label for="newFname">New First Name:</label>
	<input type="text" id="newFname" name="newFname">
	<br>
	<label for="oldLname">Old Last Name:</label>
	<input type="text" id="oldLname" name="oldLname">
	<label for="newLname">New Last Name:</label>
	<input type="text" id="newLname" name="newLname">
	<br>
	<button type="submit">Submit</button>

</form>
<hr>
<h3>Add/Edit/Delete Customer Representative</h3>
<form action="updateRepAdmin.jsp">

	<select name="op">
		<option value="add">Add</option>
		<option value="edit">Edit</option>
		<option value="delete">Delete</option>
	</select>
	<br>
	<label for="oldAccName">Old Account Name:</label>
	<input type="text" id="oldAccName" name="oldAccName">
	<label for="newAccName">New Account Name:</label>
	<input type="text" id="newAccName" name="newAccName">
	<br>
	<label for="oldPass">Old Password:</label>
	<input type="text" id="oldPass" name="oldPass">
	<label for="newPass">New Password:</label>
	<input type="text" id="newPass" name="newPass">
	<br>
	<label for="oldFname">Old First Name:</label>
	<input type="text" id="oldFname" name="oldFname">
	<label for="newFname">New First Name:</label>
	<input type="text" id="newFname" name="newFname">
	<br>
	<label for="oldLname">Old Last Name:</label>
	<input type="text" id="oldLname" name="oldLname">
	<label for="newLname">New Last Name:</label>
	<input type="text" id="newLname" name="newLname">
	<br>
	<button type="submit">Submit</button>

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
