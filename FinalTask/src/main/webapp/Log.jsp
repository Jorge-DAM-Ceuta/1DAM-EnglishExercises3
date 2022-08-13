<%@ page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%LocalDate date= LocalDate.now();%>
	
	<form method="post" action="LoginServlet">
		
		<label>User</label></br>
		<input type="text" name="User" placeholder="Username / E-mail"/></br>
		
		<label>Password</label></br>
		<input type="text" name="Password" placeholder="*******"/></br>
		
		<input type="submit" value="Enviar"/>
	</form>
	
	<p>La fecha actual es: <%=date.toString()%></p>
	
</body>
</html>