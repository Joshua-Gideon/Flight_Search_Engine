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
<link rel="shortcut icon"
	href="https://img.icons8.com/color/2x/airplane-take-off.png">
<meta charset="ISO-8859-1">
<title>Flights</title>
<style><%@include file="/WEB-INF/css/style.css"%></style>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src ="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src ="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
var min=1,max = 50000, stops=0;
stops= <%=request.getAttribute("stops")%>===null? null :parseInt(<%=request.getAttribute("stops")%>);
min= <%=request.getAttribute("min")%>===null? min :parseInt(<%=request.getAttribute("min")%>);
max= <%=request.getAttribute("max")%>===null? max :parseInt(<%=request.getAttribute("max")%>);

	$( function() {
		$( "#slider-range" ).slider({
			range: true,
			min: 1,
			max: 50000,
			values: [ min, max],
			slide: function( event, ui ) {
				min=ui.values[0];
				max=ui.values[1];
				$( "#amount" ).val( ""+ui.values[ 0 ] +" - " +ui.values[ 1 ] );
			}
		});
		$( "#amount" ).val( ""+$( "#slider-range" ).slider( "values", 0 ) +
			 " - "+$( "#slider-range" ).slider( "values", 1 ) );

	} );
	
	console.log(min,max);

	$(function(){
		$("#stops").slider({
			min:0,
			max:10,
			value: <%=request.getAttribute("stops")%>==null ? 0 :stops,
			slide:function(event,ui){
			stops = ui.value;
			$("#stopsLabel").val(ui.value);
				}
			});
		if(<%=request.getAttribute("stops")%>==null )
			$("#stopsLabel").val(" All");
		else
			$("#stopsLabel").val(" "+$("#stops").slider("value"));
		});
	
	</script>
	
</head>
<body>


<%@include file="/WEB-INF/jsp/header.jsp" %>


	<div class="searchResultBar" align="center">
		<h1 align="left">Search</h1>
		<form action="/flights" method="GET">
			<input type="text" name="origin" placeholder="Origin" value="<%=request.getAttribute("origin") %>"> 
			<input
				type="text" name="destination" placeholder="Destination" value="<%=request.getAttribute("destination") %>"> 
				<input
				type="date" name="dateoftravel"> 
				<div align="center">
				<input type="submit"
				name="submit" class="searchButton" value="Search">
				</div>
		</form>
	</div>
	
	
<div class="flightsResult">

<%@ include file="/WEB-INF/jsp/flightCard.jsp" %>

</div>

<div class="filters">
	<h1 align="left">Filters</h1>
<div class="priceFilter">
	<h2 align="left">Price</h2>
	<div id="slider-range"></div>
	<p>
		<label for="amount">Price Range:</label>
		<input type="text" id="amount" readonly style="border:0; color:black; font-weight:bold;">
	</p>
</div>

<div class="priceFilter">
	<h2 align="left">No of Stops</h2>
	<div id="stops"></div>
	<p>
		<label for="stopsLabel">No of Stops:</label>
		<input type="text"  id="stopsLabel" readonly style="border:0; color:black; font-weight:bold;">
		
	</p>
</div>

<div >
<button class="filterButtons" onclick="location.href ='/clear'">Clear</button>
<button class="filterButtons" onclick="location.href ='/filters?stops='+stops+'&min_price='+min+'&max_price='+max;">Apply</button>
</div>


</div>
	

</body>


</html>