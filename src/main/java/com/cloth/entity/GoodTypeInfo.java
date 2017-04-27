package com.cloth.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class GoodTypeInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=100)
	private String goodTypeId;
	private String goodTypeName;
	private String goodTypeRemark;
	
	public String getGoodTypeName() {
		return goodTypeName;
	}
	public void setGoodTypeName(String goodTypeName) {
		this.goodTypeName = goodTypeName;
	}
	public String getGoodTypeRemark() {
		return goodTypeRemark;
	}
	public void setGoodTypeRemark(String goodTypeRemark) {
		this.goodTypeRemark = goodTypeRemark;
	}
	public GoodTypeInfo() {
	}
	public String getGoodTypeId() {
		return goodTypeId;
	}
	public void setGoodTypeId(String goodTypeId) {
		this.goodTypeId = goodTypeId;
	}
	public GoodTypeInfo(String goodTypeId, String goodTypeName,
			String goodTypeRemark) {
		super();
		this.goodTypeId = goodTypeId;
		this.goodTypeName = goodTypeName;
		this.goodTypeRemark = goodTypeRemark;
	}
}
