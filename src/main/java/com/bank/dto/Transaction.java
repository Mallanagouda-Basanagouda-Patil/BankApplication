package com.bank.dto;

public class Transaction
{
	private long tran_Id;
	private long user_acc;
	private long rec_acc;
	private String tran_date;
	private String tran_type;
	private double amount;
	private double balance;
	public Transaction(long tran_Id, long user_acc, long rec_acc, String tran_date, String tran_type, double amount,
			double balance) {
		super();
		this.tran_Id = tran_Id;
		this.user_acc = user_acc;
		this.rec_acc = rec_acc;
		this.tran_date = tran_date;
		this.tran_type = tran_type;
		this.amount = amount;
		this.balance = balance;
	}
	
	public Transaction() {
		super();
	}
	
	
	public long getTranId() {
		return tran_Id;
	}
	public void setTranId(long tran_Id) {
		this.tran_Id = tran_Id;
	}
	public long getUserAcc() {
		return user_acc;
	}
	public void setUserAcc(long user_acc) {
		this.user_acc = user_acc;
	}
	public long getRec_acc() {
		return rec_acc;
	}
	public void setRec_acc(long rec_acc) {
		this.rec_acc = rec_acc;
	}
	public String getDate() {
		return tran_date;
	}
	public void setDate(String tran_date) {
		this.tran_date = tran_date;
	}
	public String getTranType() {
		return tran_type;
	}
	public void setTranType(String tran_type) {
		this.tran_type = tran_type;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "Transaction [tran_Id=" + tran_Id + ", user_acc=" + user_acc + ", rec_acc=" + rec_acc + ", tran_date="
				+ tran_date + ", tran_type=" + tran_type + ", amount=" + amount + ", balance=" + balance + "]";
	}
	
	
}
