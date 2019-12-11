<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
int filter = 0;
try{
	
	filter = Integer.parseInt(request.getParameter("filter"));
	if(filter==1){
		
		int flight = 0;
		flight = Integer.parseInt(request.getParameter("data"));
		
		
		
		
	}else if(filter==2){
	
		String user = "";
		user=request.getParameter("data");
		ResultSet rs = st.executeQuery("select flight from waitlist where accountname='"+session.getAttribute("user")+"'");
		
		
		
		
	}
	
	
	
	
	
	ResultSet rs = st.executeQuery("SELECT SUM(Booking_fee) AS total FROM AirlineFlight.Ticket WHERE MONTH(Date_of_purchase)="+month+" AND YEAR(Date_of_purchase)="+year+" AND sold='Y'");
	String revenue = "";
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}catch(Exception e){
	out.println("Error obtaining sales report");
	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
}



%>
