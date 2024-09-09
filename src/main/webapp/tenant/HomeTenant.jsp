<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tenant User Page</title>
<link rel="stylesheet" href="CSS/TenantCSS/tenantHome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%@ include file="../includes/tenantHeader.jsp"%>
<body>
	<div class="tenant-dashboard">
		<h2>Welcome, ${user.fullName}.!</h2>
		<c:if test="${not empty message}">
			<div class="message success">${message}</div>
		</c:if>
		<c:if test="${not empty errorMessage}">
			<div class="message error">${errorMessage}</div>
		</c:if>
	</div>

	<main>
		<section class="hero">
			<h2>Your Dream Home Awaits</h2>
			<p>Find the perfect rental property with us.</p>
			<a href="/propertiesDetailsFetch" class="cta-button">Explore
				Properties</a>
		</section>

		<section class="features">
			<div class="feature">
				<i class="fas fa-search"></i>
				<h3>Advanced Search</h3>
				<p>Easily find properties that match your criteria with our
					advanced search options.</p>
			</div>
			<div class="feature">
				<i class="fas fa-map-marker-alt"></i>
				<h3>Interactive Maps</h3>
				<p>Explore neighborhoods and view properties on our interactive
					maps.</p>
			</div>
			<div class="feature">
				<i class="fas fa-headset"></i>
				<h3>24/7 Support</h3>
				<p>Our team is here to assist you any time with your property
					needs.</p>
			</div>
		</section>
		<section class="testimonials">
			<h2>What Our Clients Say</h2>

			<c:forEach var="feedback" items="${feedbackList}">
				<div class="testimonial">
					<p>"${feedback[0]}"</p>
					<span>- ${feedback[1]}</span>
				</div>
			</c:forEach>
		</section>
	</main>

	<div class="notifications">
		<h1>Notifications</h1>
		<div class="marquee">
			<marquee>
				<h3>New Property Added! New Property Added! New Property Added!</h3>
			</marquee>
		</div>
		<div class="notification-content">
			<p>
				<span class="label">Property Name:</span> <span class="value">${ProNotify1}</span>
			</p>
			<p>
				<span class="label">Description:</span> <span class="value">${ProNotify2}</span>
			</p>
			<a href="/propertiesDetailsFetch" class="view-property-button">See
				Properties</a>
		</div>
	</div>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>
