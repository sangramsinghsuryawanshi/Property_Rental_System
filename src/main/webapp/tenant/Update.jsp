<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Tenant Information</title>
    <link rel="stylesheet" href="/CSS/TenantCSS/UpdatePro.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%@ include file="../includes/tenantHeader.jsp" %>
<body>
    <div class="form-container">
        <h1>Update Your Information</h1>
        <form action="/updateTenant" method="post">
            <input type="hidden" name="id" value="${tuser.id}" />
            <table>
                <tr>
                    <td><label for="tenantName">Name:</label></td>
                    <td><input type="text" id="tenantName" name="fullName" value="${tuser.fullName}" required></td>
                </tr>
                <tr>
                    <td><label for="tenantPass">Password:</label></td>
                    <td><input type="text" id="tenantPass" name="password" value="${tuser.password}" required></td>
                </tr>
                <tr>
                    <td><label for="tenantEmail">Email:</label></td>
                    <td><input type="email" id="tenantEmail" name="email" value="${tuser.email}" required></td>
                </tr>
                <tr>
                    <td><label for="tenantPhone">Phone:</label></td>
                    <td><input type="text" id="tenantPhone" name="contactNumber" value="${tuser.contactNumber}" required></td>
                </tr>
                <tr>
                    <td><label for="tenantAddress">Address:</label></td>
                    <td><input type="text" id="tenantAddress" name="permentAddress" value="${tuser.permentAddress}" required></td>
                </tr>
                <tr>
                    <td><label for="tenantCity">City:</label></td>
                    <td><input type="text" id="tenantCity" name="city" value="${tuser.city}" required></td>
                </tr>
                <tr>
                    <td><label for="tenantState">State:</label></td>
                    <td><input type="text" id="tenantState" name="state" value="${tuser.state}" required></td>
                </tr>
                <tr>
                    <td><label for="tenantZip">Zip Code:</label></td>
                    <td><input type="text" id="tenantZip" name="pinCode" value="${tuser.pinCode}" required></td>
                </tr>
                <tr>
                    <td><label for="tenantCountry">Country:</label></td>
                    <td><input type="text" id="tenantCountry" name="country" value="${tuser.country}" required></td>
                </tr>
                <tr>
                    <td colspan="2" class="submit-row">
                        <button type="submit">Update Information</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
<%@ include file="../includes/footer.jsp" %>
</html>
