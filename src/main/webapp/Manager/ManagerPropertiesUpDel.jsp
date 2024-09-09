<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Property List</title>
    <link rel="stylesheet" href="/CSS/ShowProperties.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<%@ include file="../includes/header.jsp"%>
<body>
    <div class="container3">
        <h1>Property Lists</h1>
        
        <c:if test="${not empty message}">
            <div class="message success">${message}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>
        
        <div class="search-pagination">
            <input type="text" id="searchInput" placeholder="Search by type" onkeyup="searchProperties()">
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Property Name</th>
                    <th>Address</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Image</th>
                    <th>Actions</th>
                    <th>Location</th>
                </tr>
            </thead>
            <tbody id="propertyTableBody">
                <c:forEach var="property" items="${properties}">
                    <tr class="property-details">
                        <td>${property.id}</td>
                        <td>${property.propertyName}</td>
                        <td>${property.propertyAddress}</td>
                        <td class="property-type">${property.propertyType}</td>
                        <td>${property.propertyPrice}</td>
                        <td>${property.propertyDescription}</td>
                        <td>${property.availability}</td>
                        <td><img src="/PropertyImages/${property.propertyImage}" alt="Property Image" width="100"></td>
                        <td class="button">
                            <a href="${property.id}" class="btn btn-primary" style="margin-right: 10px;">
                                <i class="fas fa-edit"></i> Update
                            </a>
                            <form action="/deleteProperty/${property.id}" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this property?');">
                                <button type="submit" class="btn btn-danger">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </td>
                        <td>
                            <button class="btn" onclick="showMap(${property.latitude}, ${property.longitude})">Show Map</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div id="map"></div>
    </div>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGrJS9uJaqvv-3O77TxuPwOKaUBkX5cxY&callback=initMap" async defer></script>
    <script>
        let map;
        let marker;

        function initMap() {
            const initialLocation = { lat: -34.397, lng: 150.644 };
            map = new google.maps.Map(document.getElementById("map"), {
                center: initialLocation,
                zoom: 8,
            });
        }

        function showMap(lat, lng) {
            const location = { lat: lat, lng: lng };
            map.setCenter(location);
            map.setZoom(14);

            if (marker) {
                marker.setMap(null);
            }

            marker = new google.maps.Marker({
                position: location,
                map: map,
            });
        }

        let currentPage = 1;
        const rowsPerPage = 6;

        function searchProperties() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll('.property-details');
            let matchedRows = 0;

            rows.forEach(row => {
                const propertyLocation = row.querySelector('.property-location') ? row.querySelector('.property-location').textContent.toLowerCase() : '';
                const propertyType = row.querySelector('.property-type').textContent.toLowerCase();

                if (propertyLocation.includes(input) || propertyType.includes(input)) {
                    row.style.display = '';
                    matchedRows++;
                } else {
                    row.style.display = 'none';
                }
            });

            if (input === "") {
                showPage(currentPage);
            } else {
                currentPage = 1;
                updatePaginationButtons(matchedRows);
            }
        }

        function showPage(page) {
            const rows = document.querySelectorAll('.property-details');
            const start = (page - 1) * rowsPerPage;
            const end = start + rowsPerPage;

            rows.forEach((row, index) => {
                row.style.display = (index >= start && index < end) ? '' : 'none';
            });

            updatePaginationButtons(rows.length);
        }

        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        }

        function nextPage() {
            const rows = document.querySelectorAll('.property-details');
            if ((currentPage * rowsPerPage) < rows.length) {
                currentPage++;
                showPage(currentPage);
            }
        }

        function updatePaginationButtons(totalRows) {
            const maxPage = Math.ceil(totalRows / rowsPerPage);
            document.querySelector('.pagination button:nth-of-type(1)').disabled = currentPage === 1;
            document.querySelector('.pagination button:nth-of-type(2)').disabled = currentPage === maxPage || totalRows === 0;
        }

        showPage(currentPage);
    </script>
</body>
</html>
