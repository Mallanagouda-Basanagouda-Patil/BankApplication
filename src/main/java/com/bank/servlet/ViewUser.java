package com.bank.servlet;

import java.io.IOException;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOimp;
import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/viewUser")
public class ViewUser extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
		{
			 String accNoStr = req.getParameter("accNo");
		        
		        if (accNoStr != null) {
		            try {
		                long accNo = Long.parseLong(accNoStr);
		                
		                // Get customer details from the database
		                CustomerDAO customerDAO = new CustomerDAOimp();
		                Customer customer = customerDAO.getCustomer(accNo);
		                
		                // If customer is found, forward data to JSP
		                if (customer != null) {
		                    req.setAttribute("customer", customer);
		                    RequestDispatcher dispatcher = req.getRequestDispatcher("viewUser.jsp");
		                    dispatcher.forward(req, resp);
		                } else {
		                    // Handle case where customer is not found
		                    req.setAttribute("error", "Customer not found.");
		                    req.getRequestDispatcher("error.jsp").forward(req, resp);
		                }
		                
		            } catch (NumberFormatException e) {
		                // Handle invalid account number format
		                req.setAttribute("error", "Invalid account number.");
		                req.getRequestDispatcher("error.jsp").forward(req, resp);
		            }
		        } else {
		            // Handle case where no account number is provided
		            req.setAttribute("error", "Account number is missing.");
		            req.getRequestDispatcher("error.jsp").forward(req, resp);
		        }
		}
		
}
