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
public class WarehouseInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	private String warehouseId;
	private String warehouseName;
	private String warehouseAddress;
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "empId")
	private EmpInfo emp;//--员工（仓库管理员）
	public String getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}
	public String getWarehouseName() {
		return warehouseName;
	}
	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}
	public String getWarehouseAddress() {
		return warehouseAddress;
	}
	public void setWarehouseAddress(String warehouseAddress) {
		this.warehouseAddress = warehouseAddress;
	}
	public EmpInfo getEmp() {
		return emp;
	}
	public void setEmp(EmpInfo emp) {
		this.emp = emp;
	}
	public WarehouseInfo() {
	}
	public WarehouseInfo(String warehouseId, String warehouseName,
			String warehouseAddress, EmpInfo emp) {
		this.warehouseId = warehouseId;
		this.warehouseName = warehouseName;
		this.warehouseAddress = warehouseAddress;
		this.emp = emp;
	}
}
