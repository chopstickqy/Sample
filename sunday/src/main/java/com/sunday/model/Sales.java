package com.sunday.model;

import java.util.Date;

public class Sales {
	private String eId;
	private String eCommodity;
	private String eCustomer;
	private Integer eNumber;
	private Double ePrice;
	private Date eTime;
	private String eUser;
	private String eState;
	private String eCommodityid;
	private Double eProfit;
	
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId == null ? null : eId.trim();
	}
	public String geteCommodity() {
		return eCommodity;
	}
	public void seteCommodity(String eCommodity) {
		this.eCommodity = eCommodity == null ? null : eCommodity.trim();
	}
	public String geteCustomer() {
		return eCustomer;
	}
	public void seteCustomer(String eCustomer) {
		this.eCustomer = eCustomer == null ? null : eCustomer.trim();
	}
	public Integer geteNumber() {
		return eNumber;
	}
	public void seteNumber(Integer eNumber) {
		this.eNumber = eNumber;
	}
	public Double getePrice() {
		return ePrice;
	}
	public void setePrice(Double ePrice) {
		this.ePrice = ePrice;
	}
	public Date geteTime() {
		return eTime;
	}
	public void seteTime(Date eTime) {
		this.eTime = eTime;
	}
	public String geteUser() {
		return eUser;
	}
	public void seteUser(String eUser) {
		this.eUser = eUser == null ? null : eUser.trim();
	}
	public String geteState() {
		return eState;
	}
	public void seteState(String eState) {
		this.eState = eState == null ? null : eState.trim();
	}
	public String geteCommodityid() {
		return eCommodityid;
	}
	public void seteCommodityid(String eCommodityid) {
		this.eCommodityid = eCommodityid == null ? null : eCommodityid.trim();
	}
	public Double geteProfit(){
		return eProfit;
	}
	public void seteProfit(Double eProfit){
		this.eProfit = eProfit;
	}
	
}
