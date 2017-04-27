package com.cloth.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table
public class SizeInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	private String sizeId;
	private String sizeName;
	private String sizeRemark;
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "goodTypeId")
	private GoodTypeInfo goodType;//--商品类型
	
	public String getSizeId() {
		return sizeId;
	}
	public void setSizeId(String sizeId) {
		this.sizeId = sizeId;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public String getSizeRemark() {
		return sizeRemark;
	}
	public void setSizeRemark(String sizeRemark) {
		this.sizeRemark = sizeRemark;
	}
	public GoodTypeInfo getGoodType() {
		return goodType;
	}
	public void setGoodType(GoodTypeInfo goodType) {
		this.goodType = goodType;
	}
	public SizeInfo() {
	}
	public SizeInfo(String sizeId, String sizeName, String sizeRemark,
			GoodTypeInfo goodType) {
		this.sizeId = sizeId;
		this.sizeName = sizeName;
		this.sizeRemark = sizeRemark;
		this.goodType = goodType;
	}
}
