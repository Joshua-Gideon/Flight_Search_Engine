<%@page import="java.util.ArrayList"%>
<%@page import="com.start.begin.model.Manifest"%>





	<h1>Flights</h1>
	<% ArrayList flights = (ArrayList)request.getAttribute("flights"); 
for (int i = 0; i < flights.size(); i++) 
{ 
Manifest flight = (Manifest) flights.get(i); 
%>
	<div class="flightsCard">
		<div class="flightBlock">
			<p>Airlines Name</p>
			<p><%=flight.getFlight_no() %></p>
		</div>
			
		<div class="">
			<span><%=flight.getArrival()%></span>
		</div>
		<div style="width: 20%;">
			<hr>
		</div>
		<div class="">
			<span><%=flight.getDeparture()%></span>
		</div>
		<div class="flightsBlock">
			<h3 align="center"><%=flight.getPrice() %></h3>
			
			<input type="button" class="bookbutton" value="Book Now">
		</div>
	</div>
	
	
	
	<% 
} 
%>