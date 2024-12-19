package com.bank.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.bank.dao.CustomerDAO;
import com.bank.dao.CustomerDAOimp;
import com.bank.dao.TransactionDAO;
import com.bank.dao.TransactionDAOimp;
import com.bank.dto.Customer;
import com.bank.dto.Transaction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class login extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		long accno=Long.parseLong(req.getParameter("AccountNo"));
		int pin=Integer.parseInt(req.getParameter("pin"));
		
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOimp();
		HttpSession session=req.getSession();
		
		c=cdao.getCustomer(accno, pin);
		TransactionDAO tdao= new TransactionDAOimp();
		List<Transaction> passbook=tdao.getTransaction(accno);
		Iterator<Transaction> it=passbook.iterator();
		while(it.hasNext())
		{
			Transaction t=it.next();
			session.setAttribute("transaction", t);
		
			
		}
		
		
		if(c!=null)
		{
			if(c.getAccNo()==1100110013)
			{
				session.setAttribute("customer", c);
				RequestDispatcher rd=req.getRequestDispatcher("AdminDashboard.jsp");
				rd.forward(req, resp);
			}
			else
			{
				session.setAttribute("customer", c);
				RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				rd.forward(req, resp);
			}
		}
		else
        {
            req.setAttribute("failure", "Invalid Account Number or PIN.");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
        }
	}
}
