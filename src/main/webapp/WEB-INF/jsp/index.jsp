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
	<div class="search">
	<form action="/flights" method="GET">
		<input type="text" name="origin" placeholder="Origin"> 
		<input type="text" name="destination" placeholder="Destination">
		<input type="date" name="dateoftravel">
		<input type="submit" name="submit" class="searchButton" value="Search">
	</form>
	</div>
	
	
	<div class="login">
		<form action="/login" method="post">
				<input type="text" name="userName" placeholder="Username" value="">
				<input type="text" name="password" placeholder="Password" value=""><br/>
				<input type="submit" class="loginButton" value="Login">
				<input type="button" class="loginButton" value="Register">
		</form>
	</div>

</body>
</html>