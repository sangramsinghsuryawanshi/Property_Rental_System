<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manager User Page</title>
    <link rel="stylesheet" href="CSS/ManagerHome.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<%@ include file="../includes/header.jsp"%>
<body>
    <div class="container">
        <h2>
            Welcome, <span style="color:red;text-decoration: underline;">
                <c:out value="${muser.fullName}" />
            </span>!
        </h2>
        <p>This is your management dashboard. Here you can view and manage all user data, oversee operations, and more.</p>
    </div>
    <div class="dashboard">
        <div class="metric">
            <i class="fas fa-building"></i>
            <h2>Total Properties</h2>
            <p>${cntOfProperties}</p>
        </div>
        <div class="metric">
            <i class="fas fa-users"></i>
            <h2>Total Users</h2>
            <p><c:out value="${tenant}" /></p>
        </div>
        <div class="metric">
            <i class="fas fa-user-shield"></i>
            <h2>Total Admins</h2>
            <p><c:out value="${manager}" /></p>
        </div>
        <div class="metric">
            <i class="fas fa-comments"></i>
            <h2>Total Inquiry</h2>
            <p>${InquiryCnt}</p>
        </div>
        <div class="metric">
            <i class="fas fa-phone"></i>
            <h2>User Contact</h2>
            <p>${contactCnt}</p>
        </div>
        <div class="metric">
            <i class="fas fa-star"></i>
            <h2>User Feedback</h2>
            <p>${userFeedback}</p>
        </div>
    </div>
</body>

</html>
