<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bank.dao.CustomerDAO" %>
<%@ page import="com.bank.dao.CustomerDAOimp" %>
<%@ page import="com.bank.dto.Customer" %>
<%@ page import="jakarta.servlet.RequestDispatcher" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Retrieve the account number from the request parameter
    String accNo = request.getParameter("accNo");
    CustomerDAO cdao = new CustomerDAOimp();
    Customer customer = null;

    // Fetch the customer details based on account number
    if (accNo != null && !accNo.isEmpty()) {
        long accnum = Long.parseLong(accNo);
        customer = cdao.getCustomer(accnum);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Header Section -->
<header class="bg-primary text-white py-3">
    <div class="container">
        <h4>Delete Account</h4>
    </div>
</header>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
    <div class="container-fluid">
        <a class="navbar-brand" href="AdminDashboard.jsp">Admin Dashboard</a>
        <a class="navbar-brand ms-auto" href="logout.jsp">Logout</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-4">
    <%-- Display account details if customer is found --%>
    <% if (customer != null) { %>
        <h5>Are you sure you want to delete the following account?</h5>
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

        <!-- Delete Confirmation Form -->
        <form action="delete" method="post">
            <input type="hidden" name="accNo" value="<%= customer.getAccNo() %>">
            <input type="submit" name="delete" value="Delete" class="btn btn-danger btn-lg">
        </form>
        <a href="users.jsp" class="btn btn-secondary btn-lg mt-3">Cancel</a>
    <% } else { %>
        <div class="alert alert-danger">
            <strong>Error!</strong> Customer not found.
        </div>
    <% } %>
</div>

<!-- Footer -->
<footer class="bg-primary text-white text-center py-3">
    <p class="mb-0">New Bank | 123 Bank Street, City | Call us: 123-456-7890 | &copy; 2024 New Bank</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
