<%@page import="com.start.begin.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="shortcut icon"
	href="https://img.icons8.com/color/2x/airplane-take-off.png">
<meta charset="ISO-8859-1">
<title>My Page</title>
<style>
<%@include file="/WEB-INF/css/style.css"%>
</style>
</head>
<body>
	<div class="header">
		<div class="inner_header">
			<div class="logo_container">
				<h1>
					FLIGHT<span>TRAVEL</span>
				</h1>
			</div>
			<ul class="navigation">
				<li><a>About Us</a></li>
				<li><a>Contact Us</a></li>
				<li>
					<%
						if (request.getAttribute("UserName") == null) {
					%><a href="/login">Login</a> <%
 	} else {
 User u = (User) request.getAttribute("UserName");
 %><a href="/logout">Logout</a>
					<%
						}
					%>
				</li>
			</ul>
		</div>
	</div>
	<div class="search" align="center">
		<form action="/flights" method="GET">
			<input type="text" name="origin" placeholder="Origin"> <input
				type="text" name="destination" placeholder="Destination"> <input
				type="date" name="dateoftravel"> <input type="submit"
				name="submit" class="searchButton" value="Search">
		</form>
	</div>




</body>
</html>