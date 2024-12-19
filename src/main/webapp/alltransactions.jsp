<%@page import="com.bank.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.TransactionDAOimp"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dto.Transaction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        // Redirect to login or error page if no customer in session
        response.sendRedirect("login.jsp");
        return;
    }

    TransactionDAO tdao = new TransactionDAOimp();
    List<Transaction> transactions = tdao.getTransaction();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h1 class="card-title text-center">Transaction History</h1>
            </div>
            <div class="card-body">
                <%-- Transaction History Table --%>
                <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Transaction ID</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Recipient/Source</th>
                            <th>Balance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Transaction transaction : transactions) { %>
                            <tr>
                                <td><%= transaction.getTranId() %></td>
                                <td><%= transaction.getTranType() %></td>
                                <td>$<%= transaction.getAmount() %></td>
                                <td><%= transaction.getDate() %></td>
                                <td><%= transaction.getRec_acc() %></td>
                                <td>$<%= transaction.getBalance() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
                <% if (transactions.isEmpty()) { %>
                    <p class="text-center text-muted">No transactions found.</p>
                <% } %>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="AdminDashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
