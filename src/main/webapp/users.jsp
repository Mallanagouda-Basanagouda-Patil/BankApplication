<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bank.dao.CustomerDAO" %>
<%@ page import="com.bank.dao.CustomerDAOimp" %>
<%@ page import="com.bank.dto.Customer" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Fetch list of all users from the database
    CustomerDAO cdao = new CustomerDAOimp();
    List<Customer> customers = cdao.getCustomer();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Users - Bank Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Header Section -->
<header class="bg-primary text-white py-3">
    <div class="container">
        <h4>All Bank Users</h4>
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
    <!-- Display messages if available -->
    <%
        HttpSession s = request.getSession(false);
        String deleteMessage = (String) session.getAttribute("delete");
        String failureMessage = (String) session.getAttribute("failure");

        if (deleteMessage != null) {
            session.removeAttribute("delete");
    %>
        <p class="text-success text-center"><%= deleteMessage %></p>
    <%
        }

        if (failureMessage != null) {
            session.removeAttribute("failure");
    %>
        <p class="text-danger text-center"><%= failureMessage %></p>
    <%
        }
    %>

    <h5 class="mb-4">User List</h5>
    <!-- Table to display all users -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-primary">
                <tr>
                    <th>Account Number</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Balance</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    int userCount = 0; // Counter for total users
                    for (Customer c1 : customers) {
                       
                %>
                    <tr>
                        <td><%= c1.getAccNo() %></td>
                        <td><%= c1.getName() %></td>
                        <td><%= c1.getMail() %></td>
                        <td><%= c1.getPhone() %></td>
                        <td><%= c1.getBalance() %></td>
                        <td>
                            <!-- Actions (View, Edit, Delete) -->
                            <a href="viewUser.jsp?accNo=<%= c1.getAccNo() %>" class="btn btn-info btn-sm">View</a>
                            <a href="deleteAccount.jsp?accNo=<%= c1.getAccNo() %>" class="btn btn-danger btn-sm ms-3">Delete</a>
                        </td>
                    </tr>
                <% 
                userCount++;
                    }
                    // Store total user count in the session if required elsewhere
                    session.setAttribute("totalUsers", userCount);
                %>
            </tbody>
        </table>
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
