package com.cloth.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="MenuType")
public class MenuType {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	@Column(length=40)
	private String menuTypeId;
	private String menuTypeName;
	private String remark;
	@OneToMany(cascade={CascadeType.ALL},mappedBy="menuType")
	private Set<MenuInfo> menu;
	public String getMenuTypeId() {
		return menuTypeId;
	}
	public void setMenuTypeId(String menuTypeId) {
		this.menuTypeId = menuTypeId;
	}
	public String getMenuTypeName() {
		return menuTypeName;
	}
	public void setMenuTypeName(String menuTypeName) {
		this.menuTypeName = menuTypeName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Set<MenuInfo> getMenu() {
		return menu;
	}
	public void setMenu(Set<MenuInfo> menu) {
		this.menu = menu;
	}
	
}
