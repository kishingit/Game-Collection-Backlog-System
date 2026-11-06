<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Log - Portal Login & Register</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500;700;900&family=Rajdhani:wght@500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="game-container">
        <header class="game-header">
            <div class="logo">GAME<span>LOG</span></div>
            <p class="subtitle">Backlog & Collection Manager</p>
        </header>

        <%-- Server-Side Error / Success Feedback --%>
        <%
            String errorMsg = (String) request.getAttribute("error");
            String successMsg = (String) request.getAttribute("message");
            if (errorMsg != null) {
        %>
            <div class="system-message fail"><%= errorMsg %></div>
        <% } else if (successMsg != null) { %>
            <div class="system-message success"><%= successMsg %></div>
        <% } %>

        <!-- Registration Section -->
        <section id="registerSection">
            <h2>User Registration</h2>
            <form id="registerForm" action="register" method="post">
                <div class="input-group">
                    <label for="regUsername">Username:</label>
                    <input type="text" id="regUsername" name="username" placeholder="Enter username..." required>
                    <p id="regUsernameError" class="error"></p>
                </div>

                <div class="input-group">
                    <label for="regPassword">Password:</label>
                    <input type="password" id="regPassword" name="password" placeholder="Enter password..." required>
                    <p id="regPasswordError" class="error"></p>
                </div>

                <button type="submit" class="btn btn-primary">Register Account</button>
            </form>
            <div class="toggle-box">
                <p>Already registered? <button type="button" id="showLogin" class="btn-link">Go to Login</button></p>
            </div>
        </section>

        <!-- Login Section -->
        <section id="loginSection" hidden>
            <h2>Player Login</h2>
            <form id="loginForm" action="login" method="post">
                <div class="input-group">
                    <label for="loginUsername">Username:</label>
                    <input type="text" id="loginUsername" name="username" placeholder="Enter username..." required>
                    <p id="loginUsernameError" class="error"></p>
                </div>

                <div class="input-group">
                    <label for="loginPassword">Password:</label>
                    <input type="password" id="loginPassword" name="password" placeholder="Enter password..." required>
                    <p id="loginPasswordError" class="error"></p>
                </div>

                <button type="submit" class="btn btn-primary">Press Start</button>
            </form>
            <div class="toggle-box">
                <p>Need an account? <button type="button" id="showRegister" class="btn-link">Go to Registration</button></p>
            </div>
        </section>
    </div>

    <script src="js/script.js"></script>
</body>
</html>
