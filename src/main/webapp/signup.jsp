<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Signup</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="max-width: 500px; width: 100%; border-radius: 12px;">
        <div class="card-body">
            <h2 class="text-center text-success mb-4">Create Your Bank Account</h2>

            <%-- Display messages if available --%>
            <% String success = (String) session.getAttribute("success"); %>
            <% if (success != null) { %>
                <p class="text-success text-center"><%= success %></p>
            <% } %>
            <% String failure = (String) session.getAttribute("failure"); %>
            <% if (failure != null) { %>
                <p class="text-danger text-center"><%= failure %></p>
            <% } %>

            <form action="signup" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label fw-bold">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label fw-bold">Phone:</label>
                    <input type="tel" id="phone" name="phone" class="form-control" placeholder="Enter your phone number" pattern="[0-9]{10}" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label fw-bold">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label fw-bold">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                </div>

                <div class="mb-3">
                    <label for="confirm-password" class="form-label fw-bold">Confirm Password:</label>
                    <input type="password" id="confirm-password" name="confirmPassword" class="form-control" placeholder="Confirm your password" required>
                </div>

                <button type="submit" class="btn btn-success w-100">Sign Up</button>
            </form>

            <div class="text-center mt-3">
                <p>Already have an account? <a href="login.jsp" class="text-success">Login here</a></p>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
