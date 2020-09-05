<%@page import="com.start.begin.model.Manifest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.aspectj.weaver.ast.Var"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.start.begin.model.Flights"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="shortcut icon"
	href="https://img.icons8.com/color/2x/airplane-take-off.png">
<meta charset="ISO-8859-1">
<title>Flights</title>
<style><%@include file="/WEB-INF/css/style.css"%></style>
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
				<a><li>About Us</li></a>
				<a><li>Contact Us</li></a>
				<a><li>Feedback</li></a>
			</ul>
		</div>
	</div>
	<h1>Flights</h1>
	<% ArrayList flights = (ArrayList)request.getAttribute("flights"); 
for (int i = 0; i < flights.size(); i++) 
{ 
Manifest flight = (Manifest) flights.get(i); 
%>
	<div>
		<h2>
			Flight No:
			<%=flight.getFlight_no() %></h2>
		
		<div>
			<span>Departure:<%=flight.getArrival()%></span>
		</div>
		</br>
		<div>
			<span> Arrival:<%=flight.getDeparture()%></span>
		</div>
	</div>
	<% 
} 
%>

</body>
</html>