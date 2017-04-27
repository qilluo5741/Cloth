package com.cloth.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.MenuInfo;
import com.cloth.entity.MenuRoleInfo;
import com.cloth.entity.MenuType;
import com.cloth.entity.RoleInfo;
import com.cloth.util.Pager;

@Repository
public class JurisdictionDaoImpl extends HibernateDaoSupport implements IJurisdictionDao {
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		this.setSessionFactory(sessionFactory);
	}
	/**
	 * 查询角色
	 */
	@SuppressWarnings("unchecked")
	public List<RoleInfo> getRole() {
		Session session =getSessionFactory().getCurrentSession();
		return session.createQuery("from RoleInfo").list();
	}
	/**
	 * 修改角色
	 * @param role
	 * @return
	 */
	public boolean updateRole(RoleInfo role){
		//得到session
		Session session =getSessionFactory().getCurrentSession();
		try {
			session.update(role);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	/**
	 * 删除角色
	 * @param role
	 * @return
	 */
	public boolean deleteRole(RoleInfo role){
		//得到session
		Session session =getSessionFactory().getCurrentSession();
		try {
			session.delete(role);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public boolean addReole(RoleInfo role){
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		try {
			session.save(role);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	/**
	 * 分页查询菜单分类
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Pager<MenuType> getMenuType(int pageIndex,int pageSize){
		Pager<MenuType> pager=new Pager<MenuType>();
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		pager.setList(session.createQuery("from MenuType").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list());
		pager.setTotalRecords(Integer.parseInt(session.createQuery("select count(*) from MenuType").uniqueResult().toString()));
		pager.setTotalPages();
		return pager;
	}
	/**
	 * 修改菜单类型
	 * @param mt
	 * @return
	 */
	public boolean updateMenuType(MenuType mt){
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		try {
			session.update(mt);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	/**
	 * 添加菜单类型
	 * @param mt
	 * @return
	 */
	public boolean addMenuType(MenuType mt){
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		try {
			session.save(mt);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	/**
	 * 删除菜单类型
	 * @param mt
	 * @return
	 */
	public boolean deleteMenuType(MenuType mt){
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		try { 
			session.delete(mt);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	/**
	 * 查询一个角色下面的菜单
	 * @param role
	 * @return
	 */
	public RoleInfo getReoleMenu(RoleInfo role){
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		return (RoleInfo) session.createQuery("from RoleInfo r left join fetch r.menuRole mr left join fetch mr.menu m left join fetch m.menuType mt   where  r.roleId=?").setString(0,role.getRoleId()).uniqueResult();
	}
	/**
	 * 删除关系表菜单管理
	 * @param r
	 * @return
	 */
	public boolean deleteRoleMenu(RoleInfo r){
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		try {
			if(session.createQuery("delete MenuRoleInfo  mr where mr.rmid=?").setString(0, r.getRoleId()).executeUpdate()>0){
				return true;
			}
			else{
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	/***
	 *根据一个用户 查询用户没有分配的菜单
	 * @param r
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<MenuInfo> getMenuisNoadd(RoleInfo r){
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		return session.createQuery("from MenuInfo m where m.menuId not in (select mr.menu.menuId from MenuRoleInfo mr where mr.role.roleId=?)").setString(0,r.getRoleId()).list();
	}
	/***
	 * 添加角色菜单
	 * @param mr
	 * @return
	 */
	public  boolean addMenuRole(MenuRoleInfo mr){
		///得到session
		Session session =getSessionFactory().getCurrentSession();
		try {
			System.out.println(mr.getRole().getRoleId()+"===="+mr.getMenu().getMenuId());
			session.save(mr);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}
