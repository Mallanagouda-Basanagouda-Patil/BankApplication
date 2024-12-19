<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bank.dao.CustomerDAO" %>
<%@ page import="com.bank.dao.TransactionDAO" %>
<%@ page import="com.bank.dao.CustomerDAOimp" %>
<%@ page import="com.bank.dao.TransactionDAOimp" %>
<%@ page import="com.bank.dto.Customer" %>
<%@ page import="com.bank.dto.Transaction" %>

<% 
    // Fetch customer from session
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        // Redirect to login or error page if no customer in session
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Fetch transactions for the customer
    TransactionDAO tdao = new TransactionDAOimp();
    List<Transaction> transactions = tdao.getTransaction(customer.getAccNo());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<!-- Header Section -->
<header class="bg-primary text-white py-3">
    <div class="container d-flex justify-content-between align-items-center">
        <!-- Welcome Message -->
        <h4 class="mb-0">Welcome, <strong><%= customer != null ? customer.getName() : "User" %></strong></h4>
        
        <!-- Actions -->
        <div class="d-flex align-items-center">
            <% if (customer.getAccNo() == 1100110011) { %>
                <!-- Admin Dashboard Button -->
                <a href="AdminDashboard.jsp" class="btn btn-warning btn-sm me-2">Admin Dashboard</a>
            <% } %>
            
            <!-- Logout Button -->
            <form action="logout" method="post" class="mb-0">
                <input type="submit" name="logout" value="Logout" class="btn btn-danger btn-sm">
            </form>
        </div>
        
        <!-- Bank Name -->
        <h3 class="ms-3 mb-0">Magadha Bank</h3>
    </div>
</header>



<!-- Navigation -->
<nav class="bg-secondary text-white py-2">
    <div class="container d-flex justify-content-between">
        <a href="Resetpin.jsp" class="text-white text-decoration-none">Reset PIN</a>
        <a href="update.jsp" class="text-white text-decoration-none">Update Account</a> <!-- Update Account Link -->
        <a href="#" class="text-white text-decoration-none">Services</a>
        <p class="mb-0">Account: <%= customer != null ? customer.getAccNo() : "N/A" %></p>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-4">
    <!-- Options -->
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Check Balance</h5>
                    <a href="checkbalance.jsp" class="btn btn-primary">View Balance</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Deposit</h5>
                    <a href="deposit.jsp" class="btn btn-primary">Deposit Money</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Transfer</h5>
                    <a href="transfer.jsp" class="btn btn-primary">Transfer Funds</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Last Transactions -->
    <div class="mt-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Last 5 Transactions</h4>
            <a href="transactions.jsp" class="btn btn-primary">See All Transactions</a>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="table-primary">
                    <tr>
                        <th>Date</th>
                        <th>Description/Transfer To</th>
                        <th>Amount</th>
                        <th>Status/Type</th>
                    </tr>
                </thead>
                <tbody>
                    <% int count = 0; %>
                    <% for (Transaction transaction : transactions) { %>
                        <% if (count == 5) break; %>
                        <tr>
                            <td><%= transaction.getDate() %></td>
                            <td><%= transaction.getRec_acc() %></td>
                            <td>$<%= transaction.getAmount() %></td>
                            <td><%= transaction.getTranType() %></td>
                        </tr>
                        <% count++; %>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-primary text-white text-center py-3">
    <p class="mb-0">New Bank | 123 Bank Street, City | Call us: 123-456-7890 | &copy; 2024 New Bank</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
