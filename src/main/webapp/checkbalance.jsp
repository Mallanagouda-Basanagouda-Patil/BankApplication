<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Balance</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-lg p-4" style="width: 400px;">
        <h1 class="text-center text-primary mb-4">Check Balance</h1>
        
        <%-- Display messages if available --%>
        <% String success = (String) session.getAttribute("balance"); %>
        <% if (success != null) { %>
            <div class="alert alert-success" role="alert">
                <%= success %>
            </div>
        <% } %>
        <% String failure = (String) session.getAttribute("failure"); %>
        <% if (failure != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= failure %>
            </div>
        <% } %>

        <form action="checkbalance" method="post">
            <div class="mb-3">
                <label for="pin" class="form-label">Pin</label>
                <input type="password" class="form-control" id="pin" name="pin" required placeholder="Enter your pin number">
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Check Balance</button>
            </div>
            <div class="d-grid mt-2">
                <a href="Dashboard.jsp" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
