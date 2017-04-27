package com.cloth.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 颜色表
 * @author Administrator
 *
 */
@Entity
@Table(name="ColorInfo")
public class ColorInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=36)
	private String colorId;//颜色编号
	private String colorNo;//颜色编号
	private String colorName;//颜色名称
	private String colorRemark;//备注
	public String getColorId() {
		return colorId;
	}
	public void setColorId(String colorId) {
		this.colorId = colorId;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public String getColorRemark() {
		return colorRemark;
	}
	public void setColorRemark(String colorRemark) {
		this.colorRemark = colorRemark;
	}
	public String getColorNo() {
		return colorNo;
	}
	public void setColorNo(String colorNo) {
		this.colorNo = colorNo;
	}
	public ColorInfo() {
	}
	public ColorInfo(String colorId, String colorNo, String colorName,
			String colorRemark) {
		this.colorId = colorId;
		this.colorNo = colorNo;
		this.colorName = colorName;
		this.colorRemark = colorRemark;
	}
}
