package com.cloth.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 加盟商
 * @author Administrator
 *
 */
@Entity
@Table(name="JoiningTraderInfo")
public class JoiningTraderInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=36)
	private String joiningTraderId;
	private int isSubsidiary;//-- 0   1    0 代表子公司  1  代表加盟商
	private int joiningTraderNo;//--第几期加盟---------------------------------------
	private double joiningTraderYear;//--年限
	private String joiningTraderTime;//--加盟时间------------------------------------
	private double joiningTraderMoney;//--加盟资金
	private String joiningTraderTel;//加盟商联系方式
	private int joiningTraderStatus;//加盟状态---------------------------------------
	private int joiningWarning;//加盟提醒0,1，提醒管理员该加盟商期限时间---------------
	private String joiningTraderPeople;//联系人
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="userId")
	private UserInfo user;//加盟商对的用户-------------------------------------------
	private String joiningTraderAddress;//--加盟商所在地点
	private String joiningTraderName;//--加盟名字
	public String getJoiningTraderId() {
		return joiningTraderId;
	}
	public void setJoiningTraderId(String joiningTraderId) {
		this.joiningTraderId = joiningTraderId;
	}
	public int getIsSubsidiary() {
		return isSubsidiary;
	}
	public void setIsSubsidiary(int isSubsidiary) {
		this.isSubsidiary = isSubsidiary;
	}
	public int getJoiningTraderNo() {
		return joiningTraderNo;
	}
	public void setJoiningTraderNo(int joiningTraderNo) {
		this.joiningTraderNo = joiningTraderNo;
	}
	public double getJoiningTraderYear() {
		return joiningTraderYear;
	}
	public void setJoiningTraderYear(double joiningTraderYear) {
		this.joiningTraderYear = joiningTraderYear;
	}
	public String getJoiningTraderTime() {
		return joiningTraderTime;
	}
	public void setJoiningTraderTime(String joiningTraderTime) {
		this.joiningTraderTime = joiningTraderTime;
	}
	public double getJoiningTraderMoney() {
		return joiningTraderMoney;
	}
	public void setJoiningTraderMoney(double joiningTraderMoney) {
		this.joiningTraderMoney = joiningTraderMoney;
	}
	public String getJoiningTraderTel() {
		return joiningTraderTel;
	}
	public void setJoiningTraderTel(String joiningTraderTel) {
		this.joiningTraderTel = joiningTraderTel;
	}
	public int getJoiningTraderStatus() {
		return joiningTraderStatus;
	}
	public void setJoiningTraderStatus(int joiningTraderStatus) {
		this.joiningTraderStatus = joiningTraderStatus;
	}
	public String getJoiningTraderPeople() {
		return joiningTraderPeople;
	}
	public void setJoiningTraderPeople(String joiningTraderPeople) {
		this.joiningTraderPeople = joiningTraderPeople;
	}
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	public String getJoiningTraderAddress() {
		return joiningTraderAddress;
	}
	public String getJoiningTraderName() {
		return joiningTraderName;
	}
	public void setJoiningTraderName(String joiningTraderName) {
		this.joiningTraderName = joiningTraderName;
	}
	public void setJoiningTraderAddress(String joiningTraderAddress) {
		this.joiningTraderAddress = joiningTraderAddress;
	}
	
	public int getJoiningWarning() {
		return joiningWarning;
	}
	public void setJoiningWarning(int joiningWarning) {
		this.joiningWarning = joiningWarning;
	}
	public JoiningTraderInfo() {
	}
	public JoiningTraderInfo(String joiningTraderId, int isSubsidiary,
			int joiningTraderNo, double joiningTraderYear,
			String joiningTraderTime, double joiningTraderMoney,
			String joiningTraderTel, int joiningTraderStatus,
			int joiningWarning, String joiningTraderPeople, UserInfo user,
			String joiningTraderAddress, String joiningTraderName) {
		super();
		this.joiningTraderId = joiningTraderId;
		this.isSubsidiary = isSubsidiary;
		this.joiningTraderNo = joiningTraderNo;
		this.joiningTraderYear = joiningTraderYear;
		this.joiningTraderTime = joiningTraderTime;
		this.joiningTraderMoney = joiningTraderMoney;
		this.joiningTraderTel = joiningTraderTel;
		this.joiningTraderStatus = joiningTraderStatus;
		this.joiningWarning = joiningWarning;
		this.joiningTraderPeople = joiningTraderPeople;
		this.user = user;
		this.joiningTraderAddress = joiningTraderAddress;
		this.joiningTraderName = joiningTraderName;
	}
}
