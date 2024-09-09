<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule a Visit</title>
<link rel="stylesheet" href="/CSS/TenantCSS/ContactOwner.css">
   <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%@ include file="../includes/tenantHeader.jsp"%>
<body>
	<form id="visitForm" class="visit-form" action="/scheduleVisit" method="post">
	
	<h2 style="text-align: center;">Request a Visit for <span style="color: orange;">${property.propertyName}</span></h2>
    
  	<h3 style="text-align: center;font-weight: bold;text-decoration: underline;">property details</h3>
  	<label for="propertyName">property Name:</label>
    <input type="text" name="propertyName" value="${property.propertyName}" readonly="readonly">
    
    <label for="propertyAddress">property Address:</label>
    <input type="text" name="propertyAddress" value="${property.propertyAddress}" readonly="readonly">
    
    <label for="propertyType">property Type:</label>
    <input type="text" name="propertyType" value="${property.propertyType}" readonly="readonly">
    
    <label for="propertyPrice">property Price:</label>
    <input type="text" name="propertyPrice" value="${property.propertyPrice}" readonly="readonly">
	
    <label for="visitDate">Preferred Visit Date:</label>
    <input type="date" id="visitDate" name="visitDate" required />
	
    <label for="contactNumber">Your Contact Number:</label>
    <input type="tel" id="contactNumber" name="contactNumber" placeholder="Enter your contact number" required />

	 <label for="TenantEmail">Your Email:</label>
    <input type="email" id="TenantEmail" name="TenantEmail" placeholder="Enter your valid email" required />
    
    <label for="TenantName">Your Name:</label>
    <input type="text" id="TenantName" name="TenantName" placeholder="Enter your Name" required />
    
    <button type="submit" class="schedule-button">Request Visit</button>
</form>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>
