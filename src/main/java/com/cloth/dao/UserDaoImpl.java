package com.cloth.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import com.cloth.entity.MenuType;
import com.cloth.entity.UserInfo;

@Repository
public class UserDaoImpl extends HibernateDaoSupport implements IUserDao {
	
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 查询单个用户
	 */
	public UserInfo selectOneByUserId(String userId) {
		return (UserInfo) this.getSessionFactory().getCurrentSession().get(UserInfo.class, userId);
	}
	/**
	 * 登陆
	 */
	public UserInfo login(UserInfo user) {
		Session session=getSessionFactory().getCurrentSession();
		try {
			return (UserInfo) session.createQuery("from UserInfo user where user.userName=? and user.userPwd=? and user.userStatus=1").setString(0, user.getUserName()).setString(1,user.getUserPwd()).uniqueResult();		
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * 查询菜单
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<MenuType> getMenu(String roleId){
		List<MenuType> list=new ArrayList<MenuType>();
		Session session=this.getSessionFactory().getCurrentSession();
		//list=session.createQuery("select  from MenuInfo mi where mi.menuId in (select mr.menu.menuId from MenuRoleInfo mr where mr.role.roleId=?)").setString(0, roleId).list();
		list=session.createQuery("select distinct mt from MenuType mt join fetch mt.menu m where m.menuId in (select mr.menu.menuId from MenuRoleInfo mr where mr.role.roleId=?)").setString(0, roleId).list();
		/*for (MenuType menuType : list) {
			System.out.println(menuType.getMenuTypeName());
			for (MenuInfo info : menuType.getMenu()) {
				System.out.println(info.getMenuName());
			}
		}*/
		return list;
	}

}
