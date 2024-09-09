<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link rel="stylesheet" href="/CSS/headerFooter.css">
</head>
<body>
    <header>
    <div class="container2">
        <div class="logo">TenantZone</div>
        <nav>
            <span class="toggle-menu" onclick="toggleMenu()">&#9776;</span>
            <ul class="menu">
                <li><a href="${pageContext.request.contextPath}/managerUserPage">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/Manager/ManagerAddProperties.jsp">Add Properties</a></li>
                <li><a href="${pageContext.request.contextPath}/Manager/AboutManager.jsp">About</a></li>
                <li><a href="${pageContext.request.contextPath}/propertiesFetch">Actions</a></li>
                <li><a href="${pageContext.request.contextPath}/fetch">User Data</a></li>
                <li><a href="${pageContext.request.contextPath}/Inquiryfetch">Inquiry</a></li>
                <li><a href="${pageContext.request.contextPath}/Manager/ManagerUpdate.jsp">Profile</a></li>
                <li><a href="${pageContext.request.contextPath}/">Sign in</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Sign out</a></li>
            </ul>
        </nav>
    </div>
</header>
<script type="text/javascript">
function toggleMenu() {
    var menu = document.querySelector('.menu');
    menu.classList.toggle('active');
}

</script>
</body>
</html>
