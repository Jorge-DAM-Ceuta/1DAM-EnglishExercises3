<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Main</title>
</head>
<body>

<%@ page import="java.io.*, java.util.*, java.sql.*" %>

<% try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EnglishDAM", "root", "root");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from movies");
%>			

	<table>
		<tr>
			<th>Code</th>
			<th>Title</th>
			<th>Rating</th>
		</tr>
		
		<% while(rs.next()){ %>
				<tr>
					<td><%=rs.getInt("Code")%></td>
					<td><%=rs.getString("Title")%></td>
					<td><%=rs.getString("Rating")%></td>
				</tr>
		<% } %>
		
		<% }catch(IOException ioe){
				System.err.println(ioe.toString());
		}	
					
		%>
		
<% try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EnglishDAM", "root", "root");
		Statement stmt=con.createStatement();
		ResultSet rsm=stmt.executeQuery("select * from movietheaters");
%>			

	<table>
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Movie</th>
		</tr>
		
		<% while(rsm.next()){ %>
				<tr>
					<td><%=rsm.getInt("Code")%></td>
					<td><%=rsm.getString("Name")%></td>
					<td><%=rsm.getInt("Movie")%></td>
				</tr>
		<% } %>
		
		<% }catch(IOException ioe){
				System.err.println(ioe.toString());
		}	
					
		%>
		
	</table>

</body>
</html>