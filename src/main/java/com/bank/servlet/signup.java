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
@WebServlet("/signup")
public class signup extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession();
		String name=req.getParameter("name");
		long phone=Long.parseLong(req.getParameter("phone"));
		String mail=req.getParameter("email");
		int password=Integer.parseInt(req.getParameter("password"));
		int conformpassword=Integer.parseInt(req.getParameter("confirmPassword"));
		
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOimp();
		if(conformpassword==password)
		{
			c.setName(name);
			c.setPhone(phone);
			c.setMail(mail);
			c.setPin(password);
			
			boolean res1=cdao.insertCustomer(c);
			if(res1)
			{
				c=cdao.getCustomer(phone, mail);
				//out.println("<h1>data added successfully your Student Id is:"+s.getId()+"</h1>");
				session.setAttribute("success", "Account Created successful,Your Account No:"+c.getAccNo()+"");
				RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
			} else {
				//out.println("<h1>failed to add</h1>");
				session.setAttribute("failure", "signup failed");
				RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
			}
		}
	}
}
