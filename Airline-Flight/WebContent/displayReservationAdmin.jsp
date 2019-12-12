<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
int filter = 0;
int flight = 0;
String fname = "";
String lname = "";
try{
	
	filter = Integer.parseInt(request.getParameter("filter"));
	if(filter==1){
		
		flight = Integer.parseInt(request.getParameter("data"));
		ResultSet rs = st.executeQuery("select firstname, lastname from Reservation natural join Associated natural join account where Flight="+flight);
		out.println("Reservations for Flight #"+flight+"<br>");
		while(rs.next()){
			fname = rs.getString(1);
			lname = rs.getString(2);
			out.println(fname+" "+lname+"<br>");
		}
		if(fname==""){
			out.println("<br> <br> No reservations for Flight #"+flight+"<br>");
			out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
		}else{
			out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
		}
		
	}else if(filter==2){
	
		String user = "";
		user=request.getParameter("data");
		ResultSet rs2 = st.executeQuery("select firstname, lastname from account where accountname='"+user+"'");
		while(rs2.next()){
			fname = rs2.getString(1);
			lname = rs2.getString(2);
		}
		out.println(fname+" "+lname+" has reservations on: <br>");
		ResultSet rs = st.executeQuery("select Flight from account natural join Associated natural join Reservation where accountname='" +user+ "'");
		while(rs.next()){
			flight = Integer.parseInt(rs.getString(1));
			out.println("Flight #"+flight+"<br>");
		}
		if(flight==0){
			out.println("<br> <br> No Flights<br>");
			out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
		}else{
			out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
		}
		
	}	
}catch(Exception e){
	out.println("Error obtaining reservations");
	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
}



%>
