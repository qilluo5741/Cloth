package com.cloth.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table
public class RoleInfo {
	@Id
	@GeneratedValue(generator="uuid_")
	@GenericGenerator(name="uuid_",strategy="uuid")
	private String roleId;
	private String roleName;
	@OneToMany(cascade={CascadeType.ALL},mappedBy="role")
	private Set<MenuRoleInfo> menuRole;
	
	public Set<MenuRoleInfo> getMenuRole() {
		return menuRole;
	}
	public void setMenuRole(Set<MenuRoleInfo> menuRole) {
		this.menuRole = menuRole;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public RoleInfo() {
	}
	public RoleInfo(String roleId, String roleName) {
		this.roleId = roleId;
		this.roleName = roleName;
	}
}
