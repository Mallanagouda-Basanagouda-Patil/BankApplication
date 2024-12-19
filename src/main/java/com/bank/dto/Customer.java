package com.bank.dto;

public class Customer 
{
	private long acc_No;
	private String name;
	private long phone;
	private String mail;
	private double balance;
	private int pin;
	public Customer(long acc_No, String name, long phone, String mail, double balance, int pin) {
		super();
		this.acc_No = acc_No;
		this.name = name;
		this.phone = phone;
		this.mail = mail;
		this.balance = balance;
		this.pin = pin;
	}
	public Customer() {
		super();
	}
	public long getAccNo() {
		return acc_No;
	}
	public void setAccNo(long accNo) {
		this.acc_No = accNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	@Override
	public String toString() {
		return "Customer [accNo=" + acc_No + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", balance=" + balance
				+ "]";
	}
	
	
}
