document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.buy-button');

    buttons.forEach(button => {
        const availability = button.getAttribute('data-availability');

        if (availability === 'Available') {
            button.disabled = false;
            button.style.opacity = '1'; // Ensure the button is visible
            button.textContent = 'Contact Owner'; // Set the text for available properties
        } else {
            button.disabled = true;
            button.style.opacity = '0.5'; 
            button.style.cursor = 'not-allowed';
            button.textContent = 'Not Available';
        }
    });
});
