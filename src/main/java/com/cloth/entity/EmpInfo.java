package com.cloth.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
@Entity
@Table
public class EmpInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	private String empId;//--员工编号
    private String empName;//员工姓名
    private String empGender;//员工性别
    private int empAge;//员工年龄
    private String empPhoto;//员工头像
    private String empTel;//员工电话
    private double empSal;//员工工资
    private String empCardNo;//员工身份证号
    private String empAddress;//员工地址
    private String empRemark;//员工备注
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "positionId")
    private PositionInfo position;//员工职位  外键
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private UserInfo user;//用户登录 外键
    private int isServing;//是否在职 
    
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpGender() {
		return empGender;
	}
	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}
	public int getEmpAge() {
		return empAge;
	}
	public void setEmpAge(int empAge) {
		this.empAge = empAge;
	}
	public String getEmpPhoto() {
		return empPhoto;
	}
	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	public double getEmpSal() {
		return empSal;
	}
	public void setEmpSal(double empSal) {
		this.empSal = empSal;
	}
	public String getEmpCardNo() {
		return empCardNo;
	}
	public void setEmpCardNo(String empCardNo) {
		this.empCardNo = empCardNo;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public String getEmpRemark() {
		return empRemark;
	}
	public void setEmpRemark(String empRemark) {
		this.empRemark = empRemark;
	}
	public PositionInfo getPosition() {
		return position;
	}
	public void setPosition(PositionInfo position) {
		this.position = position;
	}
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	public int getIsServing() {
		return isServing;
	}
	public void setIsServing(int isServing) {
		this.isServing = isServing;
	}
}
