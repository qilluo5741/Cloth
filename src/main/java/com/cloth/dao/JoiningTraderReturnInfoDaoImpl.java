package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.JoiningTraderReturnInfo;
import com.cloth.util.Pager;

@Repository
public class JoiningTraderReturnInfoDaoImpl extends HibernateDaoSupport
		implements IJoiningTraderReturnInfoDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		this.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 	查询单个
	 * */
	public JoiningTraderReturnInfo selectOne(String joiningTraderReturnId) {
		return (JoiningTraderReturnInfo) getSessionFactory().getCurrentSession().get(JoiningTraderReturnInfo.class, joiningTraderReturnId);
	}
	
	/**
	 * 	分页查询所有
	 * */
	@SuppressWarnings("unchecked")
	public Pager<JoiningTraderReturnInfo> selectAllByPager(int pageIndex, int pageSize) {
		Pager<JoiningTraderReturnInfo> pager = new Pager<JoiningTraderReturnInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<JoiningTraderReturnInfo> list = getSessionFactory().getCurrentSession().createQuery("from JoiningTraderReturnInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)getSessionFactory().getCurrentSession().createQuery("select count(*) from JoiningTraderReturnInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	
	/**
	 * 	修改状态
	 * */
	public boolean updateOneByStatus(String joiningTraderReturnId) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update JoiningTraderReturnInfo joinR set joinR.returnStatus = 1 where joinR.joiningTraderReturnId = :joinRId")
			.setString("joinRId", joiningTraderReturnId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 添加单个
	 * */
	public boolean insertOne(JoiningTraderReturnInfo joiningTraderReturn) {
		try {
			getSessionFactory().getCurrentSession().save(joiningTraderReturn);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

}
