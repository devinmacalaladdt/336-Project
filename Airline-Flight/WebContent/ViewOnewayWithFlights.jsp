<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try{
	
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

	ResultSet rs = st.executeQuery("select * from Ticket NATURAL JOIN Oneway NATURAL JOIN Flight NATURAL JOIN Associated;");

	%><table border=1 align=center style="text-align:center">
	<thead>
	    <tr>
	       <th>Unique Number</th>
		       <th>Fare</th>
		       <th>Booking Fee</th>
		      <th>Class</th>
		      <th>Price</th>
		      <th>Flight</th>
       <th>Departure Time</th>
       <th>Days of Operation</th>
       <th>Arrival Time</th>
       <th>Airline</th>
       <th>Airport</th>

 
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
		          <td><%=rs.getInt("Flight") %></td>
          <td><%=rs.getTime("Departure_time") %></td>
          <td><%=rs.getString("Days_of_operation") %></td>
          <td><%=rs.getTime("Arrival_time") %></td>
          <td><%=rs.getString("2letterID") %></td>
          <td><%=rs.getString("3letterID") %></td>
	      </tr>
	      <%}%>
	     </tbody>
	  </table><br>
	<%}
	catch(Exception e){
		  out.print(e.getMessage());%><br><%
		}


%>






<br>

<form action='SortOnewayPrice.jsp'><input type='submit' value='Sort by Price'/></form>

<br>


<br>

<form action='home.jsp'><input type='submit' value='Return to Home'/></form>

<br>

<br>

<form action='Logout.jsp'><input type='submit' value='Logout'/></form>

<br>