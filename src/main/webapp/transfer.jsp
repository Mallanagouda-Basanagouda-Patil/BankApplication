<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Amount</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .transfer-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 1rem;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .form-group input:focus {
            border-color: #004080;
            outline: none;
        }

        .btn-transfer {
            background-color: #004080;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .btn-transfer:hover {
            background-color: #003366;
        }

        .btn-cancel {
            margin-top: 10px;
            background-color: #ccc;
            color: #333;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .btn-cancel:hover {
            background-color: #aaa;
        }
    </style>
</head>
<body>
    <div class="transfer-container">
        <h1 class="text-center text-primary mb-4">Transfer Amount</h1>
        
        <%-- Display success or error messages --%>
        <% String success = (String) request.getAttribute("transfer"); %>
        <% if (success != null) { %>
            <div class="alert alert-success" role="alert">
                <%= success %>
            </div>
        <% session.removeAttribute("success"); } %>
        <% String failure = (String) request.getAttribute("failure"); %>
        <% if (failure != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= failure %>
            </div>
        <% session.removeAttribute("failure"); } %>

        <form action="transferAmount" method="post">
            <div class="form-group">
                <label for="recipient">Recipient Account Number</label>
                <input type="text" id="recipient" name="recipient" class="form-control" required placeholder="Enter recipient's account number">
            </div>
            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="number" id="amount" name="amount" class="form-control" required placeholder="Enter amount to transfer">
            </div>
            <div class="form-group">
                <label for="pin">Pin</label>
                <input type="password" id="pin" name="pin" class="form-control" required placeholder="Enter Pin number">
            </div>
            <button type="submit" class="btn-transfer mt-3">Transfer</button>
            <a href="Dashboard.jsp"><button type="button" class="btn-cancel mt-3">Cancel</button></a>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
