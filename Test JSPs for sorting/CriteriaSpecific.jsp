<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

String op = request.getParameter("op");

if(op.equals("tickets")){
	
		ResultSet rs = st.executeQuery("select * from Ticket;");

		%><table border=1 align=center style="text-align:center">
		<thead>
		    <tr>
		       <th>Unique Number</th>
		       <th>Fare</th>
		       <th>Booking Fee</th>
		      <th>Class</th>
		      <th>Price</th>
		    </tr>
		</thead>
		<tbody>
		  <%while(rs.next())
		  {
		      %>
		      <tr>
		          <td><%=rs.getInt("Unique_number") %></td>
		          <td><%=rs.getFloat("Fare") %></td>
		          <td><%=rs.getFloat("Booking_fee") %></td>
		          <td><%=rs.getString("class") %></td>
		          <td><%=rs.getFloat("Price") %></td>

		      </tr>
		      <%}%>
		     </tbody>
		  </table><br>
		<%}
		
		
else if(op.equals("byStops")){
	
	ResultSet rs = st.executeQuery("select * from Flight;");

	%><table border=1 align=center style="text-align:center">
	<thead>
	    <tr>
	       <th>Flight</th>
       <th>Departure Time</th>
       <th>Days of Operation</th>
       <th>Arrival Time</th>
       <th>Airline</th>
       <th>Airport</th>
       <th>Number of Stops</th>
	    </tr>
	</thead>
	<tbody>
	  <%while(rs.next())
	  {
	      %>
	      <tr>
	          <td><%=rs.getInt("Flight") %></td>
          <td><%=rs.getTime("Departure_time") %></td>
          <td><%=rs.getString("Days_of_operation") %></td>
          <td><%=rs.getTime("Arrival_time") %></td>
          <td><%=rs.getString("2letterID") %></td>
          <td><%=rs.getString("3letterID") %></td>
          <td><%=rs.getString("num_of_stops") %></td>
	      </tr>
	      <%}%>
	     </tbody>
	  </table><br>
	<%}

else if(op.equals("byDomestic")){
	
	ResultSet rs = st.executeQuery("select Flight.Flight,Flight.2letterID,Flight.3letterID,Flight.Days_of_operation,Domestic.Flight from Flight INNER JOIN Domestic on Flight.Flight = Domestic.Flight;");

	%><table border=1 align=center style="text-align:center">
	<thead>
	    <tr>
	       <th>Flight</th>
     
       <th>Days of Operation</th>
 
       <th>Airline</th>
       <th>Airport</th>
 
	    </tr>
	</thead>
	<tbody>
	  <%while(rs.next())
	  {
	      %>
	      <tr>
	          <td><%=rs.getInt("Flight") %></td>
    
          <td><%=rs.getString("Days_of_operation") %></td>
       
          <td><%=rs.getString("2letterID") %></td>
          <td><%=rs.getString("3letterID") %></td>
     
	      </tr>
	      <%}%>
	     </tbody>
	  </table><br>
	<%}

else if(op.equals("byInternational")){
	
	ResultSet rs = st.executeQuery("select Flight.Flight,Flight.2letterID,Flight.3letterID,Flight.Days_of_operation,International.Flight from Flight INNER JOIN International on Flight.Flight = International.Flight;");

	%><table border=1 align=center style="text-align:center">
	<thead>
	    <tr>
	       <th>Flight</th>
     
       <th>Days of Operation</th>
 
       <th>Airline</th>
       <th>Airport</th>
 
	    </tr>
	</thead>
	<tbody>
	  <%while(rs.next())
	  {
	      %>
	      <tr>
	          <td><%=rs.getInt("Flight") %></td>
    
          <td><%=rs.getString("Days_of_operation") %></td>
       
          <td><%=rs.getString("2letterID") %></td>
          <td><%=rs.getString("3letterID") %></td>
     
	      </tr>
	      <%}%>
	     </tbody>
	  </table><br>
	<%}

%>

<br>

<form action='SortTicket.jsp'><input type='submit' value='Sort Tickets by Price'/></form>

<br>
<br>

<form action='SortStops.jsp'><input type='submit' value='Sort by Stops'/></form>

<br>







<br>

<form action='home.jsp'><input type='submit' value='Return to Home'/></form>

<br>

<br>

<form action='Logout.jsp'><input type='submit' value='Logout'/></form>

<br>