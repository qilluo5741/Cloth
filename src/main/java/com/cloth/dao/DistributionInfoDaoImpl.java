package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.DistributionInfo;
import com.cloth.util.Pager;

@Repository
@SuppressWarnings("unchecked")
public class DistributionInfoDaoImpl extends HibernateDaoSupport implements IDistributionInfoDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 添加
	 */
	public boolean insert(DistributionInfo distribution) {
		try {
			this.getSessionFactory().getCurrentSession().save(distribution);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 分页
	 */
	public Pager<DistributionInfo> querySelectAll(int pageIndex, int pageSize) {
		Pager<DistributionInfo> pager = new Pager<DistributionInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<DistributionInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from DistributionInfo")
		.setFirstResult((pageIndex - 1) * pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from DistributionInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	/**
	 * 查询所有
	 */
	public List<DistributionInfo> selectListAll() {
		return this.getSessionFactory().getCurrentSession().createQuery("from DistributionInfo").list();
	}

	/**
	 * 查询单个
	 */
	public DistributionInfo selectOne(String distributionId) {
		List<DistributionInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from DistributionInfo dis where dis.distributionId = :distributionId")
		.setString("distributionId", distributionId).list();
		DistributionInfo dis = null;
		if(list.size()>0){
			dis = list.get(0);
		}
		return dis;
	}

	/**
	 * 
	 * 验收
	 */
	public boolean updateIsAcceptance(String distributionId,int isAcceptance) {
		Query query = this.getSessionFactory().getCurrentSession().createQuery("update DistributionInfo set isAcceptance = :isAcceptance where  distributionId = :distributionId ").setInteger("isAcceptance", isAcceptance).setString("distributionId", distributionId);
		if(query.executeUpdate() > 0){
			return true;
		}
		return false;
	}
}
