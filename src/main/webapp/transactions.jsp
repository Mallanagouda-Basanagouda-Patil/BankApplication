<%@page import="com.bank.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.bank.dao.TransactionDAOimp"%>
<%@page import="com.bank.dao.TransactionDAO"%>
<%@page import="com.bank.dto.Transaction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        // Redirect to login page if no customer in session
        response.sendRedirect("login.jsp");
        return;
    }
    
    TransactionDAO tdao = new TransactionDAOimp();
    List<Transaction> transactions = tdao.getTransaction(customer.getAccNo());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f9;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .transaction-container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 900px;
        }
        .table th {
            background-color: #004080;
            color: #fff;
        }
        .btn-back {
            background-color: #004080;
            color: #fff;
            text-decoration: none;
        }
        .btn-back:hover {
            background-color: #003366;
        }
    </style>
</head>
<body>
    <div class="transaction-container">
        <h1 class="text-center text-primary">Transaction History</h1>
        
        <% if (transactions == null || transactions.isEmpty()) { %>
            <div class="alert alert-warning text-center" role="alert">
                No transactions found for your account.
            </div>
        <% } else { %>
            <div class="table-responsive">
                <table class="table table-bordered table-striped mt-4">
                    <thead class="text-center">
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
                                <td class="text-center"><%= transaction.getTranId() %></td>
                                <td class="text-center"><%= transaction.getTranType() %></td>
                                <td class="text-end">$<%= transaction.getAmount() %></td>
                                <td class="text-center"><%= transaction.getDate() %></td>
                                <td class="text-center"><%= transaction.getRec_acc() %></td>
                                <td class="text-end">$<%= transaction.getBalance() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
        
        <div class="text-end mt-3">
            <a href="Dashboard.jsp" class="btn btn-primary btn-back">Back to Dashboard</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
