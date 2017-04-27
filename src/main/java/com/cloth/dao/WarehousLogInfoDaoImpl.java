package com.cloth.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.WarehousLogInfo;
import com.cloth.util.Pager;
@Repository
public class WarehousLogInfoDaoImpl extends HibernateDaoSupport implements IWarehousLogInfoDao {
	
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	public Pager<WarehousLogInfo> selectAll(int pageIndex, int pageSize) {
		Pager<WarehousLogInfo> pager=new Pager<WarehousLogInfo>();
		//设置当前页数
		pager.setPageIndex(pageIndex);
		//设置每页的大小
		pager.setPageSize(pageSize);
		List<WarehousLogInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from WarehousLogInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from WarehousLogInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	@SuppressWarnings("unchecked")
	public List<WarehousLogInfo> selectAllList() {
		return this.getSessionFactory().getCurrentSession().createQuery("from WarehousLogInfo").list();
	}
}
