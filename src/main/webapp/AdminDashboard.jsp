<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dao.TransactionDAOimp"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dto.Transaction"%>
<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Fetch admin or customer details from session
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }

    // Fetch transaction data
    TransactionDAO tdao = new TransactionDAOimp();
    List<Transaction> transactions = tdao.getTransaction();
    
    //total users
     Integer totalUsers = (Integer) session.getAttribute("totalUsers");
    if (totalUsers == null) totalUsers = 0;%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="bg-primary text-white p-4" style="width: 300px; min-height: 100vh;">
            <h2 class="text-center mb-4">Admin Dashboard</h2>
            <a href="users.jsp" class="btn btn-primary w-100 mb-2 text-start">Manage Users</a>
            <a href="alltransactions.jsp" class="btn btn-primary w-100 mb-2 text-start">View Transactions</a>
            <a href="Dashboard.jsp" class="btn btn-primary w-100 mb-2 text-start">Your Account</a>
             <form action="logout" method="post">
                <input type="submit" name="logout" value="Logout" class="btn btn-outline-light btn-sm ms-3">
            </form>        
            </div>

        <!-- Main Content -->
        <div class="container-fluid p-4">
            <!-- Header -->
            <header class="d-flex justify-content-between align-items-center mb-4 bg-light p-3 rounded shadow-sm">
                <h1 class="text-primary">Admin Panel</h1>
                <h1 class="text-danger text-center">SRS Bank</h1>    
                <span class="fs-5">Welcome Admin, <%= customer.getName() %></span>
            </header>
            <!-- Transactions Table -->
            <div class="card shadow-sm mt-4">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">Recent Transactions</h3>
                </div>
                <div class="card-body">
                    <table class="table table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Date</th>
                                <th>Sender Account</th>
                                <th>Recipient Account</th>
                                <th>Description</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int count = 0; %>
                            <% for (Transaction transaction : transactions) { %>
                                <% if (count == 5) break; %>
                                <tr>
                                    <td><%= transaction.getDate() %></td>
                                    <td><%= transaction.getUserAcc() %></td>
                                    <td><%= transaction.getRec_acc() %></td>
                                    <td><%= transaction.getTranType() %></td>
                                    <td>$<%= transaction.getAmount() %></td>
                                    <td><%= transaction.getBalance() %></td>
                                </tr>
                                <% count++; %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center bg-primary text-white py-3 mt-4">
        &copy; 2024 Bank Name | All Rights Reserved
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
