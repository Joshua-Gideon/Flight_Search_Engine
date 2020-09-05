<%@page import="java.util.ArrayList"%>
<%@page import="com.start.begin.model.Manifest"%>
<%@include file="/WEB-INF/jsp/header.jsp" %>
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
		<div>
			<span> Arrival:<%=flight.getDeparture()%></span>
		</div>
	</div>
	<% 
} 
%>