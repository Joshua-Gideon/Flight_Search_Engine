<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="https://img.icons8.com/color/2x/airplane-take-off.png">
<meta charset="ISO-8859-1">
<title>My Page</title>
<style>
body {
	background-image:
		url("https://images.unsplash.com/photo-1530521954074-e64f6810b32d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	display: block;
    margin: 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
}

form {
	width: 400px;
	margin: auto;
	margin-top: 150px;
}

input {
	padding: 4px 10px;
	border: 0;
	font-size: 16px;
}

.search {
	width: 75%;
}

.submit {
	width: 70px;
	background-color: #1c87c9;
	color: #ffffff;
}
.see {
	width: 75%;
	margin-top: 50px;
}

.header{
	width: 100%;
	height: 80px;
	display: block;
	background-color: #101010;   
	padding: 0px;
}
.inner_header{
	width: 1300px;
	height: 100%;
	display: block;
	margin: 0 auto;
	
}
.logo_container{
	height: 100%;
	display: table;
	float: left;
}
.logo_container h1{
	color: white;
	height: 100%;
	display: table-cell;
	vertical-align: middle;
	font-family: "Times New Roman", Times, serif;
	font-size: 35px;
	font-weight: 200;
}
.logo_container h1 span{
	font-weight: 800;
}
.navigation{
	float: right;
	height: 100%;
}
.navigation a{
	height: 100%;
	display: table;
	float: left;
	padding: 0px 20px;
}
.navigation a:last-child{
	padding-right: 0;
}
.navigation a li{
	display: table-cell;
	vertical-align: middle;
	padding-bottom: 30px;
	height: 100%;
	color: white;
	font-family: "Times New Roman", Times, serif;
	font-size: 19px;
}
</style>
</head>
<body>
	<div class="header">
  <div class="inner_header">
  <div class="logo_container">
  <h1>FLIGHT<span>TRAVEL</span></h1>
  </div>
  <ul class="navigation">
  	<a><li>About Us</li></a>
  	<a><li>Contact Us</li></a>
  	<a><li>Feedback</li></a>
  </ul>
  </div>
</div>
	<form action="/flights" method="GET">
		<input type="text" name="text" class="search"
			placeholder="Enter your location"> 
		<input type="text" name="text" class="see"
			placeholder="Enter your destination"> 
		<input type="submit"
			name="submit" class="submit" value="Search">
	</form>
	<a href="/flights">Flights></a>
	
</body>
</html>