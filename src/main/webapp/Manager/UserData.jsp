<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<link rel="stylesheet" type="text/css" href="/CSS/DataFetch.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<%@ include file="../includes/header.jsp"%>
</head>
<body>
	<div class="container3">
    <h2>User List</h2>
    <c:if test="${not empty message}">
        <div class="message success">${message}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="message error">${errorMessage}</div>
    </c:if>
    <!-- Search Input for City -->
    <div class="search-container">
        <input type="text" id="citySearchInput" class="search-input" placeholder="Search by City...">
    </div>
    <!-- User Table -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Contact Number</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>PIN Code</th>
                <th>Country</th>
                <th>User Role</th>
                <th>ID Proof Type</th>
                <th>ID Proof Number</th>
                <th>Photo</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${us}">
                <tr class="user-details">
                    <td>${user.id}</td>
                    <td>${user.fullName}</td>
                    <td>${user.email}</td>
                    <td>${user.contactNumber}</td>
                    <td>${user.permentAddress}</td>
                    <td class="user-city">${user.city}</td>
                    <td>${user.state}</td>
                    <td>${user.pinCode}</td>
                    <td>${user.country}</td>
                    <td>${user.userRole}</td>
                    <td>${user.idProofType}</td>
                    <td>${user.idProofNumber}</td>
                    <td><img src="<c:url value='/images/${user.uploadIdProofPath}'/>" alt="User Photo"></td>
                    <td>
                        <form action="<c:url value='/deleteUser/${user.id}'/>" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this user?');">
                            <input type="hidden" name="_method" value="DELETE" />
                            <button type="submit" class="button2">
                                <i class="fas fa-trash-alt"></i> Delete
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
	<div class="container3">
		<section class="feedback-display">
			<h2>Feedback Overview</h2>
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Rating</th>
						<th>Feedback</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="feedback" items="${feedbackList}">
						<tr>
							<td>${feedback.name}</td>
							<td>${feedback.rating}</td>
							<td>${feedback.feedback}</td>

							<td>
								<form action="<c:url value='/deleteFeedback${feedback.id}'/>"
									method="post" style="display: inline;"
									onsubmit="return confirm('Are you sure you want to delete this user?');">
									<input type="hidden" name="_method" value="DELETE" />
									<button type="submit" class="button2">
										<i class="fas fa-trash-alt"></i> Delete
									</button>
								</form>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
	<div class="container3">
		<section class="contact-display">
			<h2>Contact Requests Overview</h2>
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Message</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="contact" items="${contactList}">
						<tr>
							<td>${contact.name}</td>
							<td>${contact.email}</td>
							<td>${contact.message}</td>
							<td>
								<form action="<c:url value='/deleteContact${contact.id}'/>"
									method="post" style="display: inline;"
									onsubmit="return confirm('Are you sure you want to delete this user?');">
									<input type="hidden" name="_method" value="DELETE" />
									<button type="submit" class="button2">
										<i class="fas fa-trash-alt"></i> Delete
									</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
	<script type="text/javascript" src="JS/UserListSearch.js"></script>
</body>
</html>
