<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

String op = request.getParameter("op");

if(op.equals("airline")){
	
		ResultSet rs = st.executeQuery("select * from Airline;");

		%><table border=1 align=center style="text-align:center">
		<thead>
		    <tr>
		       <th>Airlines in Service</th>
		    </tr>
		</thead>
		<tbody>
		  <%while(rs.next())
		  {
		      %>
		      <tr>
		          <td><%=rs.getString("2letterID") %></td>

		      </tr>
		      <%}%>
		     </tbody>
		  </table><br>
		<%}
		
		

		
		
else if(op.equals("airport")){
	
	ResultSet rs = st.executeQuery("select * from Airport;");

	%><table border=1 align=center style="text-align:center">
	<thead>
	    <tr>
	       <th>Airports in Service</th>
	    </tr>
	</thead>
	<tbody>
	  <%while(rs.next())
	  {
	      %>
	      <tr>
	          <td><%=rs.getString("3letterID") %></td>
	      </tr>
	      <%}%>
	     </tbody>
	  </table><br>
	<%}
%>

<br>

<form action='home.jsp'><input type='submit' value='Return to Home'/></form>

<br>

<br>

<form action='Logout.jsp'><input type='submit' value='Logout'/></form>

<br>