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
@WebServlet("/resetpin")
public class Resetpin extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession(false);
		String mail=req.getParameter("email");
		long phone=Long.parseLong(req.getParameter("phone"));
		int new_pass=Integer.parseInt(req.getParameter("new_password"));
		int con_pass=Integer.parseInt(req.getParameter("confirm_password"));
		
		
		
		
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOimp();
		c=(Customer)session.getAttribute("customer");
		if(c!=null&&mail.equals(c.getMail())&&phone==c.getPhone()&&new_pass==con_pass)
		{
			c.setPin(new_pass);
			boolean res1=cdao.updateCustomer(c);
			if(res1)
			{
				session.setAttribute("success", "Pin updated Successful");
				RequestDispatcher rd=req.getRequestDispatcher("Resetpin.jsp");
				rd.forward(req, resp);
			}
			else
			{
				session.setAttribute("failure", "Pin update Failed");
				RequestDispatcher rd=req.getRequestDispatcher("Resetpin.jsp");
				rd.forward(req, resp);
			}
		}
	}
}
