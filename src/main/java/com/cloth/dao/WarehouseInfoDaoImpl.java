package com.cloth.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import com.cloth.entity.WarehouseInfo;
import com.cloth.util.Pager;
@Repository
public class WarehouseInfoDaoImpl extends HibernateDaoSupport implements IWarehouseInfoDao {
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	@SuppressWarnings("unchecked")
	public Pager<WarehouseInfo> selectAll(int pageIndex, int pageSize) {
		Pager<WarehouseInfo> pager=new Pager<WarehouseInfo>();
		//设置当前页数
		pager.setPageIndex(pageIndex);
		//设置每页的大小
		pager.setPageSize(pageSize);
		List<WarehouseInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from WarehouseInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from WarehouseInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	@SuppressWarnings("unchecked")
	public List<WarehouseInfo> selectAllList() {
		return this.getSessionFactory().getCurrentSession().createQuery("from WarehouseInfo").list();
	}
	public WarehouseInfo selectOneById(String warehouseId) {
		return (WarehouseInfo) getSessionFactory().getCurrentSession().get(WarehouseInfo.class,warehouseId);
	}
}
