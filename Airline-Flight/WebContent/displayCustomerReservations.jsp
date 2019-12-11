<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
out.println("First class reservations are denoted by an F<br>");
out.println("Business class reservations are denoted by an B<br>");
out.println("Economy class reservations are denoted by an E<br><br><br>");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
Statement st2 = con.createStatement();
Statement st3 = con.createStatement();
Statement st4 = con.createStatement();

	ResultSet rs = st.executeQuery("SELECT Unique_number FROM Reservation NATURAL JOIN Ticket  WHERE accountname='"+session.getAttribute("user")+"'");
	ResultSet rs2 = st2.executeQuery("SELECT class FROM Reservation NATURAL JOIN Ticket  WHERE accountname='"+session.getAttribute("user")+"'");
	ResultSet rs3 = st3.executeQuery("SELECT fare FROM Reservation NATURAL JOIN Ticket  WHERE accountname='"+session.getAttribute("user")+"'");
	ResultSet rs4 = st4.executeQuery("SELECT Date_of_purchase FROM Reservation NATURAL JOIN Ticket  WHERE accountname='"+session.getAttribute("user")+"'");
	while(rs.next()){
		out.println("Reservation ");
		out.println(rs.getString("Unique_number")+":<br>");
		rs2.next();
		out.println("The Class is ");
		out.println(rs2.getString("class")+"<br>");
		rs3.next();
		out.println("The fare cost is");
		out.println("$"+rs3.getString("fare")+"<br>");
		rs4.next();
		out.println("The purchase date associated is");
		out.println(rs4.getString("Date_of_purchase")+"<br><br>");
	}
	
	out.println("<form action='customer.jsp'><input type='submit' value='Return'/></form>");
	



try{
	out.println("Here are flight you are on the waitlist for:<br>");
	ResultSet flight= st.executeQuery("select flight from waitlist where accountname='"+session.getAttribute("user")+"'");
	while(flight.next()){
		
		out.println(flight.getString("flight")+"<br>");
		
		
	}
	out.println("<form action='customer.jsp'><input type='submit' value='Return'/></form>");
	
}catch(Exception e){
	
	out.println("You are not on any flight waitlists.");
	out.println("<form action='customer.jsp'><input type='submit' value='Return'/></form>");
	
}

%>
<form action="displayCancelReservation.jsp">
<label for="accountname">Account Name:</label>
<input type="text" id="accountname" name="accountname">
<label for="ID">Ticket/Reservation ID:</label>
<input type="text" id="ID" name="ID">
<label for="delete">Delete Reservation:</label>
<select name="delete">

	<option value="Y">Delete</option>
	<option value="N">Do not delete</option>

</select>
<button type="submit">Submit</button>
</form>

<form action='logout.jsp'><input type='submit' value='Logout'/></form>