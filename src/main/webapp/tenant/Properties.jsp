<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Property Details</title>
<link rel="stylesheet" href="/CSS/TenantCSS/propertyDetails.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%@ include file="../includes/tenantHeader.jsp"%>
<body>
	<div class="search-container">
		<input type="text" id="searchInput" onkeyup="searchProperties()"
			placeholder="Search by location or type..."
			title="Search by location or type">
	</div>

	<div class="container">
		<h1>Property Details</h1>

		<c:forEach var="property" items="${properties}">
			<c:if test="${not empty property}">
				<div class="property-details">
					<h2>${property.propertyName}</h2>
					<p class="property-location">
						<strong>Location:</strong> ${property.propertyAddress}
					</p>
					<p class="property-type">
						<strong>Type:</strong> ${property.propertyType}
					</p>
					<p>
						<strong>Price:</strong> &#8377; ${property.propertyPrice}
					</p>
					<p>
						<strong>Description:</strong> ${property.propertyDescription}
					</p>
					<p class="property-availability">
						<strong>Availability:</strong>
						<c:choose>
							<c:when test="${property.availability == 'Available'}">
                        Available
                    </c:when>
							<c:otherwise>
                        Not Available
                    </c:otherwise>
						</c:choose>
					</p>
					<c:if test="${not empty property.propertyImage}">
						<img src="/PropertyImages/${property.propertyImage}"
							alt="Property Image">
					</c:if>
					<button class="show-map-button"
						onclick="toggleMap(${property.id}, ${property.latitude}, ${property.longitude}, '${property.propertyName}')">Show
						Map</button>
					<div id="map-${property.id}" class="map"
						style="display: none; height: 400px; width: 100%;"></div>
					<form action="/handleForm" method="post">
						<input type="hidden" name="id" value="${property.id}" />
						<button type="submit" class="buy-button"
							data-availability="${property.availability}">Contact
							Owner</button>
					</form>
				</div>
			</c:if>
		</c:forEach>
	</div>

	<div class="pagination">
		<button onclick="prevPage()">Previous</button>
		<button onclick="nextPage()">Next</button>
	</div>


	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGrJS9uJaqvv-3O77TxuPwOKaUBkX5cxY"
		async defer></script>

	<script type="text/javascript" src="JS/SearchPropertiesTenant.js"></script>
	<script type="text/javascript" src="JS/MapTenant.js"></script>
	<script type="text/javascript" src="JS/StatusHidden.js"></script>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>
