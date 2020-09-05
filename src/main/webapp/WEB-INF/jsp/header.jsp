<%@page import="com.start.begin.model.User"%>
<div class="header">
		<div class="inner_header">
			<div class="logo_container">
				<h1>
					FLIGHT<span>TRAVEL</span>
				</h1>
			</div>
			<ul class="navigation">
				<li><a>About Us</a></li>
				<li><a>Contact Us</a></li>
				<li>
					<%
						if (request.getAttribute("UserName") == null) {
					%><a href="/login">Login</a> <%
 	} else {
 User u = (User) request.getAttribute("UserName");
 %><a href="/logout">Logout</a>
					<%
						}
					%>
				</li>
			</ul>
		</div>
	</div>