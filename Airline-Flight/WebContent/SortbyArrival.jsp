<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

try{

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from Flight order by Arrival_time ASC;");

%><table border=1 align=center style="text-align:center">
<thead>
    <tr>
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

Looking to see if we have a particular service?
<form action="MoreSpecificFlights.jsp">
	<select name="op">
	
	
		<option value="airline">View Airlines</option>
		<option value="airport">View Airports</option>
		
		</select>
		<button type="submit">Submit</button>
</form>
<hr>

Need to sort by particular criteria?
<form action="CriteriaSpecific.jsp">
	<select name="op">
	
		<option value="tickets">View Tickets</option>
		<option value="noStops">Flights With No Stops</option>
		<option value="withStops">Flights with Stops</option>
		
		</select>
		<button type="submit">Submit</button>
</form>
<hr>


<br>

<form action='SortbyTakeoff.jsp'><input type='submit' value='Sort by Takeoff'/></form>

<br>

<br>

<form action='SortbyFlightNum.jsp'><input type='submit' value='Sort by Flight Number'/></form>

<br>

<br>

<form action='home.jsp'><input type='submit' value='Return to Home'/></form>

<br>

<br>

<form action='Logout.jsp'><input type='submit' value='Logout'/></form>

<br>