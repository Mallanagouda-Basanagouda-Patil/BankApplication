package com.bank.servlet;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOimp;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOimp;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;
import com.bank.dto.TransactionId;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class deleteUser extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // Fetch account number from request parameter
	    String accNo = req.getParameter("accNo");
	    String del = req.getParameter("delete");

	    // Check if accNo is null or empty
	    if (accNo == null || accNo.isEmpty()) {
	        req.setAttribute("failed", "Account number is missing.");
	        RequestDispatcher rd = req.getRequestDispatcher("users.jsp");
	        rd.forward(req, resp);
	        return; // Exit early if accNo is missing
	    }

	    // Check if the delete action is triggered
	    if (del != null && del.equals("Delete")) {
	        try {
	            long accnum = Long.parseLong(accNo); // Parse accNo to long

	            HttpSession session = req.getSession(false);
	            CustomerDAO cdao = new CustomerDAOimp();
	            TransactionDAO tdao = new TransactionDAOimp();

	            // Retrieve the customer from session
	            Customer c = (Customer) session.getAttribute("customer");
	            c=cdao.getCustomer(c.getAccNo());
	            Customer c1 = cdao.getCustomer(accnum);

	            // Check if the customer exists
	            if (c1 == null) {
	                req.setAttribute("failed", "Customer not found.");
	                RequestDispatcher rd = req.getRequestDispatcher("users.jsp");
	                rd.forward(req, resp);
	                return;
	            }

	            // Proceed with deleting the customer
	            boolean res = cdao.deleteCustomer(c1);

	            if (c.getAccNo() != c1.getAccNo()) {
	                double amount = c1.getBalance();
	                c.setBalance(c.getBalance() + c1.getBalance());
	                boolean res1 = cdao.updateCustomer(c);

	                if (res1) {
	                    Transaction t1 = new Transaction();
	                    t1.setTranId(TransactionId.generateTransactionId());
	                    t1.setUserAcc(c.getAccNo());
	                    t1.setRec_acc(c1.getAccNo());
	                    t1.setAmount(amount);
	                    t1.setTranType("CREDITED");
	                    t1.setBalance(c.getBalance());

	                    boolean res2 = tdao.insertTransaction(t1);

	                    if (res && res1 && res2) {
	                        req.setAttribute("delete", "Account deleted successfully");
	                    } else {
	                        req.setAttribute("failed", "Failed to process transaction after deletion.");
	                    }
	                } else {
	                    req.setAttribute("failed", "Failed to update user balance.");
	                }
	            }

	            // Forward the request to the users.jsp page
	            RequestDispatcher rd = req.getRequestDispatcher("users.jsp");
	            rd.forward(req, resp);

	        } catch (NumberFormatException e) {
	            req.setAttribute("failed", "Invalid account number format.");
	            RequestDispatcher rd = req.getRequestDispatcher("users.jsp");
	            rd.forward(req, resp);
	        }
	    }
	}

}
