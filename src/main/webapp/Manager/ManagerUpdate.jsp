<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Manager Profile</title>
    <%@ include file="../includes/header.jsp"%>
    <link rel="stylesheet" type="text/css" href="<c:url value='/CSS/ManagerUpdate.css'/>">
</head>
<body>
    <div class="form-container">
        <h2>Update Information</h2>
        <form action="/updateAdmin" method="post">
            <input type="hidden" name="id" value="${muser.id}" />
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" value="${muser.fullName}" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="text" id="password" name="password" value="${muser.password}" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${muser.email}" required>
            </div>
            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <input type="text" id="contactNumber" name="contactNumber" value="${muser.contactNumber}" required>
            </div>
            <div class="form-group">
                <label for="permentAddress">Permanent Address:</label>
                <input type="text" id="permentAddress" name="permentAddress" value="${muser.permentAddress}" required>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" value="${muser.city}" required>
            </div>
            <div class="form-group">
                <label for="state">State:</label>
                <input type="text" id="state" name="state" value="${muser.state}" required>
            </div>
            <div class="form-group">
                <label for="pinCode">Pin Code:</label>
                <input type="text" id="pinCode" name="pinCode" value="${muser.pinCode}" required>
            </div>
            <div class="form-group">
                <label for="country">Country:</label>
                <input type="text" id="country" name="country" value="${muser.country}" required>
            </div>
            <div class="form-group">
                <button type="submit">Update</button>
            </div>
        </form>
    </div>
</body>
</html>

