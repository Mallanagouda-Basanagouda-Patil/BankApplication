package com.bank.dao;

import java.util.List;

import com.bank.dto.Transaction;

public interface TransactionDAO 
{
	public boolean insertTransaction(Transaction t);
	public List getTransaction(long accno);
	public List getTransaction();
}
