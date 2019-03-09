package com.sunday.model;

import java.util.Date;

public class Stock {
	private String tId;
	private String tName;
	private String tNumber;
	private Integer tQuantity;
	private Date tTime;
	private Integer tInQuantity;
	private String tState;
	private String tSupplier;
	private String tType;
	
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId == null ? null : tId.trim();
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName == null ? null : tName.trim();
	}
	public String gettNumber() {
		return tNumber;
	}
	public void settNumber(String tNumber) {
		this.tNumber = tNumber == null ? null : tNumber.trim();
	}
	public Integer gettQuantity() {
		return tQuantity;
	}
	public void settQuantity(Integer tQuantity) {
		this.tQuantity = tQuantity;
	}
	public Date gettTime() {
		return tTime;
	}
	public void settTime(Date tTime) {
		this.tTime = tTime;
	}
	public Integer gettInQuantity() {
		return tInQuantity;
	}
	public void settInQuantity(Integer tInQuantity) {
		this.tInQuantity = tInQuantity;
	}
	public String gettState() {
		return tState;
	}
	public void settState(String tState) {
		this.tState = tState == null ? null : tState.trim();
	}
	public String gettSupplier() {
		return tSupplier;
	}
	public void settSupplier(String tSupplier) {
		this.tSupplier = tSupplier == null ? null : tSupplier.trim();
	}
	public String gettType() {
		return tType;
	}
	public void settType(String tType) {
		this.tType = tType == null ? null : tType.trim();
	}
}
