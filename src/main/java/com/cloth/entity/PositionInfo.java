package com.cloth.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;
@Entity
public class PositionInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=100)
	private String positionId;
	private String positionName;
	private String positionRemark;
	public PositionInfo() {
		
	}
	public PositionInfo(String positionId, String positionName,
			String positionRemark) {
		super();
		this.positionId = positionId;
		this.positionName = positionName;
		this.positionRemark = positionRemark;
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getPositionRemark() {
		return positionRemark;
	}
	public void setPositionRemark(String positionRemark) {
		this.positionRemark = positionRemark;
	}
	
	
}
