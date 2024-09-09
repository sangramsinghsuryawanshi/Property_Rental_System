<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="stylesheet" href="CSS/login.css">
</head>
<body>
	<form action="/Login" method="POST" enctype="multipart/form-data" onsubmit="return validateForm();">
		<c:if test="${not empty message}">
            <div class="message success">
                ${message}
            </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="message error">
                ${errorMessage}
            </div>
        </c:if>
		<h1>|| Login Form ||</h1>
		<table>
			<tr>
				<td><label for="email">Email:</label></td>
				<td><input type="email" id="email" name="email"
					placeholder="Enter your email address" required></td>
			</tr>
			<tr>
				<td><label for="password">Password:</label></td>
				<td><input type="password" id="password" name="password"
					placeholder="Enter your password" required></td>
			</tr>

		</table>
		<br> <input type="submit" value="Login"><br><br>
		<a class="t">Are you Registered?</a><br><br>
		<a href="/" class="button">Register Now</a>
	</form>
	<script type="text/javascript" src="JS/Validation.js"></script>
</body>
</html>
