<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();

String op = request.getParameter("op");
int id = -1;
int cap = -1;
try{
	
	id = Integer.parseInt(request.getParameter("ID"));
	
}catch(Exception e){}

try{
	
	cap = Integer.parseInt(request.getParameter("capacity"));
	
}catch(Exception e){}



if(op.equals("add")){
	
	
	try{
		
		int r = st.executeUpdate("insert into AirlineFlight.Aircraft values("+id+","+cap+",'"+request.getParameter("airline")+"')");
		if(r==0){
			
	        out.println("Failed to add Aircraft");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Added Aircraft");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to add Aircraft");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}else if(op.equals("update")){
	
	try{
		
		int r = st.executeUpdate("update AirlineFlight.Aircraft set Maximum_capacity="+cap+", 2letterID='"+request.getParameter("airline")+"' where Identifier="+id);
		if(r==0){
			
	        out.println("Failed to update Aircraft");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Updated Aircraft");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to update Aircraft");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}else{
	
	try{
		
		int r = st.executeUpdate("delete from AirlineFlight.Aircraft where Identifier="+id);
		if(r==0){
			
	        out.println("Failed to delete Aircraft");
	        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
			
		}else{
			
	        out.println("Deleted Aircraft");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}catch(Exception e){
		
        out.println("Failed to delete Aircraft");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}
	
}

%>