<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%

	String res = request.getParameter("waitlist");
	if(res.equals("dont")){
		
		response.sendRedirect("representative.jsp");
		
	}else{
		
		
		try{
			
			String accountname = res.substring(0, res.indexOf(','));
			int flight = Integer.parseInt(res.substring(res.indexOf(',')+1));
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
		    Statement st = con.createStatement();
		    int r = st.executeUpdate("insert into AirlineFlight.waitlist values('"+accountname+"',"+flight+")");
			
		}catch(Exception e){}
        out.println("Added to waitlist");
        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
		
	}

%>
