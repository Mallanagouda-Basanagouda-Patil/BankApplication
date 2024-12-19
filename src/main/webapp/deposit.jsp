<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="card shadow p-4" style="width: 400px;">
        <h1 class="text-center text-primary mb-4">Deposit Funds</h1>

        <%-- Display messages if available --%>
        <% String success = (String) session.getAttribute("amount"); %>
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

        <form action="deposit" method="post">
            <!-- Account Number Input -->
            <div class="mb-3">
                <label for="accountNo" class="form-label">Account Number</label>
                <input type="text" id="accountNo" name="accountNo" class="form-control" required placeholder="Enter your account number">
            </div>
            <!-- Amount Input -->
            <div class="mb-3">
                <label for="amount" class="form-label">Amount</label>
                <input type="number" id="amount" name="amount" class="form-control" required placeholder="Enter the deposit amount">
            </div>
            <!-- Description Input -->
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <input type="text" id="description" name="description" class="form-control" placeholder="Enter description (optional)">
            </div>
            <!-- Buttons -->
            <button type="submit" class="btn btn-primary w-100 mb-2">Deposit</button>
            <a href="Dashboard.jsp" class="btn btn-secondary w-100">Cancel</a>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
