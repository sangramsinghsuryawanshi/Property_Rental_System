let currentPage = 1;
	const rowsPerPage = 6;

	// Function to search and filter table rows based on city
	function searchTable() {
	    const input = document.getElementById('citySearchInput').value.toLowerCase();
	    const rows = document.querySelectorAll('.user-details');
	    let matchedRows = 0;

	    // Filter rows based on city search input
	    rows.forEach(row => {
	        const cityCell = row.querySelector('.user-city').textContent.toLowerCase();

	        if (cityCell.includes(input)) {
	            row.style.display = '';
	            matchedRows++;
	        } else {
	            row.style.display = 'none';
	        }
	    });

	    // Adjust pagination based on search results
	    if (input === "") {
	        showPage(currentPage);
	    } else {
	        currentPage = 1; // Reset to first page when search is active
	        updatePaginationButtons(matchedRows);
	        showPage(currentPage);
	    }
	}

	// Function to show specific page of rows
	function showPage(page) {
	    const rows = document.querySelectorAll('.user-details');
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
	    const rows = document.querySelectorAll('.user-details');
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

	// Add event listener to the city search input
	document.getElementById('citySearchInput').addEventListener('input', searchTable);

	// Initialize
	showPage(currentPage);