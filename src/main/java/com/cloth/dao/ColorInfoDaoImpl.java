package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.ColorInfo;
import com.cloth.util.Pager;

@Repository
public class ColorInfoDaoImpl extends HibernateDaoSupport implements IColorInfoDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	/**
	 * 查询全部
	 */
	@SuppressWarnings("unchecked")
	public List<ColorInfo> selectAll() {
		List<ColorInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from ColorInfo").list();
		return list;
	}

	
	/**
	 * 查询单个
	 */
	@SuppressWarnings("unchecked")
	public ColorInfo selectOne(String colorId ) {
		List<ColorInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from ColorInfo color where color.colorId = :colorId")
		.setString("colorId", colorId).list();
		ColorInfo color = null;
		if(list.size() > 0){
			color = list.get(0);
		}
		return color;
	}
	

	/**
	 * 添加
	 * @param color
	 * @return
	 */
	public boolean insertColorInfo(ColorInfo color){
		try {
			this.getSessionFactory().getCurrentSession().save(color);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 根据颜色码查询
	 */
	@SuppressWarnings("unchecked")
	public ColorInfo selectName(String colorNo) {
		List<ColorInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from ColorInfo color where color.colorNo = :colorNo")
		.setString("colorNo", colorNo).list();
		ColorInfo color = null;
		if(list.size() > 0){
			color = list.get(0);
		}
		return color;
	}
	
	/**
	 * 分页查询
	 */
	@SuppressWarnings("unchecked")
	public Pager<ColorInfo> querySelectAll(int pageIndex, int pageSize) {
		Pager<ColorInfo> pager = new Pager<ColorInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<ColorInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from ColorInfo").setFirstResult((pageIndex - 1) * pageSize + 1).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from ColorInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
}
