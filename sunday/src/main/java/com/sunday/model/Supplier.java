package com.sunday.model;

import java.util.Date;

public class Supplier {
	private String sId;
	private String sName;
	private String sContact;
	private String sPhone;
	private String sAddress;
	private String sDescription;
	private Date sTime;
	
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId == null ? null : sId.trim();
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName == null ? null : sName.trim();
	}
	public String getsContact() {
		return sContact;
	}
	public void setsContact(String sContact) {
		this.sContact = sContact == null ? null : sContact.trim();
	}
	public String getsPhone() {
		return sPhone;
	}
	public void setsPhone(String sPhone) {
		this.sPhone = sPhone == null ? null : sPhone.trim();
	}
	public String getsAddress() {
		return sAddress;
	}
	public void setsAddress(String sAddress) {
		this.sAddress = sAddress == null ? null : sAddress.trim();
	}
	public String getsDescription() {
		return sDescription;
	}
	public void setsDescription(String sDescription) {
		this.sDescription = sDescription == null ? null : sDescription.trim();
	}
	public Date getsTime() {
		return sTime;
	}
	public void setsTime(Date sTime) {
		this.sTime = sTime;
	}
	
	
}
