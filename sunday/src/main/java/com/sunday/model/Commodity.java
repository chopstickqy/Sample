package com.sunday.model;

public class Commodity {
	private String mId;
	private String mName;
	private String mType;
	private String mColor;
	private String mMaterial;
	private String mSize;
	private Double mInPrice;
	private Double mOutPrice;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId == null ? null : mId.trim();
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName == null ? null : mName.trim();
	}
	public String getmType() {
		return mType;
	}
	public void setmType(String mType) {
		this.mType = mType == null ? null : mType.trim();
	}
	public String getmColor() {
		return mColor;
	}
	public void setmColor(String mColor) {
		this.mColor = mColor == null ? null : mColor.trim();
	}
	public String getmMaterial() {
		return mMaterial;
	}
	public void setmMaterial(String mMaterial) {
		this.mMaterial = mMaterial == null ? null : mMaterial.trim();
	}
	public String getmSize() {
		return mSize;
	}
	public void setmSize(String mSize) {
		this.mSize = mSize == null ? null : mSize.trim();
	}
	public Double getmInPrice() {
		return mInPrice;
	}
	public void setmInPrice(Double mInPrice) {
		this.mInPrice = mInPrice;
	}
	public Double getmOutPrice() {
		return mOutPrice;
	}
	public void setmOutPrice(Double mOutPrice) {
		this.mOutPrice = mOutPrice;
	}
	
	
}
