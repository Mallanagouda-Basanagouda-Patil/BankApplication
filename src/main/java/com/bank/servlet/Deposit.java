package com.bank.servlet;
import java.io.IOException;
import java.util.Scanner;

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

@WebServlet("/deposit")
public class Deposit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession(false);
		long accno=Long.parseLong(req.getParameter("accountNo"));
		double amount=Double.parseDouble(req.getParameter("amount"));
		CustomerDAO cdao=new CustomerDAOimp();
		TransactionDAO tdao=new TransactionDAOimp();
		Customer c=(Customer)session.getAttribute("customer");
		c.setBalance(c.getBalance()+amount);
		boolean res=cdao.updateCustomer(c);
		if(res)
		{
			if(accno==c.getAccNo())
			{
				Transaction t=new Transaction();
				t.setTranId(TransactionId.generateTransactionId());
				t.setUserAcc(c.getAccNo());
				t.setRec_acc(c.getAccNo());
				t.setTranType("CREDITED");
				t.setAmount(amount);
				t.setBalance(c.getBalance());
				boolean res1=tdao.insertTransaction(t);
				if(res1)
				{
					session.setAttribute("amount","Amount of Rs."+amount+" Creadited Sucessfully:"+"  "+"Your update balance is Rs."+c.getBalance()+"");
					RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
					rd.forward(req, resp);
				}
				else
				{
					session.setAttribute("failure","Failed To Deposit! Try Again Later");
					RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
					rd.forward(req, resp);
				}
			}
			else
			{
				session.setAttribute("failure","Failed To Deposit! invalid account number");
				RequestDispatcher rd=req.getRequestDispatcher("deposit.jsp");
				rd.forward(req, resp);
			}
		}
	}

}
