<%@page import="com.bank.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Customer c=(Customer)session.getAttribute("customer"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Design with Bootstrap</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center text-primary mb-4">User Information</h2>
                <h2 class="text-center text-primary mb-4">Update User Information</h2>
			             <%-- Display messages if available --%>
			            <% String success = (String) request.getAttribute("success"); %>
			            <% if (success != null) { %>
			                <p class="text-success text-center"><%= success %></p>
			            <% } %>
			            <% String failure = (String) request.getAttribute("failure"); %>
			            <% if (failure != null) { %>
			                <p class="text-danger text-center"><%= failure %></p>
			            <% } %>
                <form action="update" method="post">
                    <!-- Name Field -->
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%=c.getName() %>" placeholder="Enter your name" required>
                    </div>

                    <!-- Phone Field -->
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="phone" name="phone" value="<%=c.getPhone() %>" placeholder="Enter your phone number" required>
                    </div>

                    <!-- Email Field -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="mail" value="<%=c.getMail() %>" placeholder="Enter your email" required>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">Submit</button>
                         <a href="Dashboard.jsp" class="btn btn-primary btn-back">Back to Dashboard</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
