<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>

<% 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT accountname FROM account WHERE accountname='"+request.getParameter("accountname")+"'");
	if(!(rs.next())){
		
        out.println("User does not exist");
        out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
		
	}else{
		
		int flight = Integer.parseInt(request.getParameter("flight"));
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("SELECT p.Unique_number FROM (SELECT Unique_number FROM AirlineFlight.Associated WHERE Flight="+flight+") AS p WHERE p.Unique_number NOT IN(SELECT Unique_number FROM AirlineFlight.Reservation)");
		
		if(!(rs1.next())){
			
			out.println("No Resevervations available, join waitlist?");
			out.println("<form action='addWaitlistRepresentative.jsp'><select name='waitlist'><option value='"+request.getParameter("accountname")+","+flight+"'>Add</option><option value='dont'>Don't Add</option></select><input type='submit' value='submit'/></form>");
			
		}else{
			
			Statement st2 = con.createStatement();
			int r = st2.executeUpdate("insert into AirlineFlight.Reservation values("+rs1.getInt("p.Unique_number")+",'"+request.getParameter("accountname")+"','Y')");
	        out.println("Reservation Made");
	        out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
			
		}
		
	}
	
	
%>
</body>
</html>