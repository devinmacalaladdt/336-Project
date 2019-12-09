<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
int flight = -1;
try{
	
	flight = Integer.parseInt(request.getParameter("flight"));
	
}catch(Exception e){}
try{
	
	ResultSet rs = st.executeQuery("select accountname from waitlist where flight="+flight);
	out.println("<h3>Waitlist for "+flight+"</h3>");
	while(rs.next()){
		
		out.println(rs.getString("accountname")+"<br>");
		
		
	}
	out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
	
}catch(Exception e){
	
	out.println("No members for this flight waitlist");
	out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
	
}

%>