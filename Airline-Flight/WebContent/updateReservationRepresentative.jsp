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
int id = -1;
try{
	
	id = Integer.parseInt(request.getParameter("ID"));
	
}catch(Exception e){}
ResultSet rs = st.executeQuery("select * from AirlineFlight.Reservation where accountname='"+request.getParameter("accountname")+"' AND Unique_number="+id);

if(!(rs.next())){
	
    out.println("Invalid Account or Ticket ID");
    out.println("<form action='representative.jsp'><input type='submit' value='Try Again'/></form>");
	
}else{
	
	Statement st1 = con.createStatement();
	
	if((request.getParameter("delete")).equals("Y")){
		
		int r = st1.executeUpdate("delete from AirlineFlight.Reservation where accountname='"+request.getParameter("accountname")+"' AND Unique_number="+id);
		
	}else{
		
		int r = st1.executeUpdate("update AirlineFlight.Reservation set valid='"+request.getParameter("valid")+"' where accountname='"+request.getParameter("accountname")+"' AND Unique_number="+id);
		
	}
	
    out.println("Update Made");
    out.println("<form action='representative.jsp'><input type='submit' value='Return'/></form>");
	
}

%>