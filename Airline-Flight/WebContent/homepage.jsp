
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Flights</title>
</head>
<body>
Select an option: <!-- the usual HTML way -->


<br>
	<form method="post" action="checkLogin.jsp">
	<table>
	<tr>    
	<td>User</td><td><input type="text" name="user"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="pass"></td>
	</tr>
	</table>
	<input type="submit" value="Login">
	</form>
<br>

Create an account:
<br>
	<form method="post" action="checkCreate.jsp">
	<table>
	<tr>    
	<td>User</td><td><input type="text" name="user"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="pass"></td>
	</tr>
	</table>
	<input type="submit" value="Create Account">
	</form>
<br>


</body>
</html>