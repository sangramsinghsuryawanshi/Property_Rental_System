<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<link rel="stylesheet" href="CSS/registration.css">
</head>
<body>
	<form action="/registerUser" method="POST"
		enctype="multipart/form-data" onsubmit="return validateForm();">
		<c:if test="${not empty errorMessage}">
			<div class="error">${errorMessage}</div>
		</c:if>
		<h1>|| Registration Form ||</h1>
		<table>
			<tr>
				<td><label for="fullName">Full Name:</label></td>
				<td><input type="text" id="fullName" name="fullName"
					placeholder="Enter your full name" required></td>
			</tr>
			<tr>
				<td><label for="password">Password:</label></td>
				<td><input type="password" id="password" name="password"
					placeholder="Enter your password" required></td>
			</tr>
			<tr>
				<td><label for="confirmPassword">Confirm Password:</label></td>
				<td><input type="password" id="confirmPassword"
					name="confirmPassword" placeholder="Re-enter your password"
					required></td>
			</tr>
			<tr>
				<td><label for="email">Email:</label></td>
				<td><input type="email" id="email" name="email"
					placeholder="Enter your email address" required></td>
			</tr>
			<tr>
				<td><label for="contactNumber">Contact Number:</label></td>
				<td><input type="tel" id="contactNumber" name="contactNumber"
					placeholder="Enter your contact number" required></td>
			</tr>
			<tr>
				<td><label for="permentAddress">Permanent Address:</label></td>
				<td><input type="text" id="permentAddress"
					name="permentAddress" placeholder="Enter your address" required></td>
			</tr>
			<tr>
				<td><label for="city">City:</label></td>
				<td><input type="text" id="city" name="city"
					placeholder="Enter your city" required></td>
			</tr>
			<tr>
				<td><label for="state">State:</label></td>
				<td><input type="text" id="state" name="state"
					placeholder="Enter your state" required></td>
			</tr>
			<tr>
				<td><label for="pinCode">PIN Code:</label></td>
				<td><input type="text" id="pinCode" name="pinCode"
					placeholder="Enter your PIN code" required></td>
			</tr>
			<tr>
				<td><label for="country">Country:</label></td>
				<td><input type="text" id="country" name="country"
					placeholder="Enter your country" required></td>
			</tr>
			<tr>
				<td><label for="userRole">User Role:</label></td>
				<td><select id="userRole" name="userRole">
						<option value="tenant">Tenant</option>
						<option value="manager">Property Manager</option>
				</select></td>
			</tr>
			<tr>
				<td><label for="idProofType">ID Proof Type:</label></td>
				<td><select id="idProofType" name="idProofType">
						<option value="adharcard">Adhar Card</option>
						<option value="driverLicense">Driver’s License</option>
						<option value="pancardid">Pan Card</option>
				</select></td>
			</tr>
			<tr>
				<td><label for="idProofNumber">ID Proof Number:</label></td>
				<td><input type="text" id="idProofNumber" name="idProofNumber"
					placeholder="Enter your ID proof number" required></td>
			</tr>
			<tr>
				<td><label for="uploadIdProof">Upload ID Proof:</label></td>
				<td><input type="file" id="uploadIdProof" name="uploadIdProof"
					required></td>
			</tr>

		</table>
		<input type="checkbox" id="termsAndConditions"
			name="termsAndConditions" required> <label
			for="termsAndConditions">I agree to the <a href="#"
			id="termsLink" style="color: white;" >terms and conditions</a>.
		</label><br> <br> <input type="submit" value="Register"><br><br>
		<a href="/l" class="button">Login</a>
	</form>
	<script type="text/javascript" src="JS/TermsAndCondition.js"></script>
	<script type="text/javascript" src="JS/Validation.js"></script>
</body>
</html>
