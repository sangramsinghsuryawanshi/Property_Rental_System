
function validateForm() {
	var fullName = document.getElementById("fullName").value;
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var email = document.getElementById("email").value;
	var contactNumber = document.getElementById("contactNumber").value;
	var termsAndConditions = document.getElementById("termsAndConditions").checked;
	var fileInput = document.getElementById("uploadIdProof");
	var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;


	if (fullName.trim() === "") {
		alert("Please enter your full name.");
		return false;
	}

	if (password === "" || !passwordRegex.test(password)) {
		alert("Password must be between 6 to 20 characters and contain at least one numeric digit, one uppercase and one lowercase letter.");
		return false;
	}

	if (confirmPassword === "" || password !== confirmPassword) {
		alert("Passwords do not match.");
		return false;
	}

	if (email === "" || !emailRegex.test(email)) {
		alert("Please enter a valid email address.");
		return false;
	}

	if (contactNumber.trim() === "") {
		alert("Please enter your contact number.");
		return false;
	}

	if (!termsAndConditions) {
		alert("You must agree to the terms and conditions.");
		return false;
	}
	if (fileInput.files.length == 0) {
		alert("Please upload your ID proof.");
		return false;
	}
	return true;

}