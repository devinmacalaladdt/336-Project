<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

String op = request.getParameter("op");
int res = 0;
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
	
	
	String str = request.getParameter("dest");
	StringTokenizer defaultTokenizer = new StringTokenizer(str);
	
	try{
		
		while(defaultTokenizer.hasMoreTokens()){
			
			Statement st1 = con.createStatement();
			int r1=st1.executeUpdate("insert into AirlineFlight.Destination values('"+defaultTokenizer.nextToken()+"',"+flight+")");	
			
		}
		
	}catch(Exception e){
		
		
		
	}
	
	if(request.getParameter("fl").equals("int")){
		
		try{
			
			Statement st1 = con.createStatement();
			int r1=st1.executeUpdate("insert into AirlineFlight.International values("+flight+")");
			
		}catch(Exception e){}
		
	}else{
		
		try{
			
			Statement st1 = con.createStatement();
			int r1=st1.executeUpdate("insert into AirlineFlight.Domestic values("+flight+")");
			
		}catch(Exception e){}
		
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
	

	String str2 = request.getParameter("dest");
	StringTokenizer defaultTokenizer2 = new StringTokenizer(str2);
	
	try{
		
		Statement st1 = con.createStatement();
		int r = st1.executeUpdate("delete from AirlineFlight.Destination where Flight="+flight);
		
		while(defaultTokenizer2.hasMoreTokens()){
			
			Statement st2 = con.createStatement();
			int r1=st2.executeUpdate("insert into AirlineFlight.Destination values('"+defaultTokenizer2.nextToken()+"',"+flight+")");	
			
		}
		
	}catch(Exception e){
		
		
		
	}
	
	try{
		
		Statement st3 = con.createStatement();
		int r3 = st3.executeUpdate("delete from AirlineFlight.Domestic where Flight="+flight);

		
	}catch(Exception e){}
	
	try{
		
		Statement st3 = con.createStatement();
		int r3 = st3.executeUpdate("delete from AirlineFlight.International where Flight="+flight);

		
	}catch(Exception e){}
	
	if(request.getParameter("fl").equals("int")){
		
		try{
			
			Statement st2 = con.createStatement();
			int r2=st2.executeUpdate("insert into AirlineFlight.International values("+flight+")");
			
		}catch(Exception e){}
		
	}else{
		
		try{
			
			Statement st2 = con.createStatement();
			int r2=st2.executeUpdate("insert into AirlineFlight.Domestic values("+flight+")");
			
		}catch(Exception e){}
		
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