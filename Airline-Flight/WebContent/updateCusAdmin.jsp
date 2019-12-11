<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
String op = request.getParameter("op");

String oldID = request.getParameter("oldAccName");
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
		
		if(userid == ""){
			ResultSet rs = st.executeQuery("select accountname from AirlineFlight.account where accountname='"+oldID+"'");
			while(rs.next()){
				userid = rs.getString(1);
			}
		}
		if(pwd == ""){
			ResultSet rs = st.executeQuery("select pass from AirlineFlight.account where accountname='"+oldID+"'");
			while(rs.next()){
				pwd = rs.getString(1);
			}
		}
		if(fname == ""){
			ResultSet rs = st.executeQuery("select firstname from AirlineFlight.account where accountname='"+oldID+"'");
			while(rs.next()){
				fname = rs.getString(1);
			}
		}
		if(lname == ""){
			ResultSet rs = st.executeQuery("select lastname from AirlineFlight.account where accountname='"+oldID+"'");
			while(rs.next()){
				lname = rs.getString(1);
			}
		}
		int r = st.executeUpdate("update AirlineFlight.account set accountname='"+userid+"', pass='"+pwd+"', firstname='"+fname+"', lastname='"+lname+"' where accountname='"+oldID+"'");
		if(r==0){
			out.println("Failed to edit customer");
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
