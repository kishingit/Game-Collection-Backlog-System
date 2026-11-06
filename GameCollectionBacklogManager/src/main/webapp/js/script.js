const registerSection = document.getElementById("registerSection");
const loginSection = document.getElementById("loginSection");

// Dynamic section switching
document.getElementById("showLogin")?.addEventListener("click", function () {
    registerSection.hidden = true;
    loginSection.hidden = false;
});

document.getElementById("showRegister")?.addEventListener("click", function () {
    loginSection.hidden = true;
    registerSection.hidden = false;
});

// Client-side validation prior to HTTP POST submission
document.getElementById("registerForm")?.addEventListener("submit", function (event) {
    const username = document.getElementById("regUsername").value.trim();
    const password = document.getElementById("regPassword").value;

    document.getElementById("regUsernameError").textContent = "";
    document.getElementById("regPasswordError").textContent = "";

    let valid = true;

    if (username === "") {
        document.getElementById("regUsernameError").textContent = "Username cannot be empty.";
        valid = false;
    } else if (username.length < 5) {
        document.getElementById("regUsernameError").textContent = "Username must contain at least 5 characters.";
        valid = false;
    }

    if (password === "") {
        document.getElementById("regPasswordError").textContent = "Password cannot be empty.";
        valid = false;
    } else if (password.length < 8) {
        document.getElementById("regPasswordError").textContent = "Password must contain at least 8 characters.";
        valid = false;
    } else if (!/[0-9]/.test(password)) {
        document.getElementById("regPasswordError").textContent = "Password must contain at least one digit.";
        valid = false;
    }

    if (!valid) {
        event.preventDefault(); // Stop form post if client validation fails
    }
});
