package com.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bank.connector.ConnectionFactory;
import com.bank.dto.Transaction;

public class TransactionDAOimp implements TransactionDAO 
{
	private Connection con=null;
	public TransactionDAOimp()
	{
		this.con=ConnectionFactory.requestConnection();
	}

	@Override
	public boolean insertTransaction(Transaction t) 
	{
		PreparedStatement ps=null;
		String query="INSERT INTO PASSBOOK(TRAN_ID,USER_ACC,REC_ACC,TRAN_DATE,TRAN_TYPE,AMOUNT,BALANCE)VALUES(?,?,?,sysdate(),?,?,?)";
		int res=0;
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setLong(1,t.getTranId());
			ps.setLong(2,t.getUserAcc());
			ps.setLong(3, t.getRec_acc());
			ps.setString(4,t.getTranType());
			ps.setDouble(5,t.getAmount());
			ps.setDouble(6,t.getBalance());
			res=ps.executeUpdate();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			try
			{
				con.commit();
				
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		else
		{
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public List getTransaction(long accno) {
		ArrayList<Transaction> passbook=new ArrayList<Transaction>();
		PreparedStatement ps=null;
		ResultSet rs= null;
		Transaction t=null;
		String query="SELECT * FROM PASSBOOK WHERE USER_ACC=? ORDER By TRAN_DATE DESC";
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, accno);
			rs=ps.executeQuery();
			while(rs.next())
			{
				t=new Transaction();
				t.setTranId(rs.getLong(1));
				t.setUserAcc(rs.getLong(2));
				t.setRec_acc(rs.getLong(3));
				t.setDate(rs.getString(4));
				t.setTranType(rs.getString(5));
				t.setAmount(rs.getDouble(6));
				t.setBalance(rs.getDouble(7));
				passbook.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return passbook;
	}

	@Override
	public List getTransaction() {
		ArrayList<Transaction> tran=new ArrayList<Transaction>();
		PreparedStatement ps=null;
		ResultSet rs= null;
		Transaction t=null;
		String query="SELECT * FROM PASSBOOK ORDER By TRAN_DATE DESC";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				t=new Transaction();
				t.setTranId(rs.getLong(1));
				t.setUserAcc(rs.getLong(2));
				t.setRec_acc(rs.getLong(3));
				t.setDate(rs.getString(4));
				t.setTranType(rs.getString(5));
				t.setAmount(rs.getDouble(6));
				t.setBalance(rs.getDouble(7));
				tran.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tran;
	}
	
}
