package com.sunday.model;

import java.util.Date;

public class User {
	private String uAccount;
	private String uName;
	private String uSex;
	private String uPhone;
	private String uType;
	private Date uTime;
	private String uPassword;
	
	public String getuAccount() {
		return uAccount;
	}
	public void setuAccount(String uAccount) {
		this.uAccount = uAccount == null ? null : uAccount.trim();
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName == null ? null : uName.trim();
	}
	public String getuSex() {
		return uSex;
	}
	public void setuSex(String uSex) {
		this.uSex = uSex == null ? null : uSex.trim();
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone == null ? null : uPhone.trim();
	}
	public String getuType() {
		return uType;
	}
	public void setuType(String uType) {
		this.uType = uType == null ? null : uType.trim();
	}
	public Date getuTime() {
		return uTime;
	}
	public void setuTime(Date uTime) {
		this.uTime = uTime;
	}
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword == null ? null : uPassword.trim();
	}
	
	
}
