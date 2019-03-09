package com.sunday.model;

import java.util.Date;

public class Customer {
	private String cId;
	private String cName;
	private String cContact;
	private String cPhone;
	private String cAddress;
	private String cDescription;
	private Date cTime;
	
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId == null ? null : cId.trim();
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName == null ? null : cName.trim();
	}
	public String getcContact() {
		return cContact;
	}
	public void setcContact(String cContact) {
		this.cContact = cContact == null ? null : cContact.trim();
	}
	public String getcPhone() {
		return cPhone;
	}
	public void setcPhone(String cPhone) {
		this.cPhone = cPhone == null ? null : cPhone.trim();
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress == null ? null : cAddress.trim();
	}
	public String getcDescription() {
		return cDescription;
	}
	public void setcDescription(String cDescription) {
		this.cDescription = cDescription == null ? null : cDescription.trim();
	}
	public Date getcTime() {
		return cTime;
	}
	public void setcTime(Date cTime) {
		this.cTime = cTime;
	}
	
}
