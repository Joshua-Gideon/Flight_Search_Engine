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
	HashMap<String, String> sort = new HashMap<String, String>();
sort.put("price", (String) request.getAttribute("sort_price"));
sort.put("duration", (String) request.getAttribute("sort_duration"));
ArrayList manifestList = (ArrayList) request.getAttribute("manifest");
%>
<%
	Comparator<Manifest> duration = new Comparator<Manifest>() {

	public int compare(Manifest s1, Manifest s2) {

		int a = s1.getId();
		int b = s2.getId();
		if (sort.get("duration") == "true")
	return a - b;
		else
	return b - a;

	}
};
Comparator<Manifest> durationD = new Comparator<Manifest>() {

	public int compare(Manifest s1, Manifest s2) {

		int a = s1.getId();
		int b = s2.getId();
		if (sort.get("duration") != "true")
	return a - b;
		else
	return b - a;

	}
};
manifestList.sort(duration);
%>
<h1>Flights</h1>
<div class="sortOptions" align="right" style="padding-right: 10px;">
	<button
		onclick="function(){<%if (sort.get("duration") == "true")
	sort.put("duration", "false");
else
	sort.put("duration", "true");
out.print(sort);
manifestList.sort(durationD);
response.setIntHeader("Refresh", 1);%>}">
		Duration
		<%
		if (sort.get("duration") == "false") {
	%>
		&#8593;
		<%
			} else if (sort.get("duration") == "true") {
		%>
		&#8595;
		<%
			}
		%>
	</button>

	<button onclick="">
		Price
		<%
		if (request.getAttribute("sort_price") == "false") {
	%>
		&#8593;
		<%
			} else if (request.getAttribute("sort_price") == "true") {
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