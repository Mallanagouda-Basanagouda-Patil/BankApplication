package com.bank.servlet;

import java.io.IOException;

import com.bank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/checkbalance")
public class checkBalance extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int pin=Integer.parseInt(req.getParameter("pin"));
		HttpSession session=req.getSession(false);
		Customer c=(Customer)session.getAttribute("customer");
		if(c!=null&&pin==c.getPin())
		{
			session.setAttribute("balance", "your balance:"+c.getBalance()+"");
			RequestDispatcher rd=req.getRequestDispatcher("checkbalance.jsp");
			rd.forward(req, resp);
		}
		else 
		{
			session.setAttribute("failure", "invalid Pin");
			RequestDispatcher rd=req.getRequestDispatcher("checkbalance.jsp");
			rd.forward(req, resp);
		}
	}
}
