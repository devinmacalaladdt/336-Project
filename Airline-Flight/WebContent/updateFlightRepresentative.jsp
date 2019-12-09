<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

String op = request.getParameter("op");
int flight = -1;
int stops = -1;
try{
	
	flight = Integer.parseInt(request.getParameter("flight"));
	
}catch(Exception e){}

try{
	
	stops = Integer.parseInt(request.getParameter("stops"));
	
}catch(Exception e){}



if(op.equals("add")){
	
	
	try{
		
		int r = st.executeUpdate("insert into AirlineFlight.Flight values("+flight+",'"+request.getParameter("dep-time")+"','"+request.getParameter("day")+"','"+request.getParameter("arr-time")+"','"+request.getParameter("airline")+"','"+request.getParameter("airport")+"',"+stops+")");
		if(r==0){
			
	        out.println("Failed to add Flight");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Added Flight");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to add Flight");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}else if(op.equals("update")){
	
	try{
		
		int r = st.executeUpdate("update AirlineFlight.Flight set Departure_time='"+request.getParameter("dep-time")+"', Days_of_operation='"+request.getParameter("day")+"', Arrival_time='"+request.getParameter("arr-time")+"', 2letterID='"+request.getParameter("airline")+"', 3letterID = '"+request.getParameter("airport")+"', num_of_stops="+stops+" where Flight="+flight);
		if(r==0){
			
	        out.println("Failed to update Flight");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Updated Flight");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to update Flight");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}else{
	
	try{
		
		int r = st.executeUpdate("delete from AirlineFlight.Flight where Flight="+flight);
		if(r==0){
			
	        out.println("Failed to delete Flight");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Deleted Flight");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to delete Flight");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}

%>