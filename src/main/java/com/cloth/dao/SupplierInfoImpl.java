package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.SupplierInfo;
import com.cloth.util.Pager;

@Repository
@SuppressWarnings("unchecked")
public class SupplierInfoImpl extends HibernateDaoSupport implements ISupplierInfoDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	/**
	 * 分页查询全部
	 */
	public Pager<SupplierInfo> querySelectAll(int pageIndex,int pageSize) {
		
		Pager<SupplierInfo> pager = new Pager<SupplierInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<SupplierInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from SupplierInfo").setFirstResult((pageIndex - 1) * pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from SupplierInfo ").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	/**
	 * 查询全部
	 */
	
	public List<SupplierInfo> selectAll() {
		return this.getSessionFactory().getCurrentSession().createQuery("from SupplierInfo").list();
	}
	/***
	 * 添加
	 */
	public boolean insert(SupplierInfo supplier) {
		try {
			this.getSessionFactory().getCurrentSession().save(supplier);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 查询单个
	 */
	public boolean selectOne(String supplierName, String supplierPeople, String supplierAddress) {
		List<SupplierInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from SupplierInfo s where s.supplierName = :supplierName and s.supplierAddress = :supplierAddress and s.supplierPeople = :supplierPeople")
		.setString("supplierName", supplierName).setString("supplierPeople", supplierPeople).setString("supplierAddress", supplierAddress).list();
		if(list.size() > 0){
			return true;
		}
		return false;
	}
}
