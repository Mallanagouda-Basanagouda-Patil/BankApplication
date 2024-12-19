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
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class updateAccount extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		long phone=Long.parseLong(req.getParameter("phone"));
		String mail=req.getParameter("mail");
		HttpSession session=req.getSession(false);
		
		CustomerDAO cdao=new CustomerDAOimp();
		Customer c=(Customer)session.getAttribute("customer");
		if(c!=null)
		{
			c.setName(name);
			c.setPhone(phone);
			c.setMail(mail);
			boolean res=cdao.updateCustomer(c);
			if(res)
			{
				req.setAttribute("success", "Account Updated Successful");
				RequestDispatcher rd=req.getRequestDispatcher("update.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("failure", "Account Updated failed");
				RequestDispatcher rd=req.getRequestDispatcher("update.jsp");
				rd.forward(req, resp);
			}
		}
	}
}
