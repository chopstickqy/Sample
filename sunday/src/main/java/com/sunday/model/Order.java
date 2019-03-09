package com.sunday.model;

import java.util.Date;

public class Order {
	private String oId;
	private String oCommodity;
	private String oSupplier;
	private Integer oNumber;
	private Double oPrice;
	private Date oTime;
	private String oUser;
	private String oState;
	private String oCommodityid;
	
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId == null ? null : oId.trim();
	}
	public String getoCommodity() {
		return oCommodity;
	}
	public void setoCommodity(String oCommodity) {
		this.oCommodity = oCommodity == null ? null : oCommodity.trim();
	}
	public String getoSupplier() {
		return oSupplier;
	}
	public void setoSupplier(String oSupplier) {
		this.oSupplier = oSupplier == null ? null : oSupplier.trim();
	}
	public Integer getoNumber() {
		return oNumber;
	}
	public void setoNumber(Integer oNumber) {
		this.oNumber = oNumber;
	}
	public Double getoPrice() {
		return oPrice;
	}
	public void setoPrice(Double oPrice) {
		this.oPrice = oPrice;
	}
	public Date getoTime() {
		return oTime;
	}
	public void setoTime(Date oTime) {
		this.oTime = oTime;
	}
	public String getoUser() {
		return oUser;
	}
	public void setoUser(String oUser) {
		this.oUser = oUser == null ? null : oUser.trim();
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState == null ? null : oState.trim();
	}
	public String getoCommodityid() {
		return oCommodityid;
	}
	public void setoCommodityid(String oCommodityid) {
		this.oCommodityid = oCommodityid == null ? null : oCommodityid.trim();
	}
	
	
}
