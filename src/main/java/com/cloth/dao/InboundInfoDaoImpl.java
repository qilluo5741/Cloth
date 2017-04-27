package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.InboundInfo;
import com.cloth.util.Pager;


@SuppressWarnings("unchecked")
@Repository
public class InboundInfoDaoImpl extends HibernateDaoSupport implements IInboundInfoDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		this.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 添加
	 */
	public boolean insert(InboundInfo inbound) {
		try {
			this.getSessionFactory().getCurrentSession().save(inbound);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 分页
	 */
	public Pager<InboundInfo> querySelectAll(int pageIndex, int pageSize) {
		Pager<InboundInfo> pager = new Pager<InboundInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<InboundInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from InboundInfo").setFirstResult((pageIndex -1) * pageSize).setMaxResults(pageSize).list(); 
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from InboundInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	/**
	 * 查询所有
	 */
	public List<InboundInfo> selectList() {
		return this.getSessionFactory().getCurrentSession().createQuery("from InbooundInfo").list();
	}
}
