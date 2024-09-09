let currentPage = 1;
const rowsPerPage = 6;

// Search function to filter by location and type
function searchProperties() {
	const input = document.getElementById('searchInput').value.toLowerCase();
	const rows = document.querySelectorAll('.property-details');
	let matchedRows = 0;

	// Filter properties based on location and type
	rows.forEach(row => {
		const propertyLocation = row.querySelector('.property-location').textContent.toLowerCase();
		const propertyType = row.querySelector('.property-type').textContent.toLowerCase();

		// Check if the search input matches either location or type
		if (propertyLocation.includes(input) || propertyType.includes(input)) {
			row.style.display = '';
			matchedRows++;
		} else {
			row.style.display = 'none';
		}
	});

	// Show filtered rows, adjust pagination
	if (input === "") {
		showPage(currentPage);
	} else {
		currentPage = 1; // Reset to first page when search is active
		updatePaginationButtons(matchedRows); // Adjust pagination based on filtered results
	}
}

// Pagination logic remains the same
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

// Initialize
showPage(currentPage);
