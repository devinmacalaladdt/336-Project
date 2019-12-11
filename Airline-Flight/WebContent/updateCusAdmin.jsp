<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
String op = request.getParameter("op");

String oldid = request.getParameter("oldAccName");
String userid = request.getParameter("newAccName");   
String pwd = request.getParameter("newPass");
String fname = request.getParameter("newFname");
String lname = request.getParameter("newLname");

if(op.equals("add")){
	try{
    	if(userid=="" || pwd==""){throw new NullPointerException("empty");}
    	st.executeUpdate("insert into account values('" + userid + "','" + pwd + "','"+ fname + "','"+lname+ "','"+"c')");
        out.println("Account Added");
        out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
    	
    }catch(Exception e){
    	
    	 out.println("User already exists: try a different Username/Password");
    	 out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
    	
    }
}else if(op.equals("edit")){

	try{
		int r = st.executeUpdate("UPDATE AirlineFlight.account SET accountname='"+request.getParameter("newAccName")+"', pass='"+request.getParameter("newPass")+"', firstname='"+request.getParameter("newFname")+"', lastname='"+request.getParameter("newLname")+"' WHERE accountname="+request.getParameter("oldAccName"));
		if(r==0){
			out.println("Failed to edit Customer");
			out.println("<form action='admin.jsp'><input type='submit' value='Try Again'/></form>");
		}else{
			out.println("Edited Customer");
			out.println("<form action='admin.jsp'><input type='submit' value='Return'/></form>");
		}
	}catch(Exception e){
		out.println("Failed to edit Customer");
		out.println("<form action='admin.jsp'><input type='submit' value='Try Again'/></form>");
	}
}

%>
