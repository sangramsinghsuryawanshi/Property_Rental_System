<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Process Visit Requests</title>
<link rel="stylesheet" href="/CSS/processRequests.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<%@ include file="../includes/header.jsp"%>
<body>
	<c:if test="${not empty message}">
						<div class="message success">${message}</div>
					</c:if>
					<c:if test="${not empty errorMessage}">
						<div class="message error">${errorMessage}</div>
					</c:if>
	<h1>Process Visit Requests</h1>
	<h3 style="text-align: center;font-weight: bold;text-decoration: underline;">Search by date</h3>
	<div class="search-container">
    <input type="date" id="dateSearchInput" class="search-input" placeholder="Search by Date">
</div>
	
	<div class="request">
		<c:forEach var="request" items="${visitRequests}">
			<div class="form-container">
			<p>Preferred Property Name:<span>${request.propertyName}</span></p>
			<p>Preferred Property Address:<span>${request.propertyAddress}</span></p>
			<p>Preferred Property Type:<span>${request.propertyType}</span></p>
			<p>Property Price:<span>${request.propertyPrice}</span></p>
			<p>Preferred Visit Date:<span class="visit-date">${request.visitDate}</span></p>
			<p>Tenant Contact: <span>${request.contactNumber}</span></p>
			<p>Tenant Email: <span>${request.tenantEmail}</span></p>
			<p>Tenant Name: <span>${request.tenantName}</span></p>

				<form action="/sendMail" method="post">
					<div class="form-group">
						<label for="email-${request.id}">Recipient Email:</label> <input
							type="email" id="email-${request.id}" name="email" required
							placeholder="Enter recipient email">
					</div>
					<div class="form-group">
						<label for="subject-${request.id}">Subject:</label> <input
							type="text" id="subject-${request.id}" name="subject" required
							placeholder="Enter email subject">
					</div>
					<div class="form-group">
						<label for="message-${request.id}">Message:</label>
						<textarea id="message-${request.id}" name="message" required
							placeholder="Enter your message"></textarea>
					</div>
					<div class="form-group">
						<button type="submit" class="approve-button">Send Email</button>
					</div>
				</form>

			
				<form action="/deleteVisitRequest/${request.id}" method="post" onsubmit="return confirm('Are you sure you want to delete this user?')" style="display: inline;">
					<input type="hidden" name="requestId"/>
					<button type="submit" class="delete-button">Delete</button>
				</form>
			</div>
		</c:forEach>
	</div>
	<script type="text/javascript" src="JS/SearchedRequest.js"></script>
</body>
</html>
