<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TenantZone</title>
    <link rel="stylesheet" href="/CSS/TenantCSS/header.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
    <header>
        <div class="logo">
            <h1 style="color: white;">TenantZone</h1>
        </div>
        <div class="toggle-menu" onclick="toggleMenu()">
            <i class="fas fa-bars"></i>
        </div>
        <nav>
            <ul id="nav-links">
                <li><a href="${pageContext.request.contextPath}/tenantUserPage">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/propertiesDetailsFetch">Properties</a></li>
                <li><a href="${pageContext.request.contextPath}/tenant/tenantAbout.jsp">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/tenant/Contact.jsp">Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/tenant/Update.jsp">Profile</a></li>
                <li><a href="${pageContext.request.contextPath}/">Sign in</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </nav>
    </header>

    <script>
        function toggleMenu() {
            const navLinks = document.getElementById('nav-links');
            navLinks.classList.toggle('show');
        }
    </script>
</body>
</html>
