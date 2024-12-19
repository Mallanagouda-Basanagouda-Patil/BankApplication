package com.bank.dto;

import java.util.Random;

public class TransactionId 
{
	public static long generateTransactionId()
	{
		Random rd=new Random();
		int num=0;
		long ans=0;
		long val=rd.nextLong();
		if(val<0)
		{
			val=val*-1;
		}
		while(num<15)
		{
			long rem=val%10;
			ans=(ans*10)+rem;
			val=val/10;
			num+=1;
		}
		return ans;
	}
}