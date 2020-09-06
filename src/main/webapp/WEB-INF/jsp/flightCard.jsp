<%@page import="java.util.ArrayList"%>
<%@page import="com.start.begin.model.Manifest"%>





	<h1>Flights</h1>
	<% ArrayList flights = (ArrayList)request.getAttribute("flights"); 
for (int i = 0; i < flights.size(); i++) 
{ 
Manifest flight = (Manifest) flights.get(i); 
%>
	<div style="border: 2px; padding: 8px; margin:8px; background-color: white; border-radius: 8px; border-color: red;">
		<h2 >
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