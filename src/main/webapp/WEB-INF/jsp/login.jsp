<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style><%@include file="/WEB-INF/css/style.css"%></style>
</head>
<body style="background: white;">


<div class="loginImage"><img  alt="Image not found" src="https://image.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg"></div>

<div class="login">
		<h1 align="center">Login</h1>
		<div align="center">
		<form action="/login" method="post" >
				<input type="text" name="userName" placeholder="Username" value="">
				<input type="password" name="password" placeholder="Password" value=""><br/>

					<input type="submit" class="loginButton" value="Login">	
		</form>
		</div>
		<div align="center" style="margin-top:20px;margin-bottom:10px;">Don't have an account? <a style="color:blue;" >Register</a></div>
	</div>

</body>
</html>