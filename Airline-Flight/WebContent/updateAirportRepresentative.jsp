<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

/*

	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
    Statement st = con.createStatement();

	String op = request.getParameter("op");

	if(op.equals("add")){
		
		
		
	}else if(op.equals("update")){
		
		
		
	}else{
		
		
		
	}

*/

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

String op = request.getParameter("op");

if(op.equals("add")){
	
	try{
		
		int r = st.executeUpdate("insert into AirlineFlight.Airport values('"+request.getParameter("ID")+"')");
		if(r==0){
			
	        out.println("Failed to add Airport");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Added Airport");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to add Airport");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}else if(op.equals("update")){
	
	try{
		
		int r = st.executeUpdate("update AirlineFlight.Airport set 3letterID = '"+request.getParameter("ID")+"' where 3letterID='"+request.getParameter("old_ID")+"'");
		if(r==0){
			
	        out.println("Failed to update Airport");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Updated Airport");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to update Airport");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}else{
	
	try{
		
		int r = st.executeUpdate("delete from AirlineFlight.Airport where 3letterID = '"+request.getParameter("ID")+"'");
		if(r==0){
			
	        out.println("Failed to delete Airport");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Deleted Airport");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to delete Airport");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}

%>