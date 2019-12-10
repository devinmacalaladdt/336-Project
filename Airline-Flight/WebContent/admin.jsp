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





<p>admin</p>


<form action='logout.jsp'><input type='submit' value='Logout'/></form>
</body>
</html>
