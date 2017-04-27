package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import com.cloth.entity.MenuInfo;
import com.cloth.util.Pager;
@Repository
public class MenuInfoDaoImpl extends HibernateDaoSupport implements IMenuInfoDao {
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	@SuppressWarnings("unchecked")
	public Pager<MenuInfo> selectAll(int pageIndex, int pageSize) {
		Pager<MenuInfo> pager = new Pager<MenuInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<MenuInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from MenuInfo").setFirstResult((pageIndex - 1) * pageSize + 1).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from MenuInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	@SuppressWarnings("unchecked")
	public List<MenuInfo> selectAllList() {
		return this.getSessionFactory().getCurrentSession().createQuery("from MenuInfo").list();
	}
	public boolean updateMenuInfoBy(MenuInfo Menu) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update MenuInfo Menu set Menu.menuName = :menuName,Menu.href = :href,Menu.target = :target where Menu.menuId=:menuId")
			.setString("menuName",Menu.getMenuName())
			.setString("href", Menu.getHref())
			.setString("target", Menu.getTarget())
			.setString("menuId", Menu.getMenuId())
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	public MenuInfo selectOneMenuInfo(String menuId) {
		return (MenuInfo) getSessionFactory().getCurrentSession().get(MenuInfo.class, menuId);
	}
}
