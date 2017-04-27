package com.cloth.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.SalesRecordInfo;
import com.cloth.util.Pager;

@Repository
public class SalesRecordDaoImpl extends HibernateDaoSupport implements ISalesRecordDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		this.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 分页查询所有
	 * */
	@SuppressWarnings("unchecked")
	public Pager<SalesRecordInfo> selectAllByPager(int pageIndex, int pageSize) {
		Pager<SalesRecordInfo> pager = new Pager<SalesRecordInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<SalesRecordInfo> list = getSessionFactory().getCurrentSession().createQuery("from SalesRecordInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)getSessionFactory().getCurrentSession().createQuery("select count(*) from SalesRecordInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	/**
	 * 查询全部
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SalesRecordInfo> queryAllSalesRecordInfo() {
		return this.getSessionFactory().getCurrentSession().createQuery("from SalesRecordInfo").list();
	}
	
	/**
	 * 	添加单个
	 * */
	public boolean insertOne(SalesRecordInfo salesRecord) {
		try {
			salesRecord.setSalesRecordTime(new Date());
			getSessionFactory().getCurrentSession().save(salesRecord);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
