<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
int month = -1;
int year = -1;
try{
	
	month = Integer.parseInt(request.getParameter("month"));
	String monthS = "";
	year = Integer.parseInt(request.getParameter("year"));
	ResultSet rs = st.executeQuery("SELECT SUM(Booking_fee) AS total FROM AirlineFlight.Ticket WHERE MONTH(Date_of_purchase)="+month+" AND YEAR(Date_of_purchase)="+year+" AND sold='Y'");
	String revenue = "";
	
	if(month==1){
		monthS = "January";
	}else if(month==2){
		monthS = "February";
	}else if(month==3){
		monthS = "March";
	}else if(month==4){
		monthS = "April";
	}else if(month==5){
		monthS = "May";
	}else if(month==6){
		monthS = "June";
	}else if(month==7){
		monthS = "July";
	}else if(month==8){
		monthS = "August";
	}else if(month==9){
		monthS = "September";
	}else if(month==10){
		monthS = "October";
	}else if(month==11){
		monthS = "November";
	}else if(month==12){
		monthS = "December";
	}
	
	
	while(rs.next()){
		revenue = rs.getString(1);
	}
	if(revenue!=null){
		out.println("Revenue for   "+monthS+"   " +year+ ":         $"+revenue);
		out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
	}else{
		out.println("No revenue generated for   "+monthS+"   "+year);
		out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
	}
	
}catch(Exception e){
	out.println("Error obtaining sales report");
	out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
}



%>
