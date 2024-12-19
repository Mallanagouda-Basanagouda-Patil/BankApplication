<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="max-width: 400px; width: 100%; border-radius: 12px;">
        <div class="card-body">
            <h2 class="text-center text-primary mb-4">Welcome Back</h2>
			
            <%-- Display error message if available --%>
             <% String success = (String) request.getAttribute("success"); %>
            <% if (success != null) { %>
                <p class="text-success text-center mb-3"><%= success %></p>
            <% } %>
            <% String failure = (String) request.getAttribute("failure"); %>
            <% if (failure != null) { %>
                <p class="text-danger text-center mb-3"><%= failure %></p>
            <% } %>

            <form action="login" method="post">
                <%-- CSRF Token --%>
                <input type="hidden" name="csrf_token" value="<%= (String) request.getAttribute("csrf_token") %>">

                <div class="mb-3">
                    <label for="username" class="form-label fw-bold">Account Number</label>
                    <input type="text" id="username" name="AccountNo" class="form-control" placeholder="Enter your Account number" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label fw-bold">Password</label>
                    <input type="password" id="password" name="pin" class="form-control" placeholder="Enter your pin" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>

            <div class="text-center mt-3">
                <p>Don't have an account? <a href="signup.jsp" class="text-primary">Sign Up</a></p>
                <p><a href="forgot-password.jsp" class="text-primary">Forgot Password?</a></p>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
