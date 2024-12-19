<%@ page import="java.util.List"%>
<%@ page import="com.bank.dao.CustomerDAO"%>
<%@ page import="com.bank.dao.CustomerDAOimp"%>
<%@ page import="com.bank.dto.Customer" %>
<%@ page import="com.bank.dao.TransactionDAO"%>
<%@ page import="com.bank.dao.TransactionDAOimp"%>
<%@ page import="com.bank.dto.Transaction" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>

<%
    // Get the account number from the request parameter
    String accNo = request.getParameter("accNo");
    String errorMessage = null;
    Customer c = null;
    List<Transaction> t = null;

    if (accNo != null && !accNo.isEmpty()) {
        try {
            long accnum = Long.parseLong(accNo);

            // Fetch user details based on accNo
            CustomerDAO cdao = new CustomerDAOimp();
            c = cdao.getCustomer(accnum);

            if (c == null) {
                errorMessage = "User not found.";
            } else {
                // Fetch the transaction history for the user
                TransactionDAO tdao = new TransactionDAOimp();
                t = tdao.getTransaction(accnum);
            }
        } catch (NumberFormatException e) {
            errorMessage = "Invalid account number format.";
        }
    } else {
        errorMessage = "Account number is missing.";
    }

    request.setAttribute("customer", c);
    request.setAttribute("transactions", t);
    request.setAttribute("error", errorMessage);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View User</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Header Section -->
<header class="bg-primary text-white py-3">
    <div class="container">
        <h4>View User Details</h4>
    </div>
</header>

<!-- Error Message -->
<% if (errorMessage != null) { %>
    <div class="container mt-4">
        <div class="alert alert-danger">
            <%= errorMessage %>
        </div>
    </div>
<% } %>

<!-- User Details Table -->
<% Customer customer = (Customer) request.getAttribute("customer"); %>
<% if (customer != null) { %>
    <div class="container my-4">
        <h5>User Information</h5>
        <table class="table table-bordered table-striped">
            <tr>
                <th>Account Number</th>
                <td><%= customer.getAccNo() %></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><%= customer.getName() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= customer.getMail() %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= customer.getPhone() %></td>
            </tr>
            <tr>
                <th>Balance</th>
                <td>$<%= customer.getBalance() %></td>
            </tr>
        </table>
        
        <!-- Transaction History Section -->
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title text-center">Transaction History</h5>
            </div>
            <div class="card-body">
                <!-- Transaction History Table -->
                <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Transaction ID</th>
                            <th>User AccNo</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Recipient/Source</th>
                            <th>Balance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions"); %>
                        <% for (Transaction transaction : transactions) { %>
                            <tr>
                                <td><%= transaction.getTranId() %></td>
                                <td><%= transaction.getUserAcc() %></td>
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
            <a href="users.jsp" class="btn btn-primary">Back</a>
        </div>
    </div>
<% } %>

<!-- Footer -->
<footer class="bg-primary text-white text-center py-3">
    <p class="mb-0">New Bank | 123 Bank Street, City | Call us: 123-456-7890 | &copy; 2024 New Bank</p>
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
