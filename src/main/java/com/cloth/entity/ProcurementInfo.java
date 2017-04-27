package com.cloth.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="ProcurementInfo")
public class ProcurementInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	private String procurementId;
	private Date procurementTime;
	@ManyToOne(fetch = FetchType.EAGER,optional=false,cascade=CascadeType.REMOVE)
    @JoinColumn(name = "supplierId")
	private SupplierInfo supplier;// --供应商外键
	@ManyToOne(fetch = FetchType.EAGER,optional=false,cascade=CascadeType.REMOVE)
    @JoinColumn(name = "empId")
	private EmpInfo emp;//--采购人(员工)
	private String procuremenRemark;//--说明
	@OneToMany(cascade={CascadeType.ALL},fetch=FetchType.LAZY)
    private Set<GoodsInfo> goods;
	public String getProcurementId() {
		return procurementId;
	}
	public void setProcurementId(String procurementId) {
		this.procurementId = procurementId;
	}
	public Date getProcurementTime() {
		return procurementTime;
	}
	public void setProcurementTime(Date procurementTime) {
		this.procurementTime = procurementTime;
	}
	public SupplierInfo getSupplier() {
		return supplier;
	}
	public void setSupplier(SupplierInfo supplier) {
		this.supplier = supplier;
	}
	public EmpInfo getEmp() {
		return emp;
	}
	public void setEmp(EmpInfo emp) {
		this.emp = emp;
	}
	public String getProcuremenRemark() {
		return procuremenRemark;
	}
	public void setProcuremenRemark(String procuremenRemark) {
		this.procuremenRemark = procuremenRemark;
	}
	
	public Set<GoodsInfo> getGoods() {
		return goods;
	}
	public void setGoods(Set<GoodsInfo> goods) {
		this.goods = goods;
	}
	public ProcurementInfo() {
	}
	public ProcurementInfo(String procurementId, Date procurementTime,
			SupplierInfo supplier, EmpInfo emp, String procuremenRemark,
			Set<GoodsInfo> goods) {
		super();
		this.procurementId = procurementId;
		this.procurementTime = procurementTime;
		this.supplier = supplier;
		this.emp = emp;
		this.procuremenRemark = procuremenRemark;
		this.goods = goods;
	}
	
}
