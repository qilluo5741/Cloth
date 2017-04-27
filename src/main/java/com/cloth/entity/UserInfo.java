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
@Table
public class UserInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	private String userId;
	private String userName;
	private String userPwd;
	private String userStatus;
	private Date userTime;
	private String userRemark;
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "roleId")
	private RoleInfo role;
	@OneToMany(cascade={CascadeType.ALL},fetch=FetchType.LAZY)
    private Set<EmpInfo> emp;
	public Set<EmpInfo> getEmp() {
		return emp;
	}
	public void setEmp(Set<EmpInfo> emp) {
		this.emp = emp;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public Date getUserTime() {
		return userTime;
	}
	public void setUserTime(Date userTime) {
		this.userTime = userTime;
	}
	public String getUserRemark() {
		return userRemark;
	}
	public void setUserRemark(String userRemark) {
		this.userRemark = userRemark;
	}
	public RoleInfo getRole() {
		return role;
	}
	public void setRole(RoleInfo role) {
		this.role = role;
	}
	public UserInfo() {
	}
	
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	/*public UserInfo(String userId, String userName, String userPwd,
			Date userTime, String userRemark, RoleInfo role) {
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userTime = userTime;
		this.userRemark = userRemark;
		this.role = role;
	}*/
	public UserInfo(String userId, String userName, String userPwd,
			String userStatus, Date userTime, String userRemark, RoleInfo role,
			Set<EmpInfo> emp) {
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userStatus = userStatus;
		this.userTime = userTime;
		this.userRemark = userRemark;
		this.role = role;
		this.emp = emp;
	}
}
