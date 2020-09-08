<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Comparator"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.start.begin.model.Flights"%>
<%@page import="com.start.begin.controller.becontroller"%>
<%@page import="com.start.begin.dao.FlightsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.start.begin.model.Manifest"%>


<%
	HashMap<String, Boolean> sort = (HashMap<String, Boolean>) request.getAttribute("sort");
ArrayList manifestList = (ArrayList) request.getAttribute("manifest");
System.out.println(sort);
%>
<h1>Flights</h1>
<div class="sortOptions" align="right" style="padding-right: 10px;">
	<button
		onclick="location.href ='/filters?stops='+stops+'&min_price='+min+'&max_price='+max+'&sortOption=duration';">
		Duration
		<%
		if (sort.get("duration") != null && sort.get("duration") == true) {
	%>
		&#8593;
		<%
			} else if (sort.get("duration") != null && sort.get("duration") == false) {
		%>
		&#8595;
		<%
			}
		%>
	</button>

	<button
		onclick="location.href ='/filters?stops='+stops+'&min_price='+min+'&max_price='+max+'&sortOption=price';">
		Price
		<%
		if (sort.get("price") != null && sort.get("price") == true) {
	%>
		&#8593;
		<%
			} else if (sort.get("price") != null && sort.get("price") == false) {
		%>
		&#8595;
		<%
			}
		%>
	</button>
</div>
<%
	if (manifestList.size() == 0) {
%>
<div class="noFlights">
	<p align="center">No Flights Available</p>
</div>
<%
	} else {

for (int i = 0; i < manifestList.size(); i++) {
	Manifest manifest = (Manifest) manifestList.get(i);
	ArrayList flightsList = (ArrayList) request.getAttribute("flightsList");
	Flights flight = (Flights) flightsList.get(i);
%>

<div align="center" class="flightsCard">
	<div class="flightBlock">
		<p style="margin-bottom: 0px;"><%=flight.getAirline()%></p>
		<p style="margin-top: 0px;"><%=manifest.getFlight_no()%></p>
	</div>

	<div class="time">
		<span><%=manifest.getArrival()%></span><br /> <span><%=manifest.getOrigin()%></span>
	</div>
	<div style="width: 20%; padding: 10px;">
		<p style="width: 20%; margin: 0px; margin-top: 5px;"><%=manifest.getStops()%></p>
		<hr>
		<p align="center" style="margin: 0px; margin-top: 0px;"><%=manifest.getDuration()%></p>
	</div>
	<div class="time">
		<span><%=manifest.getDeparture()%></span><br /> <span><%=manifest.getDestination()%></span>
	</div>
	<div class="flightsBlock">

		<h3 align="center" style="margin-bottom: 5px; margin-top: 15px;">
			&#8377;<%=manifest.getPrice()%></h3>

		<input type="button" class="bookbutton"
			style="margin-top: 0px; margin-bottom: 0px;" value="Book Now">
	</div>
</div>



<%
	}
}
%>

