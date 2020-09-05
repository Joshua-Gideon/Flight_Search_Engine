<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style><%@include file="/WEB-INF/css/style.css"%></style>
</head>
<body>


<div class="login">
		<h1>Login</h1>
		<form action="/login" method="post" >
				<input type="text" name="userName" placeholder="Username" value="">
				<input type="password" name="password" placeholder="Password" value=""><br/>

					<input type="submit" class="loginButton" value="Login">
					<input type="button" class="loginButton" value="Register">
	
		</form>
	</div>

</body>
</html>