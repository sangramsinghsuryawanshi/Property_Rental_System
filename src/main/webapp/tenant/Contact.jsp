<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
<link rel="stylesheet" href="/CSS/TenantCSS/About.css">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%@ include file="../includes/tenantHeader.jsp"%>
<body>
	<section class="contact-form">
		<h2>Contact Us</h2>
		<form action="/contact" method="post">
			<table>
				<tr>
					<td><label for="name">Name:</label></td>
					<td><input type="text" id="name" name="name"
						placeholder="Enter your name" required></td>
				</tr>
				<tr>
					<td><label for="email">Email:</label></td>
					<td><input type="email" id="email" name="email"
						placeholder="Enter your email" required></td>
				</tr>
				<tr>
					<td><label for="message">Message:</label></td>
					<td><textarea id="message" name="message" rows="5"
							placeholder="Enter your message" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><button
							type="submit">Send Message</button></td>
				</tr>
			</table>
		</form>
	</section>

	<section class="feedback-form">
		<h2>Feedback</h2>
		<form action="/feedback" method="post">
			<table>

				<tr>
					<td><label for="Name">Name:</label></td>
					<td><input id="name" name="name" placeholder="Enter your Name"
						required></input></td>
				</tr>
				<tr>
					<td><label for="rating">Rating:</label></td>
					<td><select id="rating" name="rating" required>
							<option value="5">Excellent</option>
							<option value="4">Good</option>
							<option value="3">Average</option>
							<option value="2">Below Average</option>
							<option value="1">Poor</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="feedback">Feedback:</label></td>
					<td><textarea id="feedback" name="feedback" rows="5"
							placeholder="Share your experience" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<button	type="submit">Submit Feedback</button></td>
				</tr>
			</table>
		</form>
	</section>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>